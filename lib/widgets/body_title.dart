import 'package:flutter/material.dart';

/// 页面大标题
class BodyTitle extends StatelessWidget {
  const BodyTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
