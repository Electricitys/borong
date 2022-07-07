import 'package:borong/widgets/contra/button_solid.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/login_input_email_text.dart';
import 'package:borong/widgets/contra/login_input_password_text.dart';
import 'package:borong/widgets/contra/rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = 'SignUp Screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                color: ContraColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 24,
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Hero(
                            tag: "logo_mark",
                            child: SvgPicture.asset(
                              "assets/icons/logo_mark.svg",
                              height: 75,
                              width: 75,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: <Widget>[
                        const ContraText(
                          text: "Register",
                          alignment: Alignment.centerLeft,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          "You have chance to create new account if you really want to.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 21,
                              color: ContraColors.trout,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const LoginEmailText(
                          text: "Full Name",
                          iconPath: "assets/icons/user.svg",
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const LoginEmailText(
                          text: "Email address",
                          iconPath: "assets/icons/mail.svg",
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const LoginPasswordText(
                          text: "..........",
                          iconPath: "assets/icons/lock.svg",
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        ButtonSolid(
                          color: ContraColors.woodSmoke,
                          textColor: ContraColors.white,
                          rightIcon:
                              ButtonSolid.Icon("assets/icons/arrow_next.svg"),
                          text: "Sign up",
                          callback: () {},
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        CustomRichText(
                          alignment: Alignment.center,
                          textOne: "Already have account? ",
                          textSecond: "Login here",
                          textSecoundOnTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
