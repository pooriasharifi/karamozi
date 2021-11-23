import 'package:flutter/material.dart';

import '../constans.dart';

class bottonWidget extends StatelessWidget {
  final double heightContainer;
  final double widthContainer;
  final bool hasBorder;
  final String title;
  final Color crText;
  final bool customTextCr;
  final Color cr;
  final bool customCr;
  final Border crBorder;
  final bool customBr;
  final bool txtStyle;
  final txTheme;
  const bottonWidget(
      {Key? key,
      required this.heightContainer,
      required this.widthContainer,
      required this.hasBorder,
      required this.title,
      this.crText = Colors.red,
      this.customTextCr = true,
      this.cr = Colors.red,
      this.customCr = true,
      this.crBorder = const Border(),
      this.customBr = true,
      this.txtStyle = true,
      this.txTheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightContainer,
      width: widthContainer,
      decoration: new BoxDecoration(
          color: customCr ? (hasBorder ? bgDark : gr) : cr,
          borderRadius: BorderRadius.circular(17.5),
          border: customBr
              ? (hasBorder
                  ? Border.all(color: gr)
                  : Border.fromBorderSide(BorderSide.none))
              : crBorder),
      child: new Container(
        alignment: Alignment.center,
        child: new Text(title,
            style: txtStyle
                ? (new TextStyle(
                    color: customTextCr
                        ? (hasBorder ? gr : Colors.white)
                        : crText))
                : txTheme),
      ),
    );
  }
}
