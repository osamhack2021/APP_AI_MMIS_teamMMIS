import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:like_button/like_button.dart';
import 'package:myapp/model/comments.dart';
import 'package:myapp/user/user_ex.dart';
import 'package:myapp/view/components/button/back_button.dart';
import 'package:myapp/view/pages/subpages/post_picture.dart';
import 'dart:io' as Io;
import 'dart:convert';
import 'package:flutter/services.dart';

class ShowPhotoOfMealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: _buildHeader(context),
          ),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 10 / 10,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return _buildGridViewItem(context, index);
              },
              itemCount: 13,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _base64ex() async {
    ByteData bytes = await rootBundle.load("meal_photos/example_1.jpg");
    var buffer = bytes.buffer;
    String m = base64.encode(Uint8List.view(buffer));
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(Icons.whatshot),
          SizedBox(width: 2.w),
          Text(
            "우리 부대 급식 자랑",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => PostPicture(),
              );
            },
            child: Row(
              children: [
                Icon(Icons.add),
                Text(
                  "게시하기",
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridViewItem(BuildContext context, int index) {
    double _imageWidth = (0.5).sw;
    String image = "meal_photos/example_${index + 1}.jpg";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return MealPictureDialog(context, image, _imageWidth, index + 1);
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              fit: BoxFit.fill,
              width: _imageWidth,
              height: _imageWidth * 0.6,
            ),
            Container(
              padding: EdgeInsets.all(3),
              alignment: Alignment.topLeft,
              width: _imageWidth,
              height: _imageWidth * 0.3,
              child: Row(
                children: [
                  LikeButton(
                    countPostion: CountPostion.right,
                    onTap: onLikeButtonTapped,
                    size: 14,
                    likeCount: 20, //서버에서 받아올 부분
                  ),
                  VerticalDivider(color: Colors.grey),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "제8전투비행단",
                        style: TextStyle(fontSize: 9.sp),
                      ),
                      Text(
                        "2021년 9월 8일 (석식)",
                        style: TextStyle(fontSize: 9.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    print(isLiked);
    return !isLiked;
  }
}

class MealPictureDialog extends StatefulWidget {
  BuildContext context;
  String image;
  double _imageWidth;
  int id;
  MealPictureDialog(this.context, this.image, this._imageWidth, this.id);
  @override
  _MealPictureDialogState createState() =>
      _MealPictureDialogState(context, image, _imageWidth, id);
}

class _MealPictureDialogState extends State<MealPictureDialog> {
  BuildContext context;
  String image;
  double _imageWidth;
  int id;
  _MealPictureDialogState(this.context, this.image, this._imageWidth, this.id);
  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(16),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "8전투비행단",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            "2021년 9월 8일 (석식)",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      titlePadding: const EdgeInsets.all(16),
      children: [
        Image.asset(
          image,
          fit: BoxFit.contain,
          // width: _imageWidth * 1.5,
        ),
        Divider(),
        Row(
          children: [
            Expanded(
              child: TextField(
                  controller: commentController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                      ),
                      hintText: "댓글 입력"),
                  onSubmitted: (value) {
                    setState(() {
                      if (comments[id] != null) {
                        comments[id]!
                            .add({"userName": userName, "comment": value});
                      } else {
                        comments[id] = [
                          {"userName": userName, "comment": value}
                        ];
                      }
                      commentController.clear();
                    });
                  }),
            ),
          ],
        ),
        Divider(),
        if (comments[id] != null)
          ...List.generate(
            comments[id]!.length,
            (index) => Column(
              children: [
                ListTile(
                  title: Text(comments[id]![index]["userName"],
                      style: TextStyle(fontSize: 14.sp)),
                  subtitle: Text(comments[id]![index]["comment"],
                      style: TextStyle(fontSize: 12.sp)),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      child: Text(
                        "삭제",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black54,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          comments[id]!.removeAt(index);
                        });
                      }),
                ),
                Divider(),
              ],
            ),
          ),
        Row(
          children: [
            Spacer(),
            CustomBackButton(text: "돌아가기"),
          ],
        ),
      ],
    );
  }
}
