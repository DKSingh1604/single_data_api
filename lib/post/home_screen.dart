import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String? token;
  const HomeScreen({
    super.key,
    this.token,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Token: ${widget.token}",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
