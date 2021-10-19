import 'package:flutter/material.dart';

class WrittenCommentBox extends StatelessWidget {
  final String? hint;
  final funValidate;
  final controller = TextEditingController();
  final enabled;
  final maxLines;

  WrittenCommentBox({
    this.hint,
    this.funValidate,
    this.enabled,
    this.maxLines = 2,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        maxLines: maxLines,
        enabled: enabled,
        validator: funValidate,
        controller: controller,
        decoration: InputDecoration(
            hintText: "$hint",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    );
  }
}
