import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_auth/video_player.dart';

import '../../Providers/auth_provider.dart';
import '../../const/reusable_component.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<AuthProvider>(context, listen: true);
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                buildRowDisplayText("Signup", context),
                SizedBox(height: 130.h),
                // Image.asset("assets/prepgyanlogo.jpg", fit: BoxFit.cover),
                SizedBox(height: 20.h),
                buildTextFieldInput(
                  "Name",
                  nameController,
                  validator: (p0) {
                    // ignore: unnecessary_null_comparison
                    if (p0!.isEmpty || p0 == null) {
                      return "Please fill name";
                    }
                    return null;
                  },
                ),
                buildTextFieldInput(
                  "Last Name",
                  lastController,
                  validator: (p0) {
                    if (p0!.isEmpty || p0 == null) {
                      return "Please fill last name";
                    }
                    return null;
                  },
                ),
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
                  "Contact",
                  contactController,
                  maxlength: 10,

                  txkeyboardType: TextInputType.number,
                  validator: (p0) {
                    if (p0!.isEmpty || p0 == null) {
                      return "Please fill contact";
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
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
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
                  child: Text(
                    "By Signing up you Agree & Accept our Terms of Use & Privacy Policy",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xff7C7C7C),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17.w),
                  child: Row(
                    children: [
                      buildButton2("Cancel", () {
                        Navigator.pop(context);
                      }, width: 190.w),
                      const Spacer(),
                      buildButton("Signup", () async {
                        if (_formKey.currentState!.validate()) {
                          EasyLoading.show(
                            maskType: EasyLoadingMaskType.black,
                            status: 'loading...',
                          );
                          String value = await item.getSchoolCode();
                          bool result = await item.signup(
                              nameController.value.text,
                              lastController.value.text,
                              emailController.value.text,
                              contactController.value.text,
                              passwordController.value.text,
                              value);

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
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
