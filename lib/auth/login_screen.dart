import 'package:flutter/material.dart';
import 'package:trai_ui/auth/widgets/login_form.dart';
import 'package:trai_ui/auth/widgets/marketing_contents.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          const desktopBreakpoint = 1024.0;
          if (constraints.maxWidth >= desktopBreakpoint) {
            return _buildDesktopLayout();
          } else {
            return _buildMobileLayout();
          }
        },
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: const LoginForm(
                socialButtonsLayout: SocialButtonsLayout.grid,
                padding: EdgeInsets.all(20),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const MarketingContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: const LoginForm(
              socialButtonsLayout: SocialButtonsLayout.column,
              padding: EdgeInsets.all(20),
            ),
          ),
          const MarketingContent(isCompact: true),
        ],
      ),
    );
  }
}