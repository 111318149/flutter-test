import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Half-Star Rating')),
        body: Center(child: StarSlider()),
      ),
    );
  }
}

class StarSlider extends StatefulWidget {
  @override
  _StarSliderState createState() => _StarSliderState();
}

class _StarSliderState extends State<StarSlider> {
  double _starValue = 0; // 星星的评分数值

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildStars(_starValue),
    );
  }

  List<Widget> _buildStars(double value) {
    List<Widget> stars = [];
    double starCount = value; // 改为直接使用评分值

    for (int i = 0; i < 5; i++) {
      stars.add(
        GestureDetector(
          onTapDown: (details) {
            setState(() {
              double dx = details.localPosition.dx;
              double starWidth = 70.0;

              if (dx < starWidth / 2) {
                _starValue = i + 0.5; // 左半边点击，增加0.5分
              } else {
                _starValue = i + 1; // 右半边点击，增加1分
              }

              print('Current star count: $_starValue'); // 打印当前的星星数值
            });
          },
          child: Stack(
            children: [
              const Icon(
                Icons.star_border,
                color: Colors.black,
                size: 70, // 星星的尺寸
              ),
              ClipRect(
                clipper: StarClipper(starCount - i),
                child: const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 70, // 星星的尺寸
                ),
              ),
            ],
          ),
        ),
      );
    }

    return stars;
  }
}

class StarClipper extends CustomClipper<Rect> {
  final double starFraction;

  StarClipper(this.starFraction);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * starFraction.clamp(0.0, 1.0), size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}

void main() => runApp(MyApp());
