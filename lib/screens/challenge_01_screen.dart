import 'dart:async';

import 'package:flutter/material.dart';

class Challenge01Screen extends StatefulWidget {
  const Challenge01Screen({Key? key}) : super(key: key);

  @override
  State<Challenge01Screen> createState() => _Challenge01ScreenState();
}

class _Challenge01ScreenState extends State<Challenge01Screen> {
  /// 선(Line)이 현재 왼쪽에 있으면 true, 오른쪽이면 false
  bool _isLeft = true;

  /// 도형 상태: true면 원, false면 사각형
  bool _isCircle = true;

  /// 2초 간격으로 선의 위치를 토글하기 위한 타이머
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // 2초마다 _isLeft를 토글 → AnimatedAlign이 왼쪽 ↔ 오른쪽 이동
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      setState(() {
        _isLeft = !_isLeft;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isCircle ? Colors.white : Colors.black;
    final lineColor = _isCircle ? Colors.black : Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: const Text("challenge 01"),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        color: backgroundColor,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(_isCircle ? 100 : 0),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment:
                      _isLeft ? Alignment.centerLeft : Alignment.centerRight,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  onEnd: () {
                    setState(() {
                      _isCircle = !_isCircle;
                    });
                  },
                  child: Container(
                    width: 10,
                    height: 200,
                    color: lineColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
