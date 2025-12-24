import 'package:almaren/page/login/login_page.dart';
import 'package:almaren/widgets/sliver_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:get/get.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      extendBodyBehindAppBar: true,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        SliverSafeArea(
          sliver: SliverToBoxAdapter(
            child: Image.asset(
              "assets/images/intro_bg.jpg",
            ),
          ),
        ),
        SliverBottomWidget(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              10.verticalSpace,
              Text(
                "Almaren\nMessenger",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              10.verticalSpace,
              Text(
                "Powered by Dream.Machine",
                style: TextStyle(fontSize: 16, color: Colors.black38),
              ),
              20.verticalSpace,
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const LoginPage());
                },
                child: Text("Continue with phone"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
