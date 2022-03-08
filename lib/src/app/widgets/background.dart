import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: orientation == Orientation.portrait
          ? SizedBox(
              width: width,
              height: height,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset("assets/images/top1.png", width: width),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset("assets/images/top2.png", width: width),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset("assets/images/bottom1.png", width: width),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset("assets/images/bottom2.png", width: width),
                  ),
                  child
                ],
              ),
            )
          : SizedBox(
              width: width,
              height: height,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  child
                ],
              ),
            )
    );
  }
}
