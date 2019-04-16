import 'package:flutter/material.dart';

class EggTimerButton extends StatelessWidget {
  final IconData icon;
  final String text;

  EggTimerButton({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: const Color(0x22000000),
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: Icon(
                  icon,
                  color: Colors.black,
                )),
            Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0),
            )
          ],
        ),
      ),
    );
  }
}
