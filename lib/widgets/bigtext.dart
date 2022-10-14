import 'package:flutter/cupertino.dart';
import 'package:portfolio/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double size;

  BigText({
    Key? key,
    required this.text,
    this.color = const Color(0xff000000),
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontSize: size == 0 ? Dimensions.font20 : size,
      ),
    );
  }
}
