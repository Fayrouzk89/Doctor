// @dart=2.9
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'AppBinding.dart';
import 'AppLocalizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'DenpendencyInjection.dart';
import 'api/MyHttpOverrides.dart';
import 'globals.dart' as globals;
import 'routes/app_pages.dart';
import 'shared/LocalString.dart';
import 'shared/design/ColorConstants.dart';
import 'theme/theme_data.dart';


String token;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await DenpendencyInjection.init();
  runApp(App());
  configLoading();
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAll();
  }
  void initAll()async
  {

  }

  final ThemeData lightTheme = ThemeData.light().copyWith(
    // Background color of the FloatingCard
    cardColor: Colors.white,
    buttonTheme: ButtonThemeData(
      // Select here's button color
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  // Dark Theme
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    // Background color of the FloatingCard
    cardColor: Colors.grey,
    buttonTheme: ButtonThemeData(
      // Select here's button color
      buttonColor: ColorConstants.greenColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: LoadLang(context),
      builder: (buildContext, snapshot) {

        if((snapshot.hasData)) {
          if(snapshot.data!=null){
            // Return your login here
            return
              GetMaterialApp(
                debugShowCheckedModeBanner: false,
                enableLog: true,

                initialRoute: Routes.SPLASH,
                defaultTransition: Transition.fade,
                getPages: AppPages.routes,
                initialBinding: AppBinding(),
                theme: ThemeConfig.lightTheme,
                // darkTheme: darkTheme,
                //themeMode: ThemeMode.light,
                smartManagement: SmartManagement.keepFactory,
                title: 'Doctor',
                // locale: TranslationService.locale,
                // fallbackLocale: TranslationService.fallbackLocale,
                //  translations: TranslationService(),

                //builder: EasyLoading.init(),
                supportedLocales: [
                  Locale('en', 'US'),
                  Locale('ar', ''),
                ],
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  new FallbackCupertinoLocalisationsDelegate(),
                  //app-specific localization
                  globals.specificLocalizationDelegate

                ],
                locale: globals.specificLocalizationDelegate.overriddenLocale ,
                builder: EasyLoading.init(),
              )
            ;
          }

          // Return your home here
          return Container(color: ColorConstants.darkScaffoldBackgroundColor);
        } else {

          // Return loading screen while reading preferences
          return Center(child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.darkScaffoldBackgroundColor)
          ));
        }
      },
    );
  }

  Future<bool>LoadLang(BuildContext context)async
  {
    await LocalString.LoadLang();
    return true;
  }

}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
  // ..indicatorSize = 45.0
    ..radius = 10.0
  // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = hexToColor('#64DEE0')
    ..textColor = hexToColor('#64DEE0')
  // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
