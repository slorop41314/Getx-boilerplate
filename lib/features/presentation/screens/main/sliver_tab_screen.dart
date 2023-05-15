import 'package:flutter/material.dart';

class SliverTabScreen extends StatefulWidget {
  @override
  _SliverTabScreenState createState() => _SliverTabScreenState();
}

class _SliverTabScreenState extends State<SliverTabScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text("Sliver tab"),
      ),
    );
  }
}
