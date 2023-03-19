import 'package:client_app/providers/auth/provider.dart';
import 'package:client_app/providers/language/provider.dart';
import 'package:client_app/providers/theme/data/dark.dart';
import 'package:client_app/providers/theme/data/light.dart';
import 'package:client_app/providers/theme/provider.dart';
import 'package:client_app/screens/app/app.dart';
import 'package:client_app/screens/app/screens/home/home.dart';
import 'package:client_app/screens/auth/auth.dart';
import 'package:client_app/screens/auth/otp.dart';
import 'package:client_app/screens/auth/profile.dart';
import 'package:client_app/screens/home/homepage.dart';
// import 'package:client_app/screens/modals/promo_modal.dart';
import 'package:client_app/screens/onboarding/intro_page_alt.dart';
import 'package:client_app/screens/order/orederpage.dart';
import 'package:client_app/screens/profile/profilepage.dart';
import 'package:client_app/screens/updatepage/updatepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:client_app/screens/onboarding/intro_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tuple/tuple.dart';
import 'models/user/user.dart';
import 'providers/first_run/provider.dart';
import 'screens/splash/splash.dart';
import 'package:client_app/screens/map/map.dart';

void main() async {
  await Hive.initFlutter();
  runApp(
    MultiProvider(
      providers: [
        //FirstRun Provider
        ChangeNotifierProvider(create: (_) => FirstRunProvider()),

        //theme provider
        ChangeNotifierProxyProvider<FirstRunProvider, ThemeProvider>(
          create: (_) => ThemeProvider(),
          update: (_, firstRun, prev) =>
              prev!.updateDeps(isFirstRun: firstRun.isFirstRun),
        ),

        //Lnaguage Provider

        ChangeNotifierProxyProvider<FirstRunProvider, LanguageProvider>(
          create: (_) => LanguageProvider(),
          update: (_, firstRun, prev) =>
              prev!.updateDeps(isFirstRun: firstRun.isFirstRun),
        ),
      ],
      child: const FalconClient(),
    ),
  );
}

class FalconClient extends StatelessWidget {
  const FalconClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<FirstRunProvider, bool?>(
      selector: (_, firstRun) => firstRun.isFirstRun,
      builder: (context, value, child) {
        bool? _isFirstRun = value;

        return Selector2<ThemeProvider, LanguageProvider,
            Tuple2<ThemeMode?, Locale?>>(
          selector: (_, theme, language) => Tuple2(theme.mode, language.locale),
          builder: (context, value, _) {
            final ThemeMode? _mode = value.item1;
            final Locale? _locale = value.item2;

            return MaterialApp(
              title: "Falcon_ET",
              debugShowCheckedModeBanner: false,
              theme: LIGHT_THEME,
              darkTheme: DARK_THEME,
              themeMode: _mode,
              home: const HomePage(),
              // home: _isFirstRun == null
              //     ? const Updatepage()
              //     : _isFirstRun == true
              //         ? IntroPage()
              //         : Selector<AuthProvider, Tuple2<AuthLoading?, User?>>(
              //             selector: (_, auth) =>
              //                 Tuple2(auth.loading, auth.user),
              //             builder: (con
              //text, value, _) {
              //               final User? _user = value.item2;
              //               final AuthLoading? _loading = value.item1;

              //               if (_loading == AuthLoading.autologin) {
              //                 return const Splash();
              //               }

              //               if (_user == null) {
              //                 return const Auth();
              //               }

              //               return const App();
              //             },
              //           ),
            );
          },
        );
      },
    );
  }
}
