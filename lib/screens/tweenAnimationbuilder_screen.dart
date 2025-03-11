import 'package:flutter/material.dart';

class TweenanimationbuilderScreen extends StatefulWidget {
  const TweenanimationbuilderScreen({super.key});

  @override
  State<TweenanimationbuilderScreen> createState() =>
      _TweenanimationbuilderScreenState();
}

class _TweenanimationbuilderScreenState
    extends State<TweenanimationbuilderScreen> {
  bool _visible = true;

  void _trigger() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("tween Animations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
                tween: ColorTween(
                  begin: Colors.blue,
                  end: Colors.yellow,
                ),
                //tween: Tween(begin: 10.0, end: 20.0),
                curve: Curves.bounceInOut,
                duration: Duration(seconds: 10),
                builder: (context, value, child) {
                  //return Text("$value");
                  return Image.network(
                    "https://miro.medium.com/v2/resize:fit:1400/1*W1aGmyVwe5kKGuyTvzdUEg.png",
                    color: value,
                    colorBlendMode: BlendMode.colorBurn,
                  );
                }),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: _trigger,
              child: Text("go"),
            ),
          ],
        ),
      ),
    );
  }
}
