import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isFlat = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: AnimatedPhysicalModel(
                    curve: Curves.fastOutSlowIn,
                    elevation: _isFlat ? 0 : 6.0,
                    shape: BoxShape.circle,
                    shadowColor: Colors.black,
                    color: Colors.white,
                    duration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isFlat = !_isFlat;
                          });
                        },
                        child: Image.asset("assets/images/splashScreen.png"),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
