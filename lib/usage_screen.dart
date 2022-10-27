// ignore_for_file: avoid_print

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:water_tank_app/app_name_area.dart';

class UsageScreen extends StatefulWidget {
  const UsageScreen({super.key});

  @override
  State<UsageScreen> createState() => _UsageScreenState();
}

class _UsageScreenState extends State<UsageScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                AppNameArea(
                  imagePath: "assets/images/title_area_2@2x.png",
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE3F9F4),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 555,
                        child: ListView(
                          children: [
                            Table(
                              border: TableBorder.all(),
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                TableRow(children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Date",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      (DateFormat.yMMMd()
                                          .format(DateTime.now())),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ]),
                                const TableRow(children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Hour",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Amount of water",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ]),
                                dataRowBuilder("00.00 - 01.00", "1L"),
                                dataRowBuilder("00.01 - 02.00", "2L"),
                                dataRowBuilder("00.02 - 03.00", "3L"),
                                dataRowBuilder("00.03 - 04.00", "4L"),
                                dataRowBuilder("00.04 - 05.00", "5L"),
                                dataRowBuilder("00.05 - 06.00", "6L"),
                                dataRowBuilder("00.06 - 07.00", "7L"),
                                dataRowBuilder("00.07 - 08.00", "8L"),
                                dataRowBuilder("00.08 - 09.00", "9L"),
                                dataRowBuilder("00.09 - 10.00", "10L"),
                                dataRowBuilder("00.10 - 11.00", "11L"),
                                dataRowBuilder("00.11 - 12.00", "12L"),
                                dataRowBuilder("00.12 - 13.00", "13L"),
                                dataRowBuilder("00.13 - 14.00", "14L"),
                                dataRowBuilder("00.14 - 15.00", "15L"),
                                dataRowBuilder("00.15 - 16.00", "16L"),
                                dataRowBuilder("00.16 - 17.00", "17L"),
                                dataRowBuilder("00.17 - 18.00", "18L"),
                                dataRowBuilder("00.18 - 19.00", "19L"),
                                dataRowBuilder("00.19 - 20.00", "20L"),
                                dataRowBuilder("00.20 - 21.00", "21L"),
                                dataRowBuilder("00.21 - 22.00", "22L"),
                                dataRowBuilder("00.22 - 23.00", "23L"),
                                dataRowBuilder("00.23 - 24.00", "24L"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: InkWell(
                    onTap: () {
                      print("Back to Home");
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 80,
                      color: const Color(0xff383F85),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            width: 25,
                            child: Image.asset('assets/images/back@2x.png'),
                          ),
                          const Text(
                            "Back to Home",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
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

  TableRow dataRowBuilder(String hour, String amountOfWater) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(hour),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(amountOfWater),
      ),
    ]);
  }
}
