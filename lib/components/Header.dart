import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'My Cat\'s ',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Poppins',
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Poobox',
                style: TextStyle(
                  color: Color(0xFFFFC107),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
