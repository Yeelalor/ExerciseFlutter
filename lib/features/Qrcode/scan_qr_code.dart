import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterwidgets/features/Qrcode/generate_qr_code.dart';
import 'package:flutterwidgets/widgets/alert_popup_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code_tools/qr_code_tools.dart';
import 'package:rxdart/rxdart.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});
  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  var qrText = '';
  Barcode? result;
  File? _file;
  final picker = ImagePicker();
  String _qrcodeFile = '';
  String _data = '';
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (mounted) {
      if (Platform.isAndroid) {
        controller!.pauseCamera();
      } else if (Platform.isIOS) {
        controller!.resumeCamera();
      }
    }
  }

  Future<void> onQRViewCreated(QRViewController controller) async {
    setState(() => this.controller = controller);
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result!.code != null) {
          var qrText = result!.code;
          var qrTextSub = qrText!.substring(0, 22);
          var qrTextL = qrTextSub.length;
          if (qrTextL == 22) {
            if (qrText.contains('Vientiane') || qrText.contains('default')) {
              controller.pauseCamera();
              Future.delayed(Duration.zero, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GenerateQR(
                        value:
                            result != null ? "${result!.code}" : "Not Found"),
                  ),
                ).then(onGoBack);
              });
            } else {
              controller.pauseCamera();
              AlertPopup().alertMessageErrorHomePage(
                  'QR is incorrect', BuildContext, context);
            }
          } else {
            controller.pauseCamera();
            AlertPopup().alertMessageErrorHomePage(
                'QR is incorrect', BuildContext, context);
          }
        } else {
          controller.pauseCamera();
          AlertPopup().alertMessageErrorHomePage(
              'QR is incorrect', BuildContext, context);
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {
      controller!.resumeCamera();
    });
  }

  // ignore: unused_element
  // void _getPhotoByGallery() {
  //   Stream.fromFuture(picker.pickImage(source: ImageSource.gallery))
  //       .flatMap((file) {
  //     setState(() {
  //       _qrcodeFile = file!.path;
  //     });
  //     return Stream.fromFuture(QrCodeToolsPlugin.decodeFrom(file!.path));
  //   }).listen((data) {
  //     var qrTexts = data;
  //     var newText = qrTexts.split('-');
  //     var Lenght = qrTexts.substring(0, 22);
  //     if (data != '') {
  //       if (Lenght.length == 22) {
  //         if (data.contains('Vientiane') || data.contains('default')) {
  //           controller!.pauseCamera();
  //           Future.delayed(Duration.zero, () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) =>
  //                     GenerateQR(value: data != '' ? data : "Not Found"),
  //               ),
  //             ).then(onGoBack);
  //           });
  //         } else {
  //           controller!.pauseCamera();
  //           Navigator.pop(context);
  //           // AlertPopup().alertMessageErrorHomePage(
  //           //     'QR is incorrect', BuildContext, context);
  //         }
  //       } else {
  //         controller!.pauseCamera();
  //         Navigator.pop(context);
  //         // AlertPopup().alertMessageErrorHomePage(
  //         //     'QR is incorrect', BuildContext, context);
  //       }
  //     } else {
  //       controller!.pauseCamera();
  //       Navigator.pop(context);
  //       // AlertPopup().alertMessageErrorHomePage(
  //       //     'QR is incorrect', BuildContext, context);
  //     }
  //   }).onError((error, stackTrace) {
  //     setState(() {
  //       _data = '';
  //     });
  //     print('${error.toString()}');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SCAN QR"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: (Column(
        children: [
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderLength: 20,
                borderWidth: 5,
                cutOutSize: 250,
              ),
            ),
          ),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          // _getPhotoByGallery();
        },
        child: const Icon(
          Icons.image,
          color: Colors.white,
        ),
      ),
    );
  }
}
