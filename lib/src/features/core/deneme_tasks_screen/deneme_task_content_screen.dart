// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class TaskContentScreen extends StatefulWidget {
  final String content;

  const TaskContentScreen({Key? key, required this.content}) : super(key: key);

  @override
  _TaskContentScreenState createState() => _TaskContentScreenState();
}

class _TaskContentScreenState extends State<TaskContentScreen> {
  File? _selectedImage;
  String? _selectedImageName;
  final _auth = FirebaseAuth.instance;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
        _selectedImageName = _selectedImage!.path.split('/').last;
      });
    }
  }

  bool get isImageSelected => _selectedImage != null;

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Uyarı'),
        content: const Text('Lütfen resim ekleyiniz.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  void _completeTask() {
    final userUid = _auth.currentUser!.uid;
    final userRef = FirebaseFirestore.instance.collection('Users').doc(userUid);
    // Kullanıcının UID'sini alın

    final taskCollection =
        FirebaseFirestore.instance.collection('Users/$userUid/Tasks');
    taskCollection.add({
      'görevAdı': widget.content,
      'görevTamamlandı': true,
    }).then((value) {
      print('Görev tamamlandı');

      // Görev tamamlandığında kullanıcının görevlerinden kaldırılması
      final userTasksCollection =
          FirebaseFirestore.instance.collection('Users/$userUid/Tasks');
      userTasksCollection
          .where('görevAdı', isEqualTo: widget.content)
          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          final taskDoc = snapshot.docs.first;
          taskDoc.reference.delete().then((_) {
            print('Görev kullanıcının görevlerinden kaldırıldı');

            // Görev tamamlandığında kullanıcının bilgilerinin tutulduğu alana görevi ekleme
            userRef.get().then((doc) {
              if (doc.exists) {
                userRef.update({
                  'completedTasks': FieldValue.arrayUnion([widget.content]),
                }).then((_) {
                  print('Görev kullanıcının bilgilerine eklendi');
                  Get.back(result: widget.content);
                }).catchError((error) {
                  print(
                      'Görev kullanıcının bilgilerine eklenirken hata oluştu: $error');
                  // Hata durumunu işleyebilirsiniz
                });
              } else {
                userRef.set({
                  'completedTasks': [widget.content],
                }).then((_) {
                  print('Kullanıcının belgesi oluşturuldu ve görev eklendi');
                  Get.back(result: widget.content);
                }).catchError((error) {
                  print(
                      'Kullanıcının belgesi oluşturulurken hata oluştu: $error');
                  // Hata durumunu işleyebilirsiniz
                });
              }
            }).catchError((error) {
              print(
                  'Kullanıcının belgesini kontrol ederken hata oluştu: $error');
              // Hata durumunu işleyebilirsiniz
            });
          }).catchError((error) {
            print(
                'Görev kullanıcının görevlerinden kaldırılırken hata oluştu: $error');
            // Hata durumunu işleyebilirsiniz
          });
        }
      });
    }).catchError((error) {
      print('Görev tamamlanırken hata oluştu: $error');
      // Hata durumunu işleyebilirsiniz
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
          color: Colors.black,
        ),
        title: const Text(
          'Görev Detayı',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Text(widget.content)),
          const SizedBox(height: 16),
          const Text(
            'Görev Tamamlama Bildirimi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Kanıt Görseli',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Resim Seç'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Galeriden Seç'),
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  minimumSize: const Size(100, 50),
                ),
                child: const Text(
                  'Resim Ekle',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox(width: 10),
              if (_selectedImageName != null) ...[
                Flexible(
                  child: Text(
                    _selectedImageName!,
                    style: const TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ] else ...[
                const Flexible(
                  child: Text(
                    'Resim Seçilmedi',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                minimumSize: const Size(400, 50),
              ),
              onPressed: isImageSelected ? _completeTask : _showAlertDialog,
              child: Text('Görevi Yap'.toUpperCase()),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
