import 'package:kolaypara/src/constants/text_strings.dart';

class SignUpEmailAndPasswordFailure {
  final String message;

  const SignUpEmailAndPasswordFailure(
      [this.message = tSignUpEmailAndPasswordFailureErrorMessage]);

  factory SignUpEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case "weak-password":
        return const SignUpEmailAndPasswordFailure(
            tSignUpEmailAndPasswordFailure1);
      case "invalid-email":
        return const SignUpEmailAndPasswordFailure(
            tSignUpEmailAndPasswordFailure2);
      case "email-already-in-use":
        return const SignUpEmailAndPasswordFailure(
            tSignUpEmailAndPasswordFailure3);
      case "operation-not-allowed":
        return const SignUpEmailAndPasswordFailure(
            tSignUpEmailAndPasswordFailure4);
      case "user-disabled":
        return const SignUpEmailAndPasswordFailure(
            tSignUpEmailAndPasswordFailure5);
      default:
        return const SignUpEmailAndPasswordFailure();
    }
  }
}
