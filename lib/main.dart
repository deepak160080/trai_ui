import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_trai_project/auth/login_screen.dart';
import 'package:new_trai_project/firebase_options.dart';
import 'package:new_trai_project/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Consumer<ThemeProvider>(
       builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Trai App',
          theme: themeProvider.getTheme(context),
          home: const LoginScreen(),
        );
      }
    );
  }
}