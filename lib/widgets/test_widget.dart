import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterwidgets/widgets/button_widgets.dart';
import 'package:flutterwidgets/widgets/shimmer_loading_box.dart';
import 'package:flutterwidgets/widgets/shimmer_loading_list.dart';
import 'package:flutterwidgets/widgets/text_field_widget.dart';
import 'package:flutterwidgets/widgets/theme_container.dart';
import 'package:flutterwidgets/widgets/wrap_theme.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

final controller = TextEditingController();
bool hidePassword = true;
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

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return WrapTheme(
        child: Scaffold(
            appBar: AppBar(title: const Text("Test")),
            body: ThemeContainer(
                child: Column(
              children: [
                Expanded(
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
                        children: const [
                          Text(
                            "World",
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
                              // margin: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  ImageIcon(
                                    AssetImage(
                                      "${_listMenuFeatures[index]['menu_icon']}",
                                    ),
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  Text(_listMenuFeatures[index]['menu_name'])
                                ],
                              ),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 20,
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
                  ],
                ))
              ],
            ))));
  }
}
