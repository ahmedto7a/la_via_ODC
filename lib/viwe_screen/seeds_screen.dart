import 'package:flutter/material.dart';

class SeedsScreen extends StatefulWidget {
  const SeedsScreen({Key? key}) : super(key: key);

  @override
  State<SeedsScreen> createState() => _SeedsScreenState();
}

class _SeedsScreenState extends State<SeedsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seeds"),
      ),
      body:     Center(
        child: TweenAnimationBuilder(
          child:

          Text("Seeds"),
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 2000),
          builder: (BuildContext context, double _value, child) {
            return Opacity(
              opacity: _value,
              child: Padding(
                padding: EdgeInsets.only(bottom: _value * 50),
                child: child,
              ),
            );
          },
        ),
      ),
    );
  }
}
