import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoTextFormField extends StatelessWidget {
  final String text;
  final String? info;
  final enabled;
  final validator;
  final bool? obscureText;
  TextEditingController? controller;
  UserInfoTextFormField({
    required this.text,
    this.info,
    this.enabled,
    this.controller,
    this.validator,
    this.obscureText,
  });
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          obscureText: obscureText!,
          validator: validator,
          enabled: enabled,
          controller: controller,
          decoration: InputDecoration(
            hintText: enabled == true ? "" : info,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black54,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black54,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black54,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black54,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black54,
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
