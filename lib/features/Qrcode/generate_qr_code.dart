import 'package:flutter/material.dart';
import 'package:flutterwidgets/home_page.dart';
import 'package:flutterwidgets/widgets/theme_container.dart';
import 'package:flutterwidgets/widgets/wrap_theme.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({key, required this.value});
  final String? value;
  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  final generateqr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WrapTheme(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Generate QR"),
          elevation: 0,
          centerTitle: true,
        ),
        body: ThemeContainer(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.red)),
                        child: QrImage(
                          data: '${widget.value}',
                          version: QrVersions.auto,
                          size: 250,
                          gapless: false,
                          foregroundColor: Colors.black,
                          embeddedImage:
                              const AssetImage('assets/images/logo w ldb.png'),
                          embeddedImageStyle: QrEmbeddedImageStyle(
                            size: const Size(40, 40),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("QR Result"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('${widget.value}')
                    ],
                  ),
                )),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/sucess', (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: const Size.fromHeight(50),
                          shadowColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        child: const Text("Generate")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
