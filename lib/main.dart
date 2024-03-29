// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'app_name_area.dart';
import 'usage_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  final _database = FirebaseDatabase.instance.ref();

  String _waterCapacity = "result goes here";
  String _temperture = "result goes here";
  String _clearity = "result goes here";
  String _speed = "result goes here";
  String _dailyConsumption = "result goes here";

  bool isWaterPumpTurnedOn = false;
  bool isLoading = true;

  @override
  void initState() {
    _getWaterCapacity();
    _getTemperture();
    _getClearity();
    _getSpeed();
    _getDailyConsumption();

    super.initState();
  }

  // Water capacity
  void _getWaterCapacity() async {
    print("Inside the active listner");
    try {
      final snapshot = await _database.child('/Water_capacity').get();

      if (snapshot.exists) {
        setState(() {
          _waterCapacity = snapshot.value.toString();
        });

        print(snapshot.value);
      } else {
        print('No data available.');
      }
    } catch (e) {
      print("Error $e");
    }
  }

  // Tempreature
  void _getTemperture() async {
    print("Inside the active listner");
    try {
      final snapshot = await _database.child('/temperature').get();

      if (snapshot.exists) {
        setState(() {
          _temperture = snapshot.value.toString();
        });

        print(snapshot.value);
      } else {
        print('No data available.');
      }
    } catch (e) {
      print("Error $e");
    }
  }

  // Clearity
  void _getClearity() async {
    print("Inside the active listner");
    try {
      final snapshot = await _database.child('/clearity').get();

      if (snapshot.exists) {
        setState(() {
          _clearity = snapshot.value.toString();
        });

        print(snapshot.value);
      } else {
        print('No data available.');
      }
    } catch (e) {
      print("Error $e");
    }
  }

  // Speed
  void _getSpeed() async {
    print("Inside the active listner");
    try {
      final snapshot = await _database.child('/speed').get();

      if (snapshot.exists) {
        setState(() {
          _speed = snapshot.value.toString();
        });

        print(snapshot.value);
      } else {
        print('No data available.');
      }
    } catch (e) {
      print("Error $e");
    }
  }

  // Daily consumption
  void _getDailyConsumption() async {
    print("Inside the active listner");
    try {
      final snapshot = await _database.child('/daily_consumption').get();

      if (snapshot.exists) {
        setState(() {
          _dailyConsumption = snapshot.value.toString();
        });

        setState(() {
          isLoading = false;
        });

        print(snapshot.value);
      } else {
        print('No data available.');
      }
    } catch (e) {
      print("Error $e");
    }
  }

  void _turnOnWaterPump() {
    print("Inside the turn on water pump button");
    _database.child('/PUMP_turn_on_button').set(1);
    setState(() {
      isWaterPumpTurnedOn = true;
    });
  }

  void _turnOffWaterPump() {
    print("Inside the turn on water pump button");
    _database.child('/PUMP_turn_on_button').set(0);
    setState(() {
      isWaterPumpTurnedOn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                // App name row
                AppNameArea(
                  imagePath: "assets/images/title_area@2x.png",
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
                        offset:
                            const Offset(0, 3), // changes position of shadow
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
                  _waterCapacity,
                  false,
                  true,
                  false,
                  false,
                ),
                parameterRowBuilder(
                  "assets/images/icon_2@2x.png",
                  "Temperature",
                  _temperture,
                  false,
                  false,
                  true,
                  false,
                ),
                parameterRowBuilder(
                  "assets/images/icon_3@2x.png",
                  "Clearity",
                  _clearity,
                  true,
                  false,
                  false,
                  false,
                ),
                parameterRowBuilder(
                  "assets/images/icon_4@2x.png",
                  "Speed",
                  _speed,
                  false,
                  false,
                  false,
                  true,
                ),
                parameterRowBuilder(
                  "assets/images/icon_5@2x.png",
                  "Daily consumption",
                  _dailyConsumption,
                  false,
                  true,
                  false,
                  false,
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
                  child: InkWell(
                    onTap: () {
                      print("Usage per hour button is clicked!");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UsageScreen(),
                        ),
                      );
                    },
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
                )
              ],
            ),
    );
  }

  InkWell waterPumpButtonBuilder() {
    return InkWell(
      onTap: () {
        if (isWaterPumpTurnedOn == true) {
          _turnOffWaterPump();
        } else {
          _turnOnWaterPump();
        }
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isWaterPumpTurnedOn ? const Color(0xff435E82) : Colors.red,
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
        child: Center(
          child: Text(
            isWaterPumpTurnedOn
                ? "Water pump (Turn ON)"
                : "Water pump (Turn OFF)",
            style: const TextStyle(
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
    String valueFromBackend,
    bool isClearity,
    bool isLiquid,
    bool isTempreature,
    bool isSpeed,
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
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        parameterName,
                        style: const TextStyle(
                          color: Color(0xff383F85),
                          fontSize: 16,
                        ),
                      ),
                      isClearity
                          ? valueFromBackend == '1'
                              ? Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    border: Border.all(
                                      color: Colors.green,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 4,
                                  ),
                                  child: const Text(
                                    "Good",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(
                                      color: Colors.red,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 4,
                                  ),
                                  child: const Text(
                                    "Bad",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                          : isLiquid
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Text(
                                    "$valueFromBackend L",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF383F85)),
                                  ),
                                )
                              : isTempreature
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: Text(
                                        "$valueFromBackend °C",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF383F85)),
                                      ))
                                  : isSpeed
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: Text(
                                            "$valueFromBackend L/min",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF383F85)),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16.0),
                                          child: Text(
                                            valueFromBackend,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFF383F85)),
                                          ),
                                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
