import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            actions: const [
              AppBarSection(
                  leftIconImage: "assets/images/arrow_left.jpg",
                  appBarTitle: 'Details',
                  rightIconImage: 'assets/images/heart.jpg')
            ],
          ),
    )
    );
  }
}

class AppBarSection extends StatelessWidget {
  const AppBarSection(
      {super.key,
        required this.leftIconImage,
        required this.appBarTitle,
        required this.rightIconImage});

  final String leftIconImage;
  final String appBarTitle;
  final String rightIconImage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                leftIconImage,
              ),
              Text(
                appBarTitle,
                style: const TextStyle(
                    fontFamily: 'Sora', fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Image.asset(
                rightIconImage,
              ),
            ],
          ),
        ));
  }
}