
import 'package:get/get.dart';

import '../globals.dart' as globals;
import '../mvc/auth/auth_binding.dart';
import '../mvc/auth/auth_screen.dart';
import '../mvc/auth/login_screen.dart';
import '../mvc/auth/register_screen.dart';
import '../mvc/home/HomeBinding.dart';
import '../mvc/home/HomeScreen.dart';
import '../mvc/lang/lang_binding.dart';
import '../mvc/lang/lang_screen.dart';
import '../mvc/splash/SplashBinding.dart';
import '../mvc/splash/SplashScreen.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [

    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.Lang,
      page: () => LangScreen(),
      binding: LangBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
      children: [
        GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
        GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
        /*
        GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
        GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
        GetPage(name: Routes.Forget, page: () => ForgetScreen()),
        GetPage(name: Routes.Reset, page: () => PasswordScreen()),
        GetPage(name: Routes.NewPassword, page: () => NewPasswordScreen()),
        GetPage(name: Routes.activate, page: () => ActivateScreen()),
        GetPage(name: Routes.Delete, page: () => DeleteScreen()),
        GetPage(name: Routes.DeleteReset, page: () => DeleteResetScreen()),

         */
      ],
    ),
  ];
}
