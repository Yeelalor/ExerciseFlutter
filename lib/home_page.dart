// ignore_for_file: unused_local_variable, non_constant_identifier_names, unused_element

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutterwidgets/features/Qrcode/generate_qr_code.dart';
import 'package:flutterwidgets/features/get_it_example/get_it.dart';
import 'package:flutterwidgets/models/dio_test_model.dart';
import 'package:flutterwidgets/services/homeservice/res_api.dart';
import 'package:flutterwidgets/widgets/alert_popup_widgets.dart';
import 'package:flutterwidgets/widgets/button_widgets.dart';
import 'package:flutterwidgets/widgets/save_widget_widget.dart';
import 'package:flutterwidgets/widgets/shimmer_loading_list.dart';
import 'package:flutterwidgets/widgets/shimmer_loading_box.dart';
import 'package:flutterwidgets/widgets/text_field_widget.dart';
import 'package:flutterwidgets/widgets/theme_container.dart';
import 'package:flutterwidgets/widgets/wrap_theme.dart';
import 'package:otp/otp.dart';
import 'package:password_strength/password_strength.dart';
import 'package:uuid/uuid.dart';

import 'config/dio_connect_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<dynamic> TestList = [];
  final List _listMenuFeatures = [
    {
      'menu_name': 'transfer',
      'menu_icon': 'assets/images/Frame 44.png',
      'link': '/transfer'
    },
    {
      'menu_name': 'Menus',
      'menu_icon': 'assets/images/Frame 44.png',
      'link': '/Menus'
    },
    {
      'menu_name': 'transfer',
      'menu_icon': 'assets/images/Frame 44.png',
      'link': '/transfer'
    },
    {
      'menu_name': 'Menu',
      'menu_icon': 'assets/images/Frame 44.png',
      'link': '/Menus'
    },
    {
      'menu_name': 'transfer',
      'menu_icon': 'assets/images/Frame 44.png',
      'link': '/transfer'
    },
    {
      'menu_name': 'Menus',
      'menu_icon': 'assets/images/Frame 44.png',
      'link': '/Menus'
    },
  ];
  final controller = TextEditingController();
  bool hidePassword = true;
  @override
  void initState() {
    super.initState();
    setUp();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onChangeText(String data) {
    print(data);
  }

  void test() {
    print("onPress");
  }

  void showDialog() {
    AlertPopup()
        .alertMessageSucess("something went wrong", BuildContext, context);
  }

//test api dio
  List<DioModel> testDataList = [];
  void TestDioConnectAPI() async {
    try {
      testDataList = [];
      final respone = await CallAPI().getDataTest();
      setState(() {
        for (var newData in respone) {
          testDataList.add(DioModel.fromJson(newData));
        }
      });
      logger.d(respone);
    } catch (error) {
      logger.e(error);
    }
  }

  void onTestgetit() async {
    final res = await locator.get<CallAPI>().getDataTest();
    logger.d(res);
  }

  void ongenerate() {
    var uuid = const Uuid();
    var text = uuid.v1(options: {
      'username': 'Yeelalor choulor',
      'account': '0304334444070000',
      'mSecs': DateTime.utc(2011, 11, 01).millisecondsSinceEpoch,
    });
    logger.d("Generate: $text");
  }

  void encrptAnddecryptData() {
    const plainText = 'Yeelalorchoulorloveder';
    const decrptext = 'ItcnsUSdEyLf+F+gwteyz/rG31N6jNWe2WEoqD3KJZQ=';
    final key = encrypt.Key.fromUtf8("82f2ceed4c503896c8a291e560bd4325");
    final iv = encrypt.IV.fromLength(8);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decryptextstring =
        encrypter.decrypt(encrypt.Encrypted.fromBase64(decrptext), iv: iv);
    logger.d("encrpt: ${encrypted.base64}");
    logger.d("decrpt: ${decryptextstring}");

    // final decrypted = encrypter.decrypt(encrypted, iv: iv);
  }

  void generateOTP() {
    final code = OTP.generateTOTPCodeString(
        '${DateTime.now().microsecondsSinceEpoch}',
        DateTime.now().millisecondsSinceEpoch);
    logger.d("otp: $code");
  }

  void checkPasswordStrenght() {
    double strength = estimatePasswordStrength('123#');
    print(strength);
    // if (strength < 0.3) print('This password is weak!');
  }

  @override
  Widget build(BuildContext context) {
    return WrapTheme(
        child: Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: const Icon(
                Icons.person,
                size: 40,
                color: Colors.red,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Text("EDL LAO"), Text("status: Active")],
              ),
            )
          ],
        ),
        actions: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.power_settings_new_sharp,
                    size: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: ThemeContainer(
        child: Column(
          children: [
            Expanded(
                child: Scrollbar(
              radius: const Radius.circular(10),
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/test.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: const Color(0xFFffffff),
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.circular(20),
                      // border: Border(
                      //     top: BorderSide(width: 2, color: Colors.blue),
                      //     bottom: BorderSide(width: 5, color: Colors.red))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${testDataList.length}",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),

                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _listMenuFeatures.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: (() {
                            print("${_listMenuFeatures[index]['link']}");
                          }),
                          child: Container(
                            color: Colors.red,
                            height: 400,
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                ImageIcon(
                                  AssetImage(
                                    "${_listMenuFeatures[index]['menu_icon']}",
                                  ),
                                  color: Colors.white,
                                  size: 60,
                                ),
                                Text(
                                  _listMenuFeatures[index]['menu_name'],
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        );
                      }),

                  // TextFieldWidgets(controller: controller, hintText: "hintText"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidgets(
                    controller: controller,
                    hintText: 'Username',
                    PrefixIcon: Icons.person_rounded,
                    isShowPrefixIcon: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  TextFieldWidgets(
                    controller: controller,
                    hintText: 'Password',
                    align: 'left',
                    onChange: _onChangeText,
                    PrefixIcon: Icons.lock_outline,
                    isShowPrefixIcon: true,
                    ObscureText: hidePassword,
                    SuffixIcon: hidePassword
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,
                    isShowSuffixIcon: true,
                    toggleShowPassword: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                  ButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ldb-payment');
                      },
                      title: "test ldb payment"),
                  ButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, '/animation');
                      },
                      title: "animation success"),
                  ButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, '/pin');
                      },
                      title: "go to pin code"),
                  ButtonWidget(
                      onPressed: () {
                        // TestDioConnectAPI();
                        // onTestgetit();
                        // ongenerate();
                        // encrpto();
                        // generateOTP();
                        checkPasswordStrenght();
                      },
                      title: "test dio"),
                  ButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, '/success_screen');
                      },
                      title: "go to success screen"),
                  ButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SaveWidget(
                                    name: 'SUCCESS PAGE',
                                    bgImage: 'assets/images/test.jpg')));
                      },
                      title: "go to save success screen"),
                  ButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, '/scanqr');
                      },
                      title: "Scan Qr"),
                  ButtonWidget(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GenerateQR(
                                      value: 'Fuck',
                                    )));
                      },
                      title: "Generate QR"),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: ((context, index) {
                        return (Column(
                          children: [
                            ListTile(
                              onTap: () {},
                              leading: const FlutterLogo(size: 50),
                              title:
                                  const Text('one-line with trailing widget'),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                            const Divider()
                          ],
                        ));
                      })),

                  Column(
                    children: [
                      const ShimmerLoading(),
                      const ShimmerLoading(),
                      const ShimmerLoading(),
                      const ShimmerLoading(),
                      const ShimmerLoadingBox(),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _listMenuFeatures.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                              child: Container(
                                  height: 300,
                                  color: Colors.red,
                                  margin: const EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  child: const Text("data")),
                            );
                          }),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    ));
  }
}
