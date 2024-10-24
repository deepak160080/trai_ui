import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trai_ui/auth/responsive_card.dart';
import 'package:trai_ui/responsive/ts.dart';
import 'package:trai_ui/widget/textfield.dart';

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
        }else {
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

enum SocialButtonsLayout { grid, column }

class LoginForm extends StatelessWidget {
  final SocialButtonsLayout socialButtonsLayout;
  final EdgeInsets padding;

  const LoginForm({
    super.key,
    required this.socialButtonsLayout,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLoginFields(),
                const SizedBox(height: 10),
                _buildSocialButtons(),
                const SizedBox(height: 10),
                _buildMobileLoginButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const BrandLogo(),
        const Spacer(),
        Text(
          "Not a member yet? Join",
          style: Ts.semiBold12(),
        )
      ],
    );
  }

  Widget _buildLoginFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Login", style: Ts.bold20()),
        const SizedBox(height: 15),
        const Textfield(text: "Work Email"),
        const SizedBox(height: 10),
        const Textfield(text: "Password"),
        const SizedBox(height: 8),
        Text("Forget password?", style: Ts.medium14()),
        const SizedBox(height: 8),
        PrimaryButton(
          text: 'Login',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSocialButtons() {
    if (socialButtonsLayout == SocialButtonsLayout.grid) {
      return Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SocialButton(
                    text: 'Log in with Google',
                    icon: FontAwesomeIcons.google,
                    color: Colors.red,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: SocialButton(
                    text: 'Log in with Microsoft',
                    icon: FontAwesomeIcons.microsoft,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SocialButton(
                    text: 'Log in with Facebook',
                    icon: Icons.facebook_outlined,
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: SocialButton(
                    text: 'Log in with Apple',
                    icon: Icons.apple,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      // Mobile layout
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SocialButton(
              text: 'Log in with Google',
              icon: FontAwesomeIcons.google,
              color: Colors.red,
              onPressed: () {},
              width: double.infinity,
            ),
            const SizedBox(height: 10),
            SocialButton(
              text: 'Log in with Microsoft',
              icon: FontAwesomeIcons.microsoft,
              onPressed: () {},
              width: double.infinity,
            ),
            const SizedBox(height: 10),
            SocialButton(
              text: 'Log in with Facebook',
              icon: Icons.facebook_outlined,
              color: Colors.blue,
              onPressed: () {},
              width: double.infinity,
            ),
            const SizedBox(height: 10),
            SocialButton(
              text: 'Log in with Apple',
              icon: Icons.apple,
              color: Colors.black,
              onPressed: () {},
              width: double.infinity,
            ),
          ],
        ),
      );
    }
  }

  Widget _buildMobileLoginButton() {
    return SecondaryButton(
      text: 'Login with Mobile Number',
      onPressed: () {},
    );
  }
}

class MarketingContent extends StatelessWidget {
  final bool isCompact;

  const MarketingContent({super.key, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Lorem ipsum dolor sit amet.",
          style: Ts.bold20(),
        ),
        const SizedBox(height: 20),
        const ResponsiveCardContainer(),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed suscipit nunc sit amet elit gravida.",
            style: Ts.bold16(),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key});

  @override
  Widget build(BuildContext context) {
    const double circleSize = 35;
    return SizedBox(
      width: circleSize * 2,
      height: circleSize,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: circleSize,
            height: circleSize,
            decoration: const BoxDecoration(
              color: Color(0xFFFFB800),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            left: circleSize * 0.25,
            child: Text(
              "Trai",
              style: Ts.bold25(),
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fixedSize: const Size.fromHeight(50),
          elevation: 0,
        ),
        child: Text(text, style: Ts.bold16(color: Colors.white)),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          fixedSize: const Size.fromHeight(50),
          elevation: 0,
        ),
        child: Text(text, style: Ts.bold16(color: Colors.black)),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final String text;
  final Color? color;
  final double width;
  final double height;

  const SocialButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
    this.color,
    this.width = 220,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, color: color),
            const SizedBox(width: 12),
            Text(
              text,
              style: Ts.bold16(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}