import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterwidgets/widgets/button_widgets.dart';
import 'package:flutterwidgets/widgets/theme_container.dart';
import 'package:flutterwidgets/widgets/wrap_theme.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';

class SucessPage extends StatefulWidget {
  const SucessPage({super.key});

  @override
  State<SucessPage> createState() => _SucessPageState();
}

class _SucessPageState extends State<SucessPage> {
  File? _file;
  Image? _image;
  GlobalKey previewContainer = GlobalKey();
  int originalSize = 800;

  @override
  Widget build(BuildContext context) {
    return WrapTheme(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Sucessful"),
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    RepaintBoundary(
                      key: previewContainer,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            const Text(
                              "suces",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            Image.asset(
                              'assets/images/test.jpg',
                              fit: BoxFit.cover,
                            ),
                            // _image ?? const Center()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/capture');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: const [
                            ImageIcon(
                              AssetImage(
                                "assets/images/Frame 44.png",
                              ),
                              color: Colors.white,
                              size: 60,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: const [
                            ImageIcon(
                              AssetImage(
                                "assets/images/Frame 44.png",
                              ),
                              color: Colors.white,
                              size: 60,
                            ),
                            Text(
                              'back',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // ShareFilesAndScreenshotWidgets()
                        //     .takeScreenshot(previewContainer, originalSize)
                        //     .then((Image? value) {
                        //   setState(() {
                        //     _image = value;
                        //     print("Image:$_image");
                        //     // ImageGallerySaver.saveImage(_image.path);
                        //   });
                        // });
                        Navigator.pushNamed(context, '/capture');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: const [
                            ImageIcon(
                              AssetImage(
                                "assets/images/Frame 44.png",
                              ),
                              color: Colors.white,
                              size: 60,
                            ),
                            Text(
                              'save',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        ShareFilesAndScreenshotWidgets().shareScreenshot(
                            previewContainer,
                            originalSize,
                            "share with",
                            "Name.png",
                            "image/png",
                            text: "this is a caption!");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: const [
                            ImageIcon(
                              AssetImage(
                                "assets/images/Frame 44.png",
                              ),
                              color: Colors.white,
                              size: 60,
                            ),
                            Text(
                              'share',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    ));
  }
}
