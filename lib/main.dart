// ignore_for_file: avoid_print

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // App name row
          Container(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 32.0, bottom: 16.0),
            child: Image.asset('assets/images/title_area@2x.png'),
          ),
          // Image row
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset('assets/images/image@2x.png'),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          // Parameters row
          parameterRowBuilder(
            "assets/images/icon_1@2x.png",
            "Water capacity",
          ),
          parameterRowBuilder(
            "assets/images/icon_2@2x.png",
            "Temperature",
          ),
          parameterRowBuilder(
            "assets/images/icon_3@2x.png",
            "Clearity",
          ),
          parameterRowBuilder(
            "assets/images/icon_4@2x.png",
            "Speed",
          ),
          parameterRowBuilder(
            "assets/images/icon_5@2x.png",
            "Daily consumption",
          ),
          const SizedBox(
            height: 8,
          ),
          // Water pump button row
          waterPumpButtonBuilder(),
          // Bottom navigation button row
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              height: 80,
              color: const Color(0xff383F85),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Usage per hour",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    width: 25,
                    child: Image.asset('assets/images/history@2x.png'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell waterPumpButtonBuilder() {
    return InkWell(
      onTap: () {
        print("Button clicked");
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff435E82),
          border: Border.all(
            color: const Color(0xff435E82),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        margin: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 8.0,
        ),
        // color: const Color(0xff435E82),
        child: const Center(
          child: Text(
            "Water pump (Turn ON)",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  Padding parameterRowBuilder(
    String imagePath,
    String parameterName,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff389CD7),
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 8.0,
                  ),
                  child: SizedBox(
                    height: 30,
                    child: Image.asset(imagePath),
                  ),
                ),
                Text(
                  parameterName,
                  style: const TextStyle(
                    color: Color(0xff383F85),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
