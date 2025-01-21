import 'package:event_planning_app/ui/home_screen/home_screen.dart';
import 'package:event_planning_app/ui/home_screen/tabs/widget/custom_elevated_button.dart';
import 'package:event_planning_app/ui/home_screen/tabs/widget/custom_text_field.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("assets/Images/Logo.png", height: height * 0.25),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          AppLocalizations.of(context)!.forgot_password,
                          style: AppStyles.bold16Primary.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColors.primaryLight,
                              decorationColor: AppColors.primaryLight),
                        )),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomElevatedButton(
                    onButtonClick: login,
                    text: AppLocalizations.of(context)!.login),
                SizedBox(
                  height: height * 0.02,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: AppLocalizations.of(context)!
                                  .do_not_have_account +
                              "  ",
                          style: AppStyles.medium16Black),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context)
                                  .pushNamed(RegisterScreen.routeName);
                            },
                          text: AppLocalizations.of(context)!.create_account,
                          style: AppStyles.medium16Primary.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryLight))
                    ])),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                        color: AppColors.primaryLight,
                      ),
                    ),
                    Text(AppLocalizations.of(context)!.or),
                    const Expanded(
                      child: Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomElevatedButton(
                  onButtonClick: () {},
                  borderColor: AppColors.primaryLight,
                  buttonTextStyle: AppStyles.bold20Primary,
                  text: AppLocalizations.of(context)!.login_with_google,
                  backgroundColor: AppColors.transparentColor,
                  icon: Image.asset("assets/Images/google_icon.png"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        HomeScreen.routeName, (Route<dynamic> route) => false);
  }
}
