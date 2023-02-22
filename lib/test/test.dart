import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Test extends StatelessWidget {
  const Test({super.key, required this.name, this.isShowText = false});
  final String? name;
  final bool? isShowText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
    );
  }
}
