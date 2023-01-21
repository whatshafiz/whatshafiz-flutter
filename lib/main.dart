import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:whatshafiz/core/constans/app/app_constants.dart';
import 'package:whatshafiz/core/locale/whatshafiz_localization.dart';
import 'package:whatshafiz/core/theme/theme.dart';
import 'package:whatshafiz/view/home_view.dart';
import 'package:provider/provider.dart';

import 'core/injector/injector.dart';
import 'core/theme/app_theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  
  await initializeDependencies();

  runApp(
    EasyLocalization(
        supportedLocales: WhatsHafizLocalization.all,
        path: ApplicationConstants.LANG_ASSET_PATH,
        fallbackLocale: WhatsHafizLocalization.all[0],
        child: const MainPage()),
  );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.setLocale(WhatsHafizLocalization.all[0]);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppThemeProvider()),
        ],
        child: Consumer<AppThemeProvider>(builder: (context, AppThemeProvider themeNotifier, child) {
          return MaterialApp(
            title: 'Glance Dashboard',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const MyHomePage(),
            theme: themeNotifier.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
          );
        }));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
