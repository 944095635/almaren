import 'package:almaren/theme/dimensions.dart';
import 'package:flutter/material.dart';

/// 搜索
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: ListView(
        padding: Dimensions.pageAllPadding,
        children: [
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "search something."
            ),
          ),
        ],
      ),
    );
  }
}
