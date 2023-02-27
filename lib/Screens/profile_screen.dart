import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/reusable_component.dart';
import '../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 28.sp,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                TextButton.icon(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      await prefs.clear();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                        builder: (context) {
                          return MyApp();
                        },
                      ), (route) => false);
                    },
                    icon: Icon(Icons.logout, color: Color(0xffDC3545)),
                    label: Text(
                      "Logout",
                      style: TextStyle(
                          color: Color(0xffDC3545),
                          fontSize: 18.sp,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w400),
                    ))
              ],
            ),
            SizedBox(height: 20.h),
            Center(
              child: CircleAvatar(
                radius: 100.sp,
                backgroundImage: AssetImage("assets/prof.jpg"),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: Text(
                "Abraham Mathews",
                style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 28.sp,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 40.h),
            customText("Abraham Mathews"),
            customText("abrahammathews213"),
            customText("abrahammathews@gmail.com"),
            customText("+91987654321"),
          ],
        ),
      ),
    );
  }
}

Widget customText(String text1) {
  return Container(
    height: 70.h,
    margin: EdgeInsets.only(bottom: 20.h),
    alignment: Alignment.centerLeft,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    decoration: BoxDecoration(color: Color(0xffEEEEEE)),
    child: Text(
      text1,
      style:
          TextStyle(color: Colors.black, fontSize: 16.sp, fontFamily: "Mulish"),
    ),
  );
}
