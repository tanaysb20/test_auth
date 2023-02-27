import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_auth/Authentication/login_screen.dart';
import 'package:test_auth/Authentication/signup.dart';

import '../../const/reusable_component.dart';

class SignupAndLoginWelcomeScreen extends StatefulWidget {
  const SignupAndLoginWelcomeScreen({super.key});

  @override
  State<SignupAndLoginWelcomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignupAndLoginWelcomeScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("object");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 140.h),
              // Image.asset("assets/prepgyanlogo.jpg", fit: BoxFit.cover),
              SizedBox(height: 130.h),
              buildButton("Login with Email", () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ));
              }),
              SizedBox(height: 10.h),
              Text(
                "or",
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 10.h),
              buildButton2("Signup", () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const SignUp();
                  },
                ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
