import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import 'const/reusable_component.dart';
import 'main.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<VideoPlayerScreen> {
  final videoPlayerController = VideoPlayerController.network(
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
  );

  late final ChewieController _chewieController;

//     final chewieController = ChewieController(
//   videoPlayerController: videoPlayerController,
//   autoPlay: true,
//   looping: true,
// );

// final playerWidget = Chewie(
//   controller: chewieController,
// );

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      allowFullScreen: true,
      aspectRatio: videoPlayerController.value.aspectRatio * 2,
      // aspectRatio:2/5,
      autoInitialize: true,

      fullScreenByDefault: false,

      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.pause();
    videoPlayerController.pause();
    _chewieController.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.w),
        child: ListView(
          children: [
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(width: 6.w),
                  Expanded(
                    child: Text(
                      "ITI Electrician Trade Practice Test Series - 1st Year (Hindi)",
                      maxLines: 4,
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 18.sp,
                          fontFamily: 'Mulish',
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            // Image.asset("assets/detail.jpg"),
            Container(
              height: 300.h,
              width: double.infinity,
              child: Chewie(
                controller: _chewieController,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Welcome (2mins)",
              style: TextStyle(
                color: Color(0xff002333),
                fontFamily: "Mulish",
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "Video 1/20",
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16.sp,
                  fontFamily: "Mulish"),
            ),
            SizedBox(height: 16.h),
            Text(
              "Lorem ipsum dolor sit amet consectetur adipiscing",
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16.sp,
                  fontFamily: "Mulish"),
            ),
            SizedBox(height: 28.h),
            Row(
              children: [
                buildButton2("Previous", () => null, width: 180.w),
                Spacer(),
                buildButton("Next", () => null, width: 180.w),
              ],
            ),
            SizedBox(height: 35.h),
            TextButton.icon(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  await prefs.clear();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
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
      )),
    );
  }
}
