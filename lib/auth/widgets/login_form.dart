import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trai_ui/auth/widgets/branded_logo.dart';
import 'package:trai_ui/auth/widgets/buttons.dart';
import 'package:trai_ui/responsive/ts.dart';
import 'package:trai_ui/widget/textfield.dart';

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
      return _buildGridSocialButtons();
    } else {
      return _buildColumnSocialButtons();
    }
  }

  Widget _buildGridSocialButtons() {
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
  }

  Widget _buildColumnSocialButtons() {
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

  Widget _buildMobileLoginButton() {
    return SecondaryButton(
      text: 'Login with Mobile Number',
      onPressed: () {},
    );
  }
}