import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kolaypara/src/features/authentication/models/task_model.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

void fetchTaskModel() {
  firestore.collection('Görevler').get().then((querySnapshot) {
    if (querySnapshot.docs.isNotEmpty) {
      // Görevler varsa listele
      List<TaskModel> tasks = [];
      querySnapshot.docs.forEach((doc) {
        tasks.add(TaskModel.fromSnapshot(doc));
      });
      // Görevleri kullanıcı arayüzünde görüntüle
      // Örneğin, ListView.builder kullanarak listeleyebilirsiniz
    } else {
      // Görevler yoksa uygulama davranışını belirle
    }
  }).catchError((error) {
    print('Görevler getirilirken hata oluştu: $error');
  });
}
