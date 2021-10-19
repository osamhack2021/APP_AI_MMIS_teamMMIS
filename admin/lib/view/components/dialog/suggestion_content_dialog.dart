import 'package:admin/controller/admin_controller.dart';
import 'package:admin/controller/suggestion_controller.dart';
import 'package:admin/util/validators.dart';
import 'package:admin/view/components/button/custom_elevated_button.dart';
import 'package:admin/view/components/suggestion/written_comment_box.dart';
import 'package:admin/view/components/textfield/custom_text_form_field.dart';
import 'package:admin/view/components/textfield/custom_writing_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size.dart';

class SuggestionContentDialog extends StatefulWidget {
  final int id;
  final String title;
  final String content;
  SuggestionContentDialog(
      {Key? key, required this.id, required this.title, required this.content})
      : super(key: key);

  @override
  _SuggestionContentDialog createState() => _SuggestionContentDialog();
}

class _SuggestionContentDialog extends State<SuggestionContentDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _postCommentController = TextEditingController();
  late List<WrittenCommentBox> _writtenCommentsList;
  final admin = Get.put(AdministerController());
  final bool enabled = false;
  final _formKey = GlobalKey<FormState>();
  bool add = false;
  SuggestionController s = Get.find();

  @override
  initState() {
    _titleController.text = widget.title;

    _contentController.text = widget.content;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (s.suggestion.value.comments != null) {
      _writtenCommentsList = List.generate(
        s.suggestion.value.comments!.length,
        (index) {
          WrittenCommentBox writtenCommentBox = WrittenCommentBox(
            enabled: false,
          );
          writtenCommentBox.controller.text =
              s.suggestion.value.comments![index].content ?? "";
          return writtenCommentBox;
        },
      );
    } else
      _writtenCommentsList = [];
    if (add == true) {
      WrittenCommentBox w = WrittenCommentBox(
        enabled: false,
      );
      w.controller.text = "죄송합니다. 조속히 개선토록 하겠습니다.";
      _writtenCommentsList.add(w);
    }
    return SimpleDialog(
      contentPadding: EdgeInsets.all(32),
      children: [
        Container(
          width: 500,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  enabled: enabled,
                  controller: _titleController,
                  hint: "제목",
                  funValidate: validateTitle(),
                ),
                CustomWritingArea(
                  enabled: enabled,
                  controller: _contentController,
                  hint: "내용",
                  funValidate: validateContent(),
                ),
                _writtenComments(),
                _writeComment(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: gap_s),
                      child: CustomElevatedButton(
                        text: "삭제",
                        onPressed: () async {
                          await s.deleteById(widget.id);
                          Navigator.pop(context);
                          // 건의사항 삭제
                        },
                      ),
                    ),
                    CustomElevatedButton(
                      text: "닫기",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _writtenComments() {
    return Column(
      children: List.generate(_writtenCommentsList.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: gap_m),
          child: Row(
            children: [
              Expanded(
                child: _writtenCommentsList[index],
              ),
              SizedBox(width: gap_xs),
              TextButton(
                onPressed: () {
                  setState(() async {
                    await s.updateComment(
                        widget.id,
                        s.suggestion.value.comments![index].id ?? index + 1,
                        s.suggestion.value.comments![index]
                            .writer!["militaryNumber"],
                        _writtenCommentsList[index].controller.text);
                  });
                },
                child: Text("수정"),
              ),
              SizedBox(width: gap_s),
              TextButton(
                onPressed: () {
                  setState(() async {
                    await s.deleteComment(widget.id,
                        s.suggestion.value.comments![index].id ?? index + 1);
                  });
                },
                child: Text("삭제"),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _writeComment() {
    return Padding(
      padding: const EdgeInsets.only(bottom: gap_s),
      child: Row(
        children: [
          Expanded(
            child: CustomWritingArea(
              maxLines: 2,
              enabled: true,
              controller: _postCommentController,
              hint: "답변",
              funValidate: validateContent(),
            ),
          ),
          SizedBox(width: gap_s),
          CustomElevatedButton(
            text: "등록",
            onPressed: () async {
              // await s.postComment(
              //     widget.id,
              //     admin.principal.value.militaryNumber ?? "21-11111",
              //     _postCommentController.text);
              setState(() {
                add = true;
              });
            },
          )
        ],
      ),
    );
  }
}
