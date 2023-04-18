import 'package:fl_preferencias/providers/theme_provider.dart';
import 'package:fl_preferencias/screens/screens.dart';
import 'package:fl_preferencias/share_preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.ini();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode),
        ),
      ],
      child: const MyApp(),
    ),

    //const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (__) => const HomeScreen(),
        SettingsScreen.routeName: (__) => const SettingsScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      //theme: Preferences.isDarkmode ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
