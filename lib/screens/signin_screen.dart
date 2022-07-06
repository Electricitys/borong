import 'package:borong/screens/main_screen.dart';
import 'package:borong/screens/signup_screen.dart';
import 'package:borong/widgets/contra/button_solid.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/login_input_email_text.dart';
import 'package:borong/widgets/contra/login_input_password_text.dart';
import 'package:borong/widgets/contra/rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = 'SignIn Screen';

  const SignInScreen({Key? key}) : super(key: key);

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
                color: white,
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
                              height: 120,
                              width: 120,
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
                          text: "Login",
                          alignment: Alignment.centerLeft,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const LoginEmailText(
                          text: "Email address",
                          iconPath: "assets/icons/user.svg",
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
                          color: woodSmoke,
                          textColor: white,
                          rightIcon:
                              ButtonSolid.Icon("assets/icons/arrow_next.svg"),
                          text: "Sign in",
                          callback: () {
                            Navigator.pushNamed(context, MainScreen.routeName);
                          },
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        CustomRichText(
                          alignment: Alignment.center,
                          textOne: "You are new? ",
                          textSecond: "Create new",
                          textSecoundOnTap: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
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
