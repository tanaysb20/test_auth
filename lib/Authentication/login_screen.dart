import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Providers/auth_provider.dart';
import '../../const/reusable_component.dart';
import '../video_player.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _SignUpState();
}

class _SignUpState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<AuthProvider>(context, listen: true);
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(height: 10.h),
              buildRowDisplayText("Login", context),
              SizedBox(height: 130.h),
              // Image.asset("assets/prepgyanlogo.jpg", fit: BoxFit.cover),
              SizedBox(height: 40.h),
              buildTextFieldInput(
                "Email",
                emailController,
                validator: (p0) {
                  const pattern =
                      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                  final regex = RegExp(pattern);
                  if (p0!.isEmpty || p0 == null) {
                    return "Please fill Email";
                  } else if (!regex.hasMatch(p0)) {
                    return "Please enter validate Email";
                  }
                  return null;
                },
              ),
              buildTextFieldInput(
                "Password",
                passwordController,
                obscureText: true,
                validator: (p0) {
                  if (p0!.isEmpty || p0 == null) {
                    return "Please fill Password";
                  }
                  return null;
                },
              ),
              SizedBox(height: 50.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 17.w),
                child: Row(
                  children: [
                    buildButton2("Cancel", () {
                      Navigator.pop(context);
                    }, width: 190.w),
                    Spacer(),
                    buildButton("Login", () async {
                      if (_formKey.currentState!.validate()) {
                        EasyLoading.show(
                          maskType: EasyLoadingMaskType.black,
                          status: 'loading...',
                        );
                        bool result = await item.login(
                            emailController.value.text,
                            passwordController.value.text);

                        EasyLoading.dismiss();
                        if (result == true) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                            builder: (context) {
                              return const VideoPlayerScreen();
                            },
                          ), (route) => false);
                        } else {}
                      }
                    }, width: 190.w),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
