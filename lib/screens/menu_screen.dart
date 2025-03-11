import 'package:flutter/material.dart';
import 'package:nomad_animations/screens/implicit_animations_screen.dart';
import 'package:nomad_animations/screens/tweenAnimationbuilder_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  //page 이동
  void _goToPage(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("menu_screen"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _goToPage(
                  context,
                  ImplicitAnimationsScreen(),
                );
              },
              child: Text("Implicit Animations"),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(
                  context,
                  TweenanimationbuilderScreen(),
                );
              },
              child: Text("tween Animations"),
            ),
          ],
        ),
      ),
    );
  }
}
