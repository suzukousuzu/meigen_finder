import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      // 背景透過のため
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.4)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // View本体
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
