import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kolaypara/firebase_options.dart';
import 'package:kolaypara/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:kolaypara/src/repository/authentication_repository/authentication_repository.dart';
import 'src/utils/theme/theme.dart';

//-- VOİD YERİNE FUTURE DENENEBİLİR --
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      //debugShowCheckedModeBanner:,
      defaultTransition:
          Transition.leftToRightWithFade, //sayfa geçiş animasyonu için
      transitionDuration:
          const Duration(milliseconds: 500), //sayfa geçis animasyonu için
      home: const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
