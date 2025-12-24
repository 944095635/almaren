import 'package:almaren/widgets/sliver_bottom_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Enter your phone number",
                    style: textTheme.bodyLarge,
                  ),
                  TextField(),
                ],
              ),
            ),
          ),

          SliverBottomWidget.button("Continue"),
        ],
      ),
    );
  }
}
