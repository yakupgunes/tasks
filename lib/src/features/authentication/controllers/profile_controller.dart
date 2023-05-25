import 'package:get/get.dart';
import 'package:kolaypara/src/constants/text_strings.dart';
import 'package:kolaypara/src/features/authentication/models/user_model.dart';
import 'package:kolaypara/src/repository/authentication_repository/authentication_repository.dart';
import 'package:kolaypara/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  /// Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  /// Get User Email and Password to UserRepository to fetch user record.
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar(tgetUserData1, tgetUserData2);
    }
  }

  /// Fetch List of User Record.
  Future<List<UserModel>> getAllUser() async => await _userRepo.allUser();

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
