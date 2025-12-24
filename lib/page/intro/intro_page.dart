import 'package:almaren/widgets/body_safe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/intro_bg.jpg",
          ),
          Expanded(
            child: BodySafeWidget(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Almaren\nMessenger",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                  10.verticalSpace,
                  Text(
                    "Powered by Dream.Machine",
                    style: TextStyle(fontSize: 16, color: Colors.black38),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Continue with phone"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
