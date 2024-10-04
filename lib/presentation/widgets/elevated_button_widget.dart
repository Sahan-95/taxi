import 'package:flutter/material.dart';

import '../utils/responsive/screen_size.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String buttonTitle;
  const ElevatedButtonWidget(
      {super.key,
      required this.backgroundColor,
      required this.buttonTitle,
      required this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    double screenHeight = displayHeight(context);
    double screenWidth = displayWidth(context);

    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.01),
      child: SizedBox(
          width: screenWidth * 0.4,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide(color: Colors.black, width: 2)
                ),
                elevation: 7,
                shadowColor: Colors.black54,
              ),
              child: Text(buttonTitle))),
    );
  }
}
