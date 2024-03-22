import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';

class WallPaperPage extends StatefulWidget {
  const WallPaperPage(this.wallpaper, {super.key});

  final String wallpaper;

  @override
  State<WallPaperPage> createState() => _WallPaperPageState();
}

class _WallPaperPageState extends State<WallPaperPage> {
  @override
  Widget build(BuildContext context) {
    Widget? image = PhotoView(
      loadingBuilder: (context, event) => Center(
        child: SizedBox(
          width: 120.0,
          height: 120.0,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            value: (event == null || event.expectedTotalBytes == null)
                ? 0
                : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
          ),
        ),
      ),
      imageProvider: AssetImage(widget.wallpaper),
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
        ),
      ),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: image,
    );
  }
}
