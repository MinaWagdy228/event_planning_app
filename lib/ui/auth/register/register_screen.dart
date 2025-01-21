import 'package:event_planning_app/ui/auth/login/login_screen.dart';
import 'package:event_planning_app/ui/home_screen/home_screen.dart';
import 'package:event_planning_app/ui/home_screen/tabs/widget/custom_elevated_button.dart';
import 'package:event_planning_app/ui/home_screen/tabs/widget/custom_text_field.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.register,
            style: AppStyles.medium16Black,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("assets/Images/Logo.png", height: height * 0.25),
                CustomTextField(
                    prefixIcon: Image.asset("assets/Images/name_icon.png"),
                    hintText: AppLocalizations.of(context)!.name),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                    prefixIcon: Image.asset("assets/Images/email_icon.png"),
                    hintText: AppLocalizations.of(context)!.email),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  isObscureText: true,
                  prefixIcon: Image.asset("assets/Images/password_icon.png"),
                  hintText: AppLocalizations.of(context)!.password,
                  suffixIcon: const Icon(Icons.visibility_off),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTextField(
                  isObscureText: true,
                  prefixIcon: Image.asset("assets/Images/password_icon.png"),
                  hintText: AppLocalizations.of(context)!.re_password,
                  suffixIcon: const Icon(Icons.visibility_off),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomElevatedButton(
                    onButtonClick: register,
                    text: AppLocalizations.of(context)!.create_account),
                SizedBox(
                  height: height * 0.02,
                ),
                RichText(
                  textAlign: TextAlign.center,
                    text: TextSpan(children: [
                  TextSpan(
                      text: AppLocalizations.of(context)!.already_have_account +
                          "  ",
                      style: AppStyles.medium16Black),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        },
                      text: AppLocalizations.of(context)!.login,
                      style: AppStyles.medium16Primary.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryLight))
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }
}
