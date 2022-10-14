import 'package:flutter/cupertino.dart';
import 'package:portfolio/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;

  SmallText({
    Key? key,
    required this.text,
    this.color = const Color(0xff808080),
    this.size = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font16 : size,
      ),
    );
  }
}
