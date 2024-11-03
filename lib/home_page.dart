import 'package:flutter/material.dart';
import 'package:new_trai_project/auth/auth_services.dart';
import 'package:new_trai_project/auth/login_screen.dart';
import 'package:new_trai_project/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthServices _authService = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  actions: [
    TextButton(
      onPressed: () async {
        try {
          await _authService.signOut();
          if (mounted) {
            // Navigate back to login screen
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
          }
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error signing out: $e'),
              ),
            );
          }
        }
      }, 
      child: const Text("Logout")
    ),
    IconButton(
            icon: Icon(
              Provider.of<ThemeProvider>(context).isDarkMode 
                ? Icons.light_mode 
                : Icons.dark_mode,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
     
  ],
),
      body: const Center(
        child: Text("Welcome to Home Screen"),
      ),
    );
  }
}