import 'package:flutter/material.dart';
import 'dart:math' as math;

class UICornerRadiusPage extends StatefulWidget {
  const UICornerRadiusPage({super.key});

  @override
  State<UICornerRadiusPage> createState() => _UICornerRadiusPageState();
}

class _UICornerRadiusPageState extends State<UICornerRadiusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('圆角效果实现'),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(image: AssetImage('images/professional_pay_from_club_page.png'), fit: BoxFit.cover,),
                  color: Colors.red
              ),
              width: 300,
              height: 100,
            ),
            Text('BoxDecoration'),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('images/professional_pay_from_club_page.png', width: 300, height: 100, fit: BoxFit.cover,),
            ),
            Text('ClipRRect'),
            ClipOval(
              child: Image.asset('images/professional_pay_from_club_page.png', width: 300, height: 100, fit: BoxFit.cover,),
            ),
            Text('ClipOval'),
            ClipPath(
              clipper: StartClipper(),
              child: Container(
                decoration: BoxDecoration(
                  image:  DecorationImage(image: AssetImage('images/professional_pay_from_club_page.png'), fit: BoxFit.cover,),
                ),
                width: 300,
                height: 300,
              ),
            ),
            Text('ClipPath'),
            PhysicalModel(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'images/professional_pay_from_club_page.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Text('PhysicalModel'),
          ],
        ),
      ),
    );
  }
}


class StartClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = size.width / 2;
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    const angle = 2 * math.pi / 5;

    path.moveTo(centerX + radius * math.cos(0), centerY + radius * math.sin(0));
    for (var i = 1; i < 5; i++) {
      path.lineTo(
        centerX + radius * math.cos(angle * i),
        centerY + radius * math.sin(angle * i),
      );
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}