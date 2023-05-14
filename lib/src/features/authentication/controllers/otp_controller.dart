import 'package:get/get.dart';
import 'package:kolaypara/src/features/authentication/screens/dashboard/dashboard.dart';
import 'package:kolaypara/src/repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const Dashboard()) : Get.back();
  }
}
