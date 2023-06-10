import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/constants/text_strings.dart';
import 'package:kolaypara/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:kolaypara/src/features/core/mainpage/main_page.dart';
import 'package:kolaypara/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //VARİABLES
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  var email = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

// Uygulama ilk açılış ekranı--
  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen() /*SplashScreen()*/)
        : Get.offAll(() => const MainPage());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'geçersiz-telefon-numarası') {
          Get.snackbar(tphoneAuthentication1, tphoneAuthentication2);
        } else {
          Get.snackbar(tphoneAuthentication1, tphoneAuthentication3);
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  /*Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const MainPage())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailAndPasswordFailure.code(e.code);
      print("Firebase yetkilendirme beklentisi - ${ex.message}");
      throw ex;
    } catch (_) {
      const ex = SignUpEmailAndPasswordFailure();
      print("Beklenti - ${ex.message}");
      throw ex;
    }
    return null;
  }*/

  // --CREATEUSERWİTHEMAİLANDPASSWORD KISMI DEĞİŞTİRİLECEK
  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final existingUser = await FirebaseFirestore.instance
          .collection('Users')
          .where('Email', isEqualTo: email)
          .get();

      if (existingUser.docs.isEmpty) {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        this.email.value = email;

        firebaseUser.value != null
            ? Get.offAll(() => const MainPage())
            : Get.to(() => const WelcomeScreen());
      } else {
        return "Bu e-posta zaten kullanılıyor.";
      }
    } on FirebaseAuthException catch (e) {
      final ex = SignUpEmailAndPasswordFailure.code(e.code);
      print("Firebase yetkilendirme beklentisi - ${ex.message}");
      return ex.message; // Hata mesajını döndür
    } catch (_) {
      const ex = SignUpEmailAndPasswordFailure();
      print("Beklenti - ${ex.message}");
      return ex.message; // Hata mesajını döndür
    }
    return null;
  }

  // Future<String?> loginWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //   } catch (_) {}
  //   return null;
  // }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final errorMessage = e.message;
      print("Firebase yetkilendirme hatası - $errorMessage");
      return errorMessage; // Hata mesajını döndür
    } catch (error) {
      final errorMessage = "Giriş sırasında bir hata oluştu.";
      print("Beklenmeyen bir hata - $error");
      return errorMessage; // Hata mesajını döndür
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();

  //deneme
  // Future<void> logout() async {
  //   await _auth.signOut();

  //   // Gerekli değişkenleri ve işlevleri sıfırla
  //   email.value = '';
  //   // Diğer değişkenleri sıfırlayın

  //   // Giriş ekranına yönlendir
  //   Get.offAll(() => const WelcomeScreen());
  // }
}
