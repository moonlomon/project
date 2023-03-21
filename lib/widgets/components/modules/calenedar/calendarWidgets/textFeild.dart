import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:project/providers/stores.dart';
import 'package:provider/provider.dart';

import '../../../../../Providers/stores.dart';


class CustomTextField extends StatelessWidget {

  const CustomTextField({Key? key,
    required this.label,
    required this.isTime,
    required this.onSaved,
    required this.validator
  })
      : super(key: key);

  final String label;
  final bool isTime;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

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
            onSaved: onSaved,
            validator: validator,
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