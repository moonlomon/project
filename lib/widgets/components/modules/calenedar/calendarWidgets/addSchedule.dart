//외부 라이브러리
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//내부 디렉토리
import '../../../../../Providers/stores.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: '시작 시간',
                      isTime: true,
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: CustomTextField(
                      label: '종료 시간',
                      isTime: true,
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
    );
  }
}

class CustomTextField extends StatelessWidget {

  const CustomTextField({Key? key, required this.label, required this.isTime})
      : super(key: key);

  final String label;
  final bool isTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: context.watch<CalendarStore>().SUB_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          flex: isTime ? 0 : 1,
          child: TextFormField(
            cursorColor: Colors.grey,
            maxLines: isTime ? 1 : null,
            expands: !isTime,
            keyboardType:
                isTime ? TextInputType.number : TextInputType.multiline,
            inputFormatters: isTime
                ? [
                    FilteringTextInputFormatter.digitsOnly,
                  ]
                : [],
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[300],
              suffixText: isTime ? '시' : null,
            ),
          ),
        )
      ],
    );
  }
}

void onSavePressed() {}