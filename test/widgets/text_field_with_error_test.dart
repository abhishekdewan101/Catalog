import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mind_palace/widgets/text_field_with_error.dart';

void main() {
  group(
    "TextFieldWithError Test",
    () {
      testWidgets(
        "shows error when showError is true",
        (tester) async {
          TextEditingController controller = TextEditingController();
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: TextFieldWithError(
                    textEditingController: controller,
                    errorText: "Error Text",
                    textStyle: const TextStyle(),
                    errorStyle: const TextStyle(color: Colors.red),
                    showError: true,
                    hintText: "Hint Text",
                    hintStyle: const TextStyle(),
                    obsurceText: false),
              ),
            ),
          );

          expect(find.text("Error Text"), findsOneWidget);
        },
      );

      testWidgets(
        "doesn't show error when showError is false",
        (tester) async {
          TextEditingController controller = TextEditingController();
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: TextFieldWithError(
                    textEditingController: controller,
                    errorText: "Error Text",
                    textStyle: const TextStyle(),
                    errorStyle: const TextStyle(color: Colors.red),
                    showError: false,
                    hintText: "Hint Text",
                    hintStyle: const TextStyle(),
                    obsurceText: false),
              ),
            ),
          );

          expect(find.text("Error Text"), findsNothing);
        },
      );

      testWidgets(
        "textfield is obscure when obscureText is true",
        (tester) async {
          TextEditingController controller = TextEditingController();
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: TextFieldWithError(
                    textEditingController: controller,
                    errorText: "Error Text",
                    textStyle: const TextStyle(),
                    errorStyle: const TextStyle(color: Colors.red),
                    showError: false,
                    hintText: "Hint Text",
                    hintStyle: const TextStyle(),
                    obsurceText: true),
              ),
            ),
          );
          final finder = find.byType(TextField);
          final input = tester.firstWidget<TextField>(finder);
          expect(input.obscureText, true);
        },
      );
    },
  );
}
