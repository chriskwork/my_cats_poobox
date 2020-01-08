import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TwitterLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: () async {
            const url = 'https://twitter.com/yohan_k_dev';
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Text(
            '@yohan_k_dev',
            style: TextStyle(
              fontSize: 12.0,
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
