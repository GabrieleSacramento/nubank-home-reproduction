import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nubank_home_reproduction/src/generated/app_localizations.dart';
import 'package:nubank_home_reproduction/src/modules/home/presentation/pages/nubank_home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('pt', ''), // Portuguese
            // Other locales...
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context).appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          home: NubankHomePage()),
    );
  }
}
