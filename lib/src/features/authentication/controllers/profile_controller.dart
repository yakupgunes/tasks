import 'package:get/get.dart';
import 'package:kolaypara/src/repository/authentication_repository/authentication_repository.dart';
import 'package:kolaypara/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Hata", "Devam etmek için giriş yapın");
    }
  }
}
