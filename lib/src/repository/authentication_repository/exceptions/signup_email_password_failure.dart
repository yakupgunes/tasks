// ignore_for_file: prefer_const_constructors

class SignUpEmailAndPasswordFailure {
  final String message;

  const SignUpEmailAndPasswordFailure(
      [this.message = "Bilinmeyen bir hata oluştu."]);

  factory SignUpEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case "weak-password":
        return SignUpEmailAndPasswordFailure(
            "Lütfen daha güçlü bir şifre girin.");
      case "invalid-email":
        return SignUpEmailAndPasswordFailure("E-psota geçerli değil.");
      case "email-already-in-use":
        return SignUpEmailAndPasswordFailure(
            "Bu e-posta için bir hesap zaten var.");
      case "operation-not-allowed":
        return SignUpEmailAndPasswordFailure(
            "İşleme izin verilmiyor. Lütfen destek ile iletişime geçiniz.");
      case "user-disabled":
        return SignUpEmailAndPasswordFailure(
            "Bu kullanıcı engellendi. Yardım için lütfen destek ile iletişime geçiniz.");
      default:
        return SignUpEmailAndPasswordFailure();
    }
  }
}
