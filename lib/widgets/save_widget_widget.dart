import 'package:flutter/material.dart';

class SaveWidget extends StatelessWidget {
  const SaveWidget({Key? key, this.name, this.bgImage}) : super(key: key);
  final String? name;
  final String? bgImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 50),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('$bgImage'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 50,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 50,
                      ),
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 50,
                      ),
                    ],
                  )),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                name!,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
