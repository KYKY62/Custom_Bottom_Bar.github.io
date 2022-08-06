import 'package:custom_bottomappbar/Pages/dashboard_page.dart';
import 'package:flutter/material.dart';

class FloatingWidget extends StatefulWidget {
  @override
  _FloatingWidgetState createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  late Animation rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset.fromDirection(getRadiansFromDegree(320),
              degOneTranslationAnimation.value * 100),
          child: Transform(
            transform:
                Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))
                  ..scale(degOneTranslationAnimation.value),
            alignment: Alignment.center,
            child: CircularButton(
              color: Color(0xffFD3C4A),
              width: 50,
              height: 50,
              iconImage: "assets/icon_income.png",
              onPress: () {
                print('First Button');
              },
            ),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(getRadiansFromDegree(270),
              degTwoTranslationAnimation.value * 100),
          child: Transform(
            transform:
                Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))
                  ..scale(degTwoTranslationAnimation.value),
            alignment: Alignment.center,
            child: CircularButton(
              color: Color(0xff0077FF),
              width: 50,
              height: 50,
              iconImage: "assets/icon_convert_currency.png",
              onPress: () {
                print('Second button');
              },
            ),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(getRadiansFromDegree(215),
              degThreeTranslationAnimation.value * 100),
          child: Transform(
            transform:
                Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))
                  ..scale(degThreeTranslationAnimation.value),
            alignment: Alignment.center,
            child: CircularButton(
              color: Color(0xff00A86B),
              width: 50,
              height: 50,
              iconImage: "assets/icon_expanse.png",
              onPress: () {
                print("Expanse");
              },
            ),
          ),
        ),
        Transform(
          transform:
              Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
          alignment: Alignment.center,
          child: CircularButton(
            color: Colors.red,
            width: 60,
            height: 60,
            iconImage: "assets/icon_add.png",
            onPress: () {
              print("object");
              if (animationController.isCompleted) {
                animationController.reverse();
              } else {
                animationController.forward();
              }
            },
          ),
        )
      ],
    );
  }
}

class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final String iconImage;
  final VoidCallback onPress;

  const CircularButton({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    required this.iconImage,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        width: width,
        height: height,
        child: Image.asset(
          iconImage,
        ),
      ),
    );
  }
}
