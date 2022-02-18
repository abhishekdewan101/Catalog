import 'package:flutter/material.dart';

class TextFieldWithError extends StatelessWidget {
  late TextEditingController textEditingController;
  late TextStyle textStyle;
  late String errorText;
  late TextStyle errorStyle;
  late TextStyle hintStyle;
  late String hintText;
  late bool showError;
  late bool obsurceText;

  TextFieldWithError({
    Key? key,
    required this.textEditingController,
    required this.errorText,
    required this.textStyle,
    required this.errorStyle,
    required this.showError,
    required this.hintText,
    required this.hintStyle,
    required this.obsurceText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: obsurceText,
          controller: textEditingController,
          style: textStyle,
          decoration: InputDecoration(
              filled: true,
              fillColor: theme.colorScheme.onBackground.withAlpha(20),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              hintStyle: hintStyle,
              hintText: hintText),
        ),
        showError
            ? Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  errorText,
                  style: errorStyle,
                ),
              )
            : Container()
      ],
    );
  }
}
