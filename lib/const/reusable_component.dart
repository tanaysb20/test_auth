import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

buildRowDisplayText(String text1, BuildContext context, {bool margin = true}) {
  return Container(
    width: double.infinity,
    child: Row(
      children: [
        if (margin == true) SizedBox(width: 18.w),
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Color(0xff000000))),
        if (margin == true) SizedBox(width: 18.w),
        Text(
          text1,
          style: TextStyle(
              color: Color(0xff000000),
              fontSize: 28.sp,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w700),
        )
      ],
    ),
  );
}

buildTextFieldInput(String hintText, TextEditingController controller,
    {double? inputLabelWidth,
    double? inputFieldWidth,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
    bool isRequired = false,
    TextInputType? txkeyboardType,
    int? maxlength,
    bool isEnabled = true,
    FocusNode? focusNode,
    bool? obscureText}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      if (inputFieldWidth != 0)
        Container(
          width: inputFieldWidth,
          decoration: BoxDecoration(
            color: (isEnabled == false)
                ? Colors.grey.shade100
                : Colors.grey.shade100,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 18.0.w),
            child: TextFormField(
              focusNode: focusNode,
              maxLength: maxlength,
              keyboardType: txkeyboardType ?? TextInputType.name,
              obscureText: obscureText ?? false,
              enabled: isEnabled,
              controller: controller,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Mulish"),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  hintText: hintText,
                  hintStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Mulish"),
                  fillColor: Colors.grey.shade100,
                  filled: true),
              validator: validator,
              inputFormatters: inputFormatters,
            ),
          ),
        ),
    ],
  );
}

buildButton(String text1, Function() fun, {double? width}) {
  return SizedBox(
    width: width ?? 350.w,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff002333),
          padding: EdgeInsets.symmetric(horizontal: 30.9.w, vertical: 9),
        ),
        onPressed: fun,
        child: Text(
          text1,
          style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
        )),
  );
}

buildButton2(String text1, Function() fun, {double? width}) {
  return SizedBox(
    width: width ?? 350.w,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        side: BorderSide(color: Color(0xff002333)),
        padding: EdgeInsets.symmetric(horizontal: 30.9.w, vertical: 9),
      ),
      onPressed: fun,
      child: Text(
        text1,
        style: TextStyle(
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff002333)),
      ),
    ),
  );
}
