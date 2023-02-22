import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterwidgets/widgets/save_widget_widget.dart';
import 'package:flutterwidgets/widgets/wrap_theme.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';
import 'package:share_plus/share_plus.dart';

class CaptureWidget extends StatefulWidget {
  const CaptureWidget({super.key});

  @override
  State<CaptureWidget> createState() => _CaptureWidgetState();
}

class _CaptureWidgetState extends State<CaptureWidget> {
  final controller = ScreenshotController();
  String name = 'Yeelar';

  Future<dynamic> saveWidget(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final result =
        await ImageGallerySaver.saveImage(bytes, name: 'flutter$time');
    final snackBar = SnackBar(
      content: Container(
          height: 35,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.check_circle_sharp,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Completed',
                style: TextStyle(fontSize: 20),
              ),
            ],
          )),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return result;
  }

  Future<dynamic> shareWidget(Uint8List bytes) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/flutter.png');
    image.writeAsBytes(bytes);
    await [Permission.storage].request();
    await Share.shareFiles([image.path]);
  }

  @override
  Widget build(BuildContext context) => Screenshot(
      controller: controller,
      child: Container(
        child: Scaffold(
            body: WrapTheme(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/test.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Expanded(flex: 1, child: SuccesWidget(name)),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: const [
                              ImageIcon(
                                AssetImage(
                                  "assets/images/Frame 44.png",
                                ),
                                color: Colors.white,
                                size: 50,
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
                                size: 50,
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
                          controller
                              .captureFromWidget(const SaveWidget(
                                  name: 'SUCCESS PAGE',
                                  bgImage: 'assets/images/test.jpg'))
                              .then((value) => saveWidget(value));
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
                                size: 50,
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
                          controller
                              .captureFromWidget(const SaveWidget(
                                name: "SUCCESS PAGE",
                                bgImage: 'assets/images/test.jpg',
                              ))
                              .then((value) => shareWidget(value));
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
                                size: 50,
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
            ),
          ),
        )),
      ));

  // ignore: non_constant_identifier_names
  Widget SuccesWidget(status) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 40, right: 40),
      child: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                child: Column(
                  children: const [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 50,
                    ),
                  ],
                )),
            Container(
              alignment: Alignment.center,
              child: Text(
                name,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
