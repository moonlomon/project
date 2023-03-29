//외부 라이브러리
// import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

//내부 디렉토리
import 'package:project/widgets/components/modules/calenedar/calendarWidgets/textFeild.dart';

import '../../../../../Providers/stores.dart';


class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key, required this.selectedDate}) : super(key: key);

  final DateTime selectedDate;

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {

  final GlobalKey<FormState> formKey = GlobalKey();

  late int startTime;
  late int endTime;
  late String content;

  @override
  Widget build(BuildContext context) {

    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Form(
      key: formKey,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 + bottomInset,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
                left: 8,
                right: 8,
                top: 8,
                bottom: bottomInset + 8
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: '시작 시간',
                        isTime: true,
                        onSaved: (String? val) {
                          startTime = int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: CustomTextField(
                        label: '종료 시간',
                        isTime: true,
                        onSaved: (String? val) {
                          endTime = int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Expanded(
                  child: CustomTextField(
                    label: '내용',
                    isTime: false,
                    onSaved: (String? val) {
                      content = val!;
                    },
                    validator: contentValidator,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: onSavePressed,
                    style: OutlinedButton.styleFrom(
                        primary: context.watch<CalendarStore>().DARK_GREY_COLOR,
                        side: BorderSide(
                            color: context.watch<CalendarStore>().FRIMARY_COLOR,
                            width: 2
                        )
                    ),
                    child: Text('저장', style: TextStyle(
                        color: context.watch<CalendarStore>().SUB_COLOR,
                        fontWeight: FontWeight.w600
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed() {
    var lst = Provider.of<CalendarStore>(context, listen: false).lst;

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      lst.add(
        CardModel(
          key: lst.length + 1,
          date: widget.selectedDate,
          startTime: startTime,
          endTime: endTime,
          content: content,
        )
      );

      // Provider.of<CalendarStore>(context).lst.add(
      //   CardModel(key: 1, date: widget.selectedDate, startTime: startTime, endTime: endTime, content: content,)
      // );

      print("${widget.selectedDate} 데이터 저장완료");
      print("$lst");

      // Navigator.of(context).pop();
      Get.back();
    }
  }

  String? timeValidator(String? val) {
    if (val == null) {
      return "값을 입력하세요";
    }

    int? number;

    try {
      number = int.parse(val);
    } catch (e) {
      return "숫자를 입력하세요";
    }

    if (number < 0 || number > 24) {
      return "0시부터 24시 사이를 입력하세요";
    }

    return null;

  }

  String? contentValidator(String? val) {
    if (val == null || val.isEmpty) {
      return "값을 입력해주세요";
    }
    return null;
  }
}