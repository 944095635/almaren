import 'package:flutter/material.dart';

class CountBoxWidget extends StatelessWidget {
  const CountBoxWidget({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Text(
        count.toString(),
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
      ),
    );
  }
}
