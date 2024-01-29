import 'package:flutter/material.dart';

class CustomDividerComponent extends StatelessWidget {
  String? text;

  CustomDividerComponent({Key? key, this.text}) : super(key: key);

@override
Widget build(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey,
                height: 4,
              ),
            ),
            if (text != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  text!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            Expanded(
              child: Divider(
                color: Colors.grey,
                height: 4,
              ),
            ),
          ],
        ),
        // Agrega el Padding debajo del Divider
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
        ),
      ],
    ),
  );
}
}