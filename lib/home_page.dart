import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dataOutput {
  String direction1 = '';
  String direction2 = '';
  List<String> route = [];
  List<String> routeFromChange = [];
  int numberOfStops = 0;
  int time = 0;
  int ticketPrice = 0;

  dataOutput({
    required this.direction1,
    required this.direction2,
    required this.route,
    required this.routeFromChange,
    required this.numberOfStops,
    required this.time,
    required this.ticketPrice,
  });
}

class HomePageOrignal extends StatelessWidget {
  HomePageOrignal({super.key});

  final startStationController = TextEditingController();
  final endStationController = TextEditingController();

  ////////////////// 35 stations in line 1 /////////////////
  List<String> lineOneStations = [
    "New El Marg",
    "El-Marg",
    "Ezbet El-Nakhl",
    "Ain Shams",
    "El-Matareyya",
    "Helmeyet El-Zaitoun",
    "Hadayeq El-Zaitoun",
    "Saray El-Qobba",
    "Hammamat El-Qobba",
    "Kobri El-Qobba",
    "Manshiet El-Sadr",
    "El-Demerdash",
    "Ghamra",
    "Al-Shohadaa",
    "Orabi",
    "Nasser",
    "Sadat",
    "Saad Zaghloul",
    "Al-Sayeda Zeinab",
    "El-Malek El-Saleh",
    "Mar Girgis",
    "El-Zahraa",
    "Dar El-Salam",
    "Hadayeq El-Maadi",
    "Maadi",
    "Sakanat El-Maadi",
    "Tora El-Balad",
    "Kozika",
    "Tora El-Esmant",
    "Elmasraa",
    "Hadayek Helwan",
    "Wadi Hof",
    "Helwan University",
    "Ain Helwan",
    "Helwan",
  ];

  ////////////////// 20 stations in line 2 /////////////////

  List<String> lineTwoStations = [
    "Shubra El-Kheima",
    "Kolleyyet El-Zeraa",
    "Mezallat",
    "Khalafawy",
    "St. Teresa",
    "Road El-Farag",
    "Masarra",
    "Al-Shohadaa",
    "Attaba",
    "Mohamed Naguib",
    "Sadat",
    "Opera",
    "Dokki",
    "El Bohoth",
    "Cairo University",
    "Faisal",
    "Giza",
    "Omm El-Masryeen",
    "Sakiat Mekky",
    "El-Mounib",
  ];

  ////////////////// 34 stations in line 3 /////////////////

  List<String> lineThreeStations = [
    "Adly Mansour",
    "El Haykestep",
    "Omar Ibn El-Khattab",
    "Qobaa",
    "Hesham Barakat",
    "El Nozha",
    "Nadi El Shams",
    "Alf Maskan",
    "Heliopolis Square",
    "Haroun",
    "Al-Ahram",
    "Koleyet El Banat",
    "Stadium",
    "Fair Zone",
    "Abbassia",
    "Abdou Pasha",
    "El Geish",
    "Bab El Shaaria",
    "Attaba",
    "Nasser",
    "Maspero",
    "Safaa Hegazy",
    "Kit Kat",
  ];

  List<String> lineThreeImbabaDirction = [
    "Adly Mansour",
    "El Haykestep",
    "Omar Ibn El-Khattab",
    "Qobaa",
    "Hesham Barakat",
    "El Nozha",
    "Nadi El Shams",
    "Alf Maskan",
    "Heliopolis Square",
    "Haroun",
    "Al-Ahram",
    "Koleyet El Banat",
    "Stadium",
    "Fair Zone",
    "Abbassia",
    "Abdou Pasha",
    "El Geish",
    "Bab El Shaaria",
    "Attaba",
    "Nasser",
    "Maspero",
    "Safaa Hegazy",
    "Kit Kat",
    // ==========
    "Sudan",
    "Imbaba",
    "El Bohy",
    "Al Qawmeyya",
    "Ring Road",
    "Rod El Farag Corridor",
  ];

  List<String> lineThreeCairoUnversityDirction = [
    "Adly Mansour",
    "El Haykestep",
    "Omar Ibn El-Khattab",
    "Qobaa",
    "Hesham Barakat",
    "El Nozha",
    "Nadi El Shams",
    "Alf Maskan",
    "Heliopolis Square",
    "Haroun",
    "Al-Ahram",
    "Koleyet El Banat",
    "Stadium",
    "Fair Zone",
    "Abbassia",
    "Abdou Pasha",
    "El Geish",
    "Bab El Shaaria",
    "Attaba",
    "Nasser",
    "Maspero",
    "Safaa Hegazy",
    "Kit Kat",
    // ==========
    "Tawfikia",
    "Wadi El Nile",
    "Gamat El Dowal",
    "Boulak El Dakrour",
    "Cairo University",
  ];

  List<String> lineThreeTotalStations = [
    "Adly Mansour",
    "El Haykestep",
    "Omar Ibn El-Khattab",
    "Qobaa",
    "Hesham Barakat",
    "El Nozha",
    "Nadi El Shams",
    "Alf Maskan",
    "Heliopolis Square",
    "Haroun",
    "Al-Ahram",
    "Koleyet El Banat",
    "Stadium",
    "Fair Zone",
    "Abbassia",
    "Abdou Pasha",
    "El Geish",
    "Bab El Shaaria",
    "Attaba",
    "Nasser",
    "Maspero",
    "Safaa Hegazy",
    "Kit Kat",
    // ==========
    "Tawfikia",
    "Wadi El Nile",
    "Gamat El Dowal",
    "Boulak El Dakrour",
    "Cairo University",
    "Sudan",
    "Imbaba",
    "El Bohy",
    "Al Qawmeyya",
    "Ring Road",
    "Rod El Farag Corridor",
  ];

  List<String> spatialTest = [
    "Sudan",
    "Imbaba",
    "El Bohy",
    "Al Qawmeyya",
    "Ring Road",
    "Rod El Farag Corridor",
  ];
  List<String> spatialTest2 = [
    "Tawfikia",
    "Wadi El Nile",
    "Gamat El Dowal",
    "Boulak El Dakrour",
    "Cairo University",
  ];

  /////////////////////////calculte ticker price/////////////////////
  int ticketPriceCalculation(int numberOfStops) {
    // Function to calculate ticket price based on number of stops
    int ticketPrice = 0;
    if (numberOfStops >= 1 && numberOfStops <= 9) {
      ticketPrice = 8;
    } else if (numberOfStops >= 10 && numberOfStops <= 16) {
      ticketPrice = 10;
    } else if (numberOfStops >= 17 && numberOfStops <= 23) {
      ticketPrice = 15;
    } else if (numberOfStops >= 24) {
      ticketPrice = 20;
    }
    print("Ticket price: $ticketPrice pounds");
    return ticketPrice;
  }

  //////////////get route between stations/////////////////////
  List<String> getRoute({
    required int startIndex,
    required int endIndex,
    required List<String> stations,
  }) {
    if (endIndex > startIndex) {
      return stations.sublist(startIndex, endIndex + 1);
    } else {
      return stations.sublist(endIndex, startIndex + 1).reversed.toList();
    }
  }

  void printResult({
    required int numberOfStops,
    required int time,
    required String direction1,
    required List<String> route,
    String direction2 = '',
    List<String> routeFromChange = const [],
  }) {
    print("Number of stops: $numberOfStops");
    print("Estimated time to arrive: $time minutes");

    ticketPriceCalculation(numberOfStops);
    print("Direction: $direction1, $direction2");
    print("Route: ${route.join(' -> ')}");
    if (routeFromChange.isNotEmpty) {
      print("Route after change: ${routeFromChange.join(' -> ')}");
    }
    print("Thank you for using our metro trip planner!");
  }

  var data = [].obs;

  @override
  Widget build(BuildContext context) {
    final allMetroStations = [
      for (var station in lineOneStations)
        DropdownMenuEntry(label: station, value: station),
      for (var station in lineTwoStations)
        DropdownMenuEntry(label: station, value: station),
      for (var station in lineThreeTotalStations)
        DropdownMenuEntry(label: station, value: station),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mettro Trip Planner'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/metro.jpeg'),
            fit: BoxFit.contain,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                spacing: 20,
                children: [
                  Text(
                    'choose start platform from ${allMetroStations.length} stations',
                  ),

                  DropdownMenu(
                    controller: startStationController,
                    enableSearch: true,
                    enableFilter: true,
                    requestFocusOnTap: true,
                    menuHeight: 500,
                    width: double.infinity,
                    hintText: 'start platform',
                    dropdownMenuEntries: allMetroStations,
                  ),
                  Text(
                    'choose end platform from ${allMetroStations.length} stations',
                  ),
                  DropdownMenu(
                    controller: endStationController,
                    enableSearch: true,
                    enableFilter: true,
                    requestFocusOnTap: true,
                    menuHeight: 500,
                    width: double.infinity,
                    hintText: 'end platform',
                    dropdownMenuEntries: allMetroStations,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      data.clear();
                      if (startStationController.text.isEmpty ||
                          endStationController.text.isEmpty) {
                        print(
                          "Invalid input. Please enter valid station names.",
                        );
                        Get.snackbar(
                          'Error',
                          "Invalid input. Please enter valid station names.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }
                      if (!lineOneStations.contains(
                            startStationController.text.trim(),
                          ) &&
                          !lineTwoStations.contains(
                            startStationController.text.trim(),
                          ) &&
                          !lineThreeImbabaDirction.contains(
                            startStationController.text.trim(),
                          ) &&
                          !lineThreeCairoUnversityDirction.contains(
                            startStationController.text.trim(),
                          )) {
                        print(
                          "Invalid start station. Please enter a valid station name.",
                        );
                        Get.snackbar(
                          'Error',
                          "Invalid start station. Please enter a valid station name.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }
                      if (!lineOneStations.contains(
                            endStationController.text.trim(),
                          ) &&
                          !lineTwoStations.contains(
                            endStationController.text.trim(),
                          ) &&
                          !lineThreeImbabaDirction.contains(
                            endStationController.text.trim(),
                          ) &&
                          !lineThreeCairoUnversityDirction.contains(
                            endStationController.text.trim(),
                          )) {
                        print(
                          "Invalid end station. Please enter a valid station name.",
                        );
                        Get.snackbar(
                          'Error',
                          "Invalid end station. Please enter a valid station name.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }
                      if (startStationController.text.trim() ==
                          endStationController.text.trim()) {
                        print("You are already at your destination.");
                        Get.snackbar(
                          'Error',
                          "You are already at your destination.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                        /////////////////////////line one direction/////////////////////
                      }
                      if (lineOneStations.contains(
                            startStationController.text.trim(),
                          ) &&
                          lineOneStations.contains(
                            endStationController.text.trim(),
                          )) {
                        int startIndex = lineOneStations.indexOf(
                          startStationController.text.trim(),
                        );
                        int endIndex = lineOneStations.indexOf(
                          endStationController.text.trim(),
                        );
                        List<String> route = getRoute(
                          startIndex: startIndex,
                          endIndex: endIndex,
                          stations: lineOneStations,
                        );
                        int numberOfStops = (endIndex - startIndex).abs();
                        int time = numberOfStops * 2;
                        String direction = (endIndex > startIndex)
                            ? "Helwan direction"
                            : "New El Marg direction";
                        printResult(
                          numberOfStops: numberOfStops,
                          time: time,
                          direction1: direction,
                          route: route,
                        );
                        data.add(
                          dataOutput(
                            direction1: direction,
                            direction2: '',
                            route: route,
                            routeFromChange: [],
                            numberOfStops: numberOfStops,
                            time: time,
                            ticketPrice: ticketPriceCalculation(numberOfStops),
                          ),
                        );
                      }
                      ////////////////////////line two direction/////////////////////

                      if (lineTwoStations.contains(
                            startStationController.text.trim(),
                          ) &&
                          lineTwoStations.contains(
                            endStationController.text.trim(),
                          )) {
                        int startIndex = lineTwoStations.indexOf(
                          startStationController.text.trim(),
                        );
                        int endIndex = lineTwoStations.indexOf(
                          endStationController.text.trim(),
                        );
                        List<String> route = getRoute(
                          startIndex: startIndex,
                          endIndex: endIndex,
                          stations: lineTwoStations,
                        );
                        int numberOfStops = (endIndex - startIndex).abs();
                        int time = numberOfStops * 2;
                        String direction = (endIndex > startIndex)
                            ? "El-Mounib direction"
                            : "Shubra El-Kheima direction";
                        printResult(
                          numberOfStops: numberOfStops,
                          time: time,
                          direction1: direction,
                          route: route,
                        );
                        data.add(
                          dataOutput(
                            direction1: direction,
                            direction2: '',
                            route: route,
                            routeFromChange: [],
                            numberOfStops: numberOfStops,
                            time: time,
                            ticketPrice: ticketPriceCalculation(numberOfStops),
                          ),
                        );
                      }
                      ////////////////////////line three direction/////////////////////
                      if (lineThreeImbabaDirction.contains(
                            startStationController.text.trim(),
                          ) &&
                          lineThreeImbabaDirction.contains(
                            endStationController.text.trim(),
                          )) {
                        int startIndex = lineThreeImbabaDirction.indexOf(
                          startStationController.text.trim(),
                        );
                        int endIndex = lineThreeImbabaDirction.indexOf(
                          endStationController.text.trim(),
                        );
                        List<String> route = getRoute(
                          startIndex: startIndex,
                          endIndex: endIndex,
                          stations: lineThreeImbabaDirction,
                        );
                        int numberOfStops = (endIndex - startIndex).abs();
                        int time = numberOfStops * 2;
                        String direction = (endIndex > startIndex)
                            ? "Imbaba direction"
                            : "Adly Mansour direction";
                        printResult(
                          numberOfStops: numberOfStops,
                          time: time,
                          direction1: direction,
                          route: route,
                        );
                        data.add(
                          dataOutput(
                            direction1: direction,
                            direction2: '',
                            route: route,
                            routeFromChange: [],
                            numberOfStops: numberOfStops,
                            time: time,

                            ticketPrice: ticketPriceCalculation(numberOfStops),
                          ),
                        );
                      } ////////////////////////line three cairo university direction/////////////////////
                      else if (lineThreeCairoUnversityDirction.contains(
                            startStationController.text.trim(),
                          ) &&
                          lineThreeCairoUnversityDirction.contains(
                            endStationController.text.trim(),
                          )) {
                        int startIndex = lineThreeCairoUnversityDirction
                            .indexOf(startStationController.text.trim());
                        int endIndex = lineThreeCairoUnversityDirction.indexOf(
                          endStationController.text.trim(),
                        );
                        List<String> route = getRoute(
                          startIndex: startIndex,
                          endIndex: endIndex,
                          stations: lineThreeCairoUnversityDirction,
                        );
                        int numberOfStops = (endIndex - startIndex).abs();
                        int time = numberOfStops * 2;
                        String direction = (endIndex > startIndex)
                            ? "Cairo University direction"
                            : "Adly Mansour direction";
                        printResult(
                          numberOfStops: numberOfStops,
                          time: time,
                          direction1: direction,
                          route: route,
                        );
                        data.add(
                          dataOutput(
                            direction1: direction,
                            direction2: '',
                            route: route,
                            routeFromChange: [],
                            numberOfStops: numberOfStops,
                            time: time,
                            ticketPrice: ticketPriceCalculation(numberOfStops),
                          ),
                        );
                      }
                      //////////////////////line two to line three Cairo University/////////////////////
                      if (!spatialTest.contains(
                        endStationController.text.trim(),
                      )) {
                        if (lineTwoStations.contains(
                              startStationController.text.trim(),
                            ) &&
                            lineThreeCairoUnversityDirction.contains(
                              endStationController.text.trim(),
                            )) {
                          int startIndex = lineTwoStations.indexOf(
                            startStationController.text.trim(),
                          );

                          // //////////////////////bouns ///////////////////////////////
                          int interChangeIndexLineTwo2 = lineTwoStations
                              .indexOf("Cairo University");
                          String direction1 =
                              (interChangeIndexLineTwo2 > startIndex)
                              ? "El-Mounib direction"
                              : "Shubra El-Kheima direction";

                          // /////////////////////bouns ///////////////////////////////
                          List<String> routeToChange2 = getRoute(
                            startIndex: startIndex,
                            endIndex: interChangeIndexLineTwo2,
                            stations: lineTwoStations,
                          );
                          int endIndex = lineThreeCairoUnversityDirction
                              .indexOf(endStationController.text.trim());

                          // /////////////////////bouns ///////////////////////////////
                          int interChangeIndexLineThree2 =
                              lineThreeCairoUnversityDirction.indexOf(
                                "Cairo University",
                              );
                          String direction2 =
                              (endIndex > interChangeIndexLineThree2)
                              ? "Cairo University direction"
                              : "Adly Mansour direction";

                          // /////////////////////bouns ///////////////////////////////
                          List<String> routeFromChange2 = getRoute(
                            startIndex: interChangeIndexLineThree2,
                            endIndex: endIndex,
                            stations: lineThreeCairoUnversityDirction,
                          );

                          //////////////////////bouns ///////////////////////////////
                          int numberOfStops2 =
                              (interChangeIndexLineTwo2 - startIndex).abs() +
                              (endIndex - interChangeIndexLineThree2).abs();

                          /////////////////////bouns ///////////////////////////////
                          int time2 = numberOfStops2 * 2;

                          data.add(
                            dataOutput(
                              direction1: direction1,
                              direction2: direction2,
                              route: routeToChange2,
                              routeFromChange: routeFromChange2,
                              numberOfStops: numberOfStops2,
                              time: time2,
                              ticketPrice: ticketPriceCalculation(
                                numberOfStops2,
                              ),
                            ),
                          );
                        }
                      }
                      ///////////// في حاله عايزه تتهندل اللي هو يبدل في جامعه القاهرة في حاله الخط الثاني
                      ////////Spatial Case Stations in Line Three cairo university dirction and imbaba direction////////////////////////
                      if (spatialTest2.contains(
                            startStationController.text.trim(),
                          ) ||
                          spatialTest2.contains(
                            endStationController.text.trim(),
                          )) {
                        ///////////////////////line one to line three Cairo University/////////////////////
                        ///////////////////////No Bouns here ///////////////////////
                        if (lineOneStations.contains(
                              startStationController.text.trim(),
                            ) &&
                            lineThreeCairoUnversityDirction.contains(
                              endStationController.text.trim(),
                            )) {
                          int startIndex = lineOneStations.indexOf(
                            startStationController.text.trim(),
                          );
                          int interChangeIndexLineOne = lineOneStations.indexOf(
                            "Nasser",
                          );
                          String direction1 =
                              (interChangeIndexLineOne > startIndex)
                              ? "Helwan direction"
                              : "New El Marg";
                          List<String> routeToChange = getRoute(
                            startIndex: startIndex,
                            endIndex: interChangeIndexLineOne,
                            stations: lineOneStations,
                          );
                          int endIndex = lineThreeCairoUnversityDirction
                              .indexOf(endStationController.text.trim());
                          int interChangeIndexLineThree =
                              lineThreeCairoUnversityDirction.indexOf("Nasser");
                          String direction2 =
                              (endIndex > interChangeIndexLineThree)
                              ? "Cairo University direction"
                              : "Adly Mansour direction";
                          List<String> routeFromChange = getRoute(
                            startIndex: interChangeIndexLineThree,
                            endIndex: endIndex,
                            stations: lineThreeCairoUnversityDirction,
                          );
                          int numberOfStops =
                              (interChangeIndexLineOne - startIndex).abs() +
                              (endIndex - interChangeIndexLineThree).abs();
                          int time = numberOfStops * 2;
                          printResult(
                            numberOfStops: numberOfStops,
                            time: time,
                            direction1: direction1,
                            route: routeToChange,
                            direction2: direction2,
                            routeFromChange: routeFromChange,
                          );

                          data.add(
                            dataOutput(
                              direction1: direction1,
                              direction2: direction2,
                              route: routeToChange,
                              routeFromChange: routeFromChange,
                              numberOfStops: numberOfStops,
                              time: time,
                              ticketPrice: ticketPriceCalculation(
                                numberOfStops,
                              ),
                            ),
                          );
                        }
                        //////////////////////line two to line three Cairo University/////////////////////
                        if (endStationController.text.trim() !=
                                "Cairo University" &&
                            startStationController.text.trim() !=
                                "Cairo University") {
                          if (lineTwoStations.contains(
                                startStationController.text.trim(),
                              ) &&
                              lineThreeCairoUnversityDirction.contains(
                                endStationController.text.trim(),
                              )) {
                            int startIndex = lineTwoStations.indexOf(
                              startStationController.text.trim(),
                            );
                            int interChangeIndexLineTwo = lineTwoStations
                                .indexOf("Attaba");

                            String direction1 =
                                (interChangeIndexLineTwo > startIndex)
                                ? "El-Mounib direction"
                                : "Shubra El-Kheima direction";
                            List<String> routeToChange = getRoute(
                              startIndex: startIndex,
                              endIndex: interChangeIndexLineTwo,
                              stations: lineTwoStations,
                            );

                            int endIndex = lineThreeCairoUnversityDirction
                                .indexOf(endStationController.text.trim());
                            int interChangeIndexLineThree =
                                lineThreeCairoUnversityDirction.indexOf(
                                  "Attaba",
                                );

                            String direction2 =
                                (endIndex > interChangeIndexLineThree)
                                ? "Cairo University direction"
                                : "Adly Mansour direction";
                            List<String> routeFromChange = getRoute(
                              startIndex: interChangeIndexLineThree,
                              endIndex: endIndex,
                              stations: lineThreeCairoUnversityDirction,
                            );

                            int numberOfStops =
                                (interChangeIndexLineTwo - startIndex).abs() +
                                (endIndex - interChangeIndexLineThree).abs();

                            int time = numberOfStops * 2;

                            data.add(
                              dataOutput(
                                direction1: direction1,
                                direction2: direction2,
                                route: routeToChange,
                                routeFromChange: routeFromChange,
                                numberOfStops: numberOfStops,
                                time: time,
                                ticketPrice: ticketPriceCalculation(
                                  numberOfStops,
                                ),
                              ),
                            );
                          }
                        }
                        //////////////////////line three Cairo University to line one/////////////////////
                        ///////////////////No Bouns here ///////////////////////
                        else if (lineThreeCairoUnversityDirction.contains(
                              startStationController.text.trim(),
                            ) &&
                            lineOneStations.contains(
                              endStationController.text.trim(),
                            )) {
                          int startIndex = lineThreeCairoUnversityDirction
                              .indexOf(startStationController.text.trim());
                          int interChangeIndexLineThree =
                              lineThreeCairoUnversityDirction.indexOf("Nasser");
                          String direction1 =
                              (interChangeIndexLineThree > startIndex)
                              ? "Cairo University direction"
                              : "Adly Mansour direction";
                          List<String> routeToChange = getRoute(
                            startIndex: startIndex,
                            endIndex: interChangeIndexLineThree,
                            stations: lineThreeCairoUnversityDirction,
                          );
                          int endIndex = lineOneStations.indexOf(
                            endStationController.text.trim(),
                          );
                          int interChangeIndexLineOne = lineOneStations.indexOf(
                            "Nasser",
                          );
                          String direction2 =
                              (endIndex > interChangeIndexLineOne)
                              ? "Helwan direction"
                              : "New El Marg direction";
                          List<String> routeFromChange = getRoute(
                            startIndex: interChangeIndexLineOne,
                            endIndex: endIndex,
                            stations: lineOneStations,
                          );
                          int numberOfStops =
                              (interChangeIndexLineThree - startIndex).abs() +
                              (endIndex - interChangeIndexLineOne).abs();
                          int time = numberOfStops * 2;
                          printResult(
                            numberOfStops: numberOfStops,
                            time: time,
                            direction1: direction1,
                            route: routeToChange,
                            direction2: direction2,
                            routeFromChange: routeFromChange,
                          );

                          data.add(
                            dataOutput(
                              direction1: direction1,
                              direction2: direction2,
                              route: routeToChange,
                              routeFromChange: routeFromChange,
                              numberOfStops: numberOfStops,
                              time: time,
                              ticketPrice: ticketPriceCalculation(
                                numberOfStops,
                              ),
                            ),
                          );
                        }
                        //////////////////////line three Cairo University to line two/////////////////////
                        if (startStationController.text.trim() !=
                                "Cairo University" &&
                            endStationController.text.trim() !=
                                "Cairo University") {
                          if (lineThreeCairoUnversityDirction.contains(
                                startStationController.text.trim(),
                              ) &&
                              lineTwoStations.contains(
                                endStationController.text.trim(),
                              )) {
                            int startIndex = lineThreeCairoUnversityDirction
                                .indexOf(startStationController.text.trim());
                            int interChangeIndexLineThree =
                                lineThreeCairoUnversityDirction.indexOf(
                                  "Attaba",
                                );

                            // //////////////////////bouns ///////////////////////////////
                            int interChangeIndexLineThree2 =
                                lineThreeCairoUnversityDirction.indexOf(
                                  "Cairo University",
                                );
                            String direction1 =
                                (interChangeIndexLineThree > startIndex)
                                ? "Cairo University direction"
                                : "Adly Mansour direction";
                            /////////////////////bouns ///////////////////////////////
                            String direction1bouns =
                                (interChangeIndexLineThree > startIndex)
                                ? "Adly Mansour direction"
                                : "Cairo University direction";
                            List<String> routeToChange = getRoute(
                              startIndex: startIndex,
                              endIndex: interChangeIndexLineThree,
                              stations: lineThreeCairoUnversityDirction,
                            );

                            // /////////////////////bouns ///////////////////////////////
                            List<String> routeToChange2 = getRoute(
                              startIndex: startIndex,
                              endIndex: interChangeIndexLineThree2,
                              stations: lineThreeCairoUnversityDirction,
                            );
                            int endIndex = lineTwoStations.indexOf(
                              endStationController.text.trim(),
                            );
                            int interChangeIndexLineTwo = lineTwoStations
                                .indexOf("Attaba");

                            // /////////////////////bouns ///////////////////////////////
                            int interChangeIndexLineTwo2 = lineTwoStations
                                .indexOf("Cairo University");
                            String direction2 =
                                (endIndex > interChangeIndexLineTwo)
                                ? "El-Mounib direction"
                                : "Shubra El-Kheima direction";
                            List<String> routeFromChange = getRoute(
                              startIndex: interChangeIndexLineTwo,
                              endIndex: endIndex,
                              stations: lineTwoStations,
                            );

                            // /////////////////////bouns ///////////////////////////////
                            List<String> routeFromChange2 = getRoute(
                              startIndex: interChangeIndexLineTwo2,
                              endIndex: endIndex,
                              stations: lineTwoStations,
                            );
                            int numberOfStops =
                                (interChangeIndexLineThree - startIndex).abs() +
                                (endIndex - interChangeIndexLineTwo).abs();

                            //////////////////////bouns ///////////////////////////////
                            int numberOfStops2 =
                                (interChangeIndexLineThree2 - startIndex)
                                    .abs() +
                                (endIndex - interChangeIndexLineTwo2).abs();
                            int time = numberOfStops * 2;

                            /////////////////////bouns ///////////////////////////////
                            int time2 = numberOfStops2 * 2;
                            printResult(
                              numberOfStops: numberOfStops,
                              time: time,
                              direction1: direction1,
                              route: routeToChange,
                              direction2: direction2,
                              routeFromChange: routeFromChange,
                            );

                            data.add(
                              dataOutput(
                                direction1: direction1,
                                direction2: direction2,
                                route: routeToChange,
                                routeFromChange: routeFromChange,
                                numberOfStops: numberOfStops,
                                time: time,
                                ticketPrice: ticketPriceCalculation(
                                  numberOfStops,
                                ),
                              ),
                            );

                            /////////////////////bouns ///////////////////////////////
                            print("-----OR-----");
                            print("-----OR-----");
                            printResult(
                              numberOfStops: numberOfStops2,
                              time: time2,
                              direction1: direction1,
                              route: routeToChange2,
                              direction2: direction2,
                              routeFromChange: routeFromChange2,
                            );

                            data.add(
                              dataOutput(
                                direction1: direction1bouns,
                                direction2: direction2,
                                route: routeToChange2,
                                routeFromChange: routeFromChange2,
                                numberOfStops: numberOfStops2,
                                time: time2,
                                ticketPrice: ticketPriceCalculation(
                                  numberOfStops2,
                                ),
                              ),
                            );
                          }
                        }
                        ///////////////////////line three Imbaba to line three cairo//////////////////////
                        else if (spatialTest.contains(
                              startStationController.text.trim(),
                            ) ||
                            spatialTest.contains(
                              endStationController.text.trim(),
                            )) {
                          if (lineThreeImbabaDirction.contains(
                                startStationController.text.trim(),
                              ) &&
                              lineThreeCairoUnversityDirction.contains(
                                endStationController.text.trim(),
                              )) {
                            int startIndex = lineThreeImbabaDirction.indexOf(
                              startStationController.text.trim(),
                            );
                            int interChangeIndexLineThree =
                                lineThreeImbabaDirction.indexOf("Kit Kat");
                            String direction1 =
                                (interChangeIndexLineThree > startIndex)
                                ? "Imbaba direction"
                                : "Adly Mansour direction";
                            List<String> routeToChange = getRoute(
                              startIndex: startIndex,
                              endIndex: interChangeIndexLineThree,
                              stations: lineThreeImbabaDirction,
                            );
                            int endIndex = lineThreeCairoUnversityDirction
                                .indexOf(endStationController.text.trim());
                            int interChangeIndexLineThreeCairo =
                                lineThreeCairoUnversityDirction.indexOf(
                                  "Kit Kat",
                                );
                            String direction2 =
                                (endIndex > interChangeIndexLineThreeCairo)
                                ? "Cairo University direction"
                                : "Adly Mansour direction";
                            List<String> routeFromChange = getRoute(
                              startIndex: interChangeIndexLineThreeCairo,
                              endIndex: endIndex,
                              stations: lineThreeCairoUnversityDirction,
                            );
                            int numberOfStops =
                                (interChangeIndexLineThree - startIndex).abs() +
                                (endIndex - interChangeIndexLineThreeCairo)
                                    .abs();
                            int time = numberOfStops * 2;
                            printResult(
                              numberOfStops: numberOfStops,
                              time: time,
                              direction1: direction1,
                              route: routeToChange,
                              direction2: direction2,
                              routeFromChange: routeFromChange,
                            );

                            data.add(
                              dataOutput(
                                direction1: direction1,
                                direction2: direction2,
                                route: routeToChange,
                                routeFromChange: routeFromChange,
                                numberOfStops: numberOfStops,
                                time: time,
                                ticketPrice: ticketPriceCalculation(
                                  numberOfStops,
                                ),
                              ),
                            );
                          }
                        }
                        ///////////////////////line three cairo to line three Imbaba//////////////////////
                        if (spatialTest.contains(
                              startStationController.text.trim(),
                            ) ||
                            spatialTest.contains(
                              endStationController.text.trim(),
                            )) {
                          if (lineThreeCairoUnversityDirction.contains(
                                startStationController.text.trim(),
                              ) &&
                              lineThreeImbabaDirction.contains(
                                endStationController.text.trim(),
                              )) {
                            int startIndex = lineThreeCairoUnversityDirction
                                .indexOf(startStationController.text.trim());
                            int interChangeIndexLineThreeCairo =
                                lineThreeCairoUnversityDirction.indexOf(
                                  "Kit Kat",
                                );
                            String direction1 =
                                (interChangeIndexLineThreeCairo > startIndex)
                                ? "Cairo University direction"
                                : "Adly Mansour direction";
                            List<String> routeToChange = getRoute(
                              startIndex: startIndex,
                              endIndex: interChangeIndexLineThreeCairo,
                              stations: lineThreeCairoUnversityDirction,
                            );
                            int endIndex = lineThreeImbabaDirction.indexOf(
                              endStationController.text.trim(),
                            );
                            int interChangeIndexLineThree =
                                lineThreeImbabaDirction.indexOf("Kit Kat");
                            String direction2 =
                                (endIndex > interChangeIndexLineThree)
                                ? "Imbaba direction"
                                : "Adly Mansour direction";
                            List<String> routeFromChange = getRoute(
                              startIndex: interChangeIndexLineThree,
                              endIndex: endIndex,
                              stations: lineThreeImbabaDirction,
                            );
                            int numberOfStops =
                                (interChangeIndexLineThreeCairo - startIndex)
                                    .abs() +
                                (endIndex - interChangeIndexLineThree).abs();
                            int time = numberOfStops * 2;
                            printResult(
                              numberOfStops: numberOfStops,
                              time: time,
                              direction1: direction1,
                              route: routeToChange,
                              direction2: direction2,
                              routeFromChange: routeFromChange,
                            );
                            data.add(
                              dataOutput(
                                direction1: direction1,
                                direction2: direction2,
                                route: routeToChange,
                                routeFromChange: routeFromChange,
                                numberOfStops: numberOfStops,
                                time: time,
                                ticketPrice: ticketPriceCalculation(
                                  numberOfStops,
                                ),
                              ),
                            );
                          }
                        }
                      }

                      ////////////////////////line one to line two/////////////////////

                      if (lineOneStations.contains(
                            startStationController.text.trim(),
                          ) &&
                          lineTwoStations.contains(
                            endStationController.text.trim(),
                          )) {
                        int startIndex = lineOneStations.indexOf(
                          startStationController.text.trim(),
                        );
                        int interChangeIndexLineOne = lineOneStations.indexOf(
                          "Al-Shohadaa",
                        );

                        ////////////////////////bouns ///////////////////////////////
                        int interChangeIndexLineOne2 = lineOneStations.indexOf(
                          "Sadat",
                        );
                        String direction1 =
                            (interChangeIndexLineOne > startIndex)
                            ? "Helwan direction"
                            : "New El Marg";
                        List<String> routeToChange = getRoute(
                          startIndex: startIndex,
                          endIndex: interChangeIndexLineOne,
                          stations: lineOneStations,
                        );

                        /////////////////////////bouns ///////////////////////////////
                        List<String> routeToChange2 = getRoute(
                          startIndex: startIndex,
                          endIndex: interChangeIndexLineOne2,
                          stations: lineOneStations,
                        );
                        int endIndex = lineTwoStations.indexOf(
                          endStationController.text.trim(),
                        );
                        int interChangeIndexLineTwo = lineTwoStations.indexOf(
                          "Al-Shohadaa",
                        );

                        /////////////////////bouns ///////////////////////////////
                        int interChangeIndexLineTwo2 = lineTwoStations.indexOf(
                          "Sadat",
                        );
                        String direction2 = (endIndex > interChangeIndexLineTwo)
                            ? "El-Mounib direction"
                            : "Shubra El-Kheima";
                        List<String> routeFromChange = getRoute(
                          startIndex: interChangeIndexLineTwo,
                          endIndex: endIndex,
                          stations: lineTwoStations,
                        );

                        /////////////////////bouns ///////////////////////////////
                        List<String> routeFromChange2 = getRoute(
                          startIndex: interChangeIndexLineTwo2,
                          endIndex: endIndex,
                          stations: lineTwoStations,
                        );
                        int numberOfStops =
                            (interChangeIndexLineOne - startIndex).abs() +
                            (endIndex - interChangeIndexLineTwo).abs();

                        //////////////////////bouns ///////////////////////////////
                        int numberOfStops2 =
                            (interChangeIndexLineOne2 - startIndex).abs() +
                            (endIndex - interChangeIndexLineTwo2).abs();
                        int time = numberOfStops * 2;

                        /////////////////////bouns ///////////////////////////////
                        int time2 = numberOfStops2 * 2;

                        printResult(
                          numberOfStops: numberOfStops,
                          time: time,
                          direction1: direction1,
                          route: routeToChange,
                          direction2: direction2,
                          routeFromChange: routeFromChange,
                        );

                        data.add(
                          dataOutput(
                            direction1: direction1,
                            direction2: direction2,
                            route: routeToChange,
                            routeFromChange: routeFromChange,
                            numberOfStops: numberOfStops,
                            time: time,
                            ticketPrice: ticketPriceCalculation(numberOfStops),
                          ),
                        );

                        /////////////////////bouns ///////////////////////////////
                        print("-----OR-----");
                        print("-----OR-----");

                        printResult(
                          numberOfStops: numberOfStops2,
                          time: time2,
                          direction1: direction1,
                          route: routeToChange2,
                          direction2: direction2,
                          routeFromChange: routeFromChange2,
                        );

                        data.add(
                          dataOutput(
                            direction1: direction1,
                            direction2: direction2,
                            route: routeToChange2,
                            routeFromChange: routeFromChange2,
                            numberOfStops: numberOfStops2,
                            time: time2,
                            ticketPrice: ticketPriceCalculation(numberOfStops2),
                          ),
                        );
                      }
                      ////////////////////// line one to line three imbaba ///////////////////////////////
                      if (lineOneStations.contains(
                            startStationController.text.trim(),
                          ) &&
                          lineThreeImbabaDirction.contains(
                            endStationController.text.trim(),
                          )) {
                        int startIndex = lineOneStations.indexOf(
                          startStationController.text.trim(),
                        );
                        int interChangeIndexLineOne = lineOneStations.indexOf(
                          "Nasser",
                        );
                        String direction1 =
                            (interChangeIndexLineOne > startIndex)
                            ? "Helwan direction"
                            : "New El Marg";
                        List<String> routeToChange = getRoute(
                          startIndex: startIndex,
                          endIndex: interChangeIndexLineOne,
                          stations: lineOneStations,
                        );
                        int endIndex = lineThreeImbabaDirction.indexOf(
                          endStationController.text.trim(),
                        );
                        int interChangeIndexLineThree = lineThreeImbabaDirction
                            .indexOf("Nasser");
                        String direction2 =
                            (endIndex > interChangeIndexLineThree)
                            ? "Imbaba direction"
                            : "Adly Mansour direction";
                        /////////////////////////////////////////////////////////////////////////////////////////////
                        List<String> routeFromChange = getRoute(
                          startIndex: interChangeIndexLineThree,
                          endIndex: endIndex,
                          stations: lineThreeImbabaDirction,
                        );
                        int numberOfStops =
                            (interChangeIndexLineOne - startIndex).abs() +
                            (endIndex - interChangeIndexLineThree).abs();
                        int time = numberOfStops * 2;
                        printResult(
                          numberOfStops: numberOfStops,
                          time: time,
                          direction1: direction1,
                          route: routeToChange,
                          direction2: direction2,
                          routeFromChange: routeFromChange,
                        );
                        data.add(
                          dataOutput(
                            direction1: direction1,
                            direction2: direction2,
                            route: routeToChange,
                            routeFromChange: routeFromChange,
                            numberOfStops: numberOfStops,
                            time: time,
                            ticketPrice: ticketPriceCalculation(numberOfStops),
                          ),
                        );
                      }

                      //////////////////////line two to line one/////////////////////

                      if (lineTwoStations.contains(
                            startStationController.text.trim(),
                          ) &&
                          lineOneStations.contains(
                            endStationController.text.trim(),
                          )) {
                        int startIndex = lineTwoStations.indexOf(
                          startStationController.text.trim(),
                        );
                        int interChangeIndexLineTwo = lineTwoStations.indexOf(
                          "Al-Shohadaa",
                        );

                        // //////////////////////bouns ///////////////////////////////
                        int interChangeIndexLineTwo2 = lineTwoStations.indexOf(
                          "Sadat",
                        );
                        String direction1 =
                            (interChangeIndexLineTwo > startIndex)
                            ? "El-Mounib direction"
                            : "Shubra El-Kheima direction";
                        List<String> routeToChange = getRoute(
                          startIndex: startIndex,
                          endIndex: interChangeIndexLineTwo,
                          stations: lineTwoStations,
                        );

                        // /////////////////////bouns ///////////////////////////////
                        List<String> routeToChange2 = getRoute(
                          startIndex: startIndex,
                          endIndex: interChangeIndexLineTwo2,
                          stations: lineTwoStations,
                        );
                        int endIndex = lineOneStations.indexOf(
                          endStationController.text.trim(),
                        );
                        int interChangeIndexLineOne = lineOneStations.indexOf(
                          "Al-Shohadaa",
                        );

                        // /////////////////////bouns ///////////////////////////////
                        int interChangeIndexLineOne2 = lineOneStations.indexOf(
                          "Sadat",
                        );
                        String direction2 = (endIndex > interChangeIndexLineOne)
                            ? "Helwan direction"
                            : "New El Marg direction";
                        List<String> routeFromChange = getRoute(
                          startIndex: interChangeIndexLineOne,
                          endIndex: endIndex,
                          stations: lineOneStations,
                        );

                        // /////////////////////bouns ///////////////////////////////
                        List<String> routeFromChange2 = getRoute(
                          startIndex: interChangeIndexLineOne2,
                          endIndex: endIndex,
                          stations: lineOneStations,
                        );
                        int numberOfStops =
                            (interChangeIndexLineTwo - startIndex).abs() +
                            (endIndex - interChangeIndexLineOne).abs();

                        //////////////////////bouns ///////////////////////////////
                        int numberOfStops2 =
                            (interChangeIndexLineTwo2 - startIndex).abs() +
                            (endIndex - interChangeIndexLineOne2).abs();
                        int time = numberOfStops * 2;

                        /////////////////////bouns ///////////////////////////////
                        int time2 = numberOfStops2 * 2;
                        printResult(
                          numberOfStops: numberOfStops,
                          time: time,
                          direction1: direction1,
                          route: routeToChange,
                          direction2: direction2,
                          routeFromChange: routeFromChange,
                        );

                        data.add(
                          dataOutput(
                            direction1: direction1,
                            direction2: direction2,
                            route: routeToChange,
                            routeFromChange: routeFromChange,
                            numberOfStops: numberOfStops,
                            time: time,
                            ticketPrice: ticketPriceCalculation(numberOfStops),
                          ),
                        );

                        /////////////////////bouns ///////////////////////////////
                        print("-----OR-----");
                        print("-----OR-----");
                        printResult(
                          numberOfStops: numberOfStops2,
                          time: time2,
                          direction1: direction1,
                          route: routeToChange2,
                          direction2: direction2,
                          routeFromChange: routeFromChange2,
                        );

                        data.add(
                          dataOutput(
                            direction1: direction1,
                            direction2: direction2,
                            route: routeToChange2,
                            routeFromChange: routeFromChange2,
                            numberOfStops: numberOfStops2,
                            time: time2,
                            ticketPrice: ticketPriceCalculation(numberOfStops2),
                          ),
                        );
                      }
                      ///////////////////////line two to line three imbaba /////////////////////
                      if (lineTwoStations.contains(
                            startStationController.text.trim(),
                          ) &&
                          lineThreeImbabaDirction.contains(
                            endStationController.text.trim(),
                          )) {
                        int startIndex = lineTwoStations.indexOf(
                          startStationController.text.trim(),
                        );
                        int interChangeIndexLineTwo = lineTwoStations.indexOf(
                          "Attaba",
                        );

                        String direction1 =
                            (interChangeIndexLineTwo > startIndex)
                            ? "El-Mounib direction"
                            : "Shubra El-Kheima direction";
                        List<String> routeToChange = getRoute(
                          startIndex: startIndex,
                          endIndex: interChangeIndexLineTwo,
                          stations: lineTwoStations,
                        );

                        int endIndex = lineThreeImbabaDirction.indexOf(
                          endStationController.text.trim(),
                        );
                        int interChangeIndexLineThree = lineThreeImbabaDirction
                            .indexOf("Attaba");

                        String direction2 =
                            (endIndex > interChangeIndexLineThree)
                            ? "Imbaba direction"
                            : "Adly Mansour direction";
                        List<String> routeFromChange = getRoute(
                          startIndex: interChangeIndexLineThree,
                          endIndex: endIndex,
                          stations: lineThreeImbabaDirction,
                        );

                        int numberOfStops =
                            (interChangeIndexLineTwo - startIndex).abs() +
                            (endIndex - interChangeIndexLineThree).abs();

                        int time = numberOfStops * 2;

                        printResult(
                          numberOfStops: numberOfStops,
                          time: time,
                          direction1: direction1,
                          route: routeToChange,
                          direction2: direction2,
                          routeFromChange: routeFromChange,
                        );

                        data.add(
                          dataOutput(
                            direction1: direction1,
                            direction2: direction2,
                            route: routeToChange,
                            routeFromChange: routeFromChange,
                            numberOfStops: numberOfStops,
                            time: time,
                            ticketPrice: ticketPriceCalculation(numberOfStops),
                          ),
                        );
                      }
                      /////////////////////////////كمل تعديل في الباقي ابداء من بعد الخطوه دي /////////////////////////
                      ///////////////////////line three imbaba to line one/////////////////////
                      ////////////////////////No Bouns here ///////////////////////

                      if (lineThreeImbabaDirction.contains(
                            startStationController.text.trim(),
                          ) &&
                          lineOneStations.contains(
                            endStationController.text.trim(),
                          )) {
                        int startIndex = lineThreeImbabaDirction.indexOf(
                          startStationController.text.trim(),
                        );
                        int interChangeIndexLineThree = lineThreeImbabaDirction
                            .indexOf("Nasser");
                        String direction1 =
                            (interChangeIndexLineThree > startIndex)
                            ? "Imbaba direction"
                            : "Adly Mansour direction";
                        List<String> routeToChange = getRoute(
                          startIndex: startIndex,
                          endIndex: interChangeIndexLineThree,
                          stations: lineThreeImbabaDirction,
                        );
                        int endIndex = lineOneStations.indexOf(
                          endStationController.text.trim(),
                        );
                        int interChangeIndexLineOne = lineOneStations.indexOf(
                          "Nasser",
                        );
                        String direction2 = (endIndex > interChangeIndexLineOne)
                            ? "Helwan direction"
                            : "New El Marg direction";
                        List<String> routeFromChange = getRoute(
                          startIndex: interChangeIndexLineOne,
                          endIndex: endIndex,
                          stations: lineOneStations,
                        );
                        int numberOfStops =
                            (interChangeIndexLineThree - startIndex).abs() +
                            (endIndex - interChangeIndexLineOne).abs();
                        int time = numberOfStops * 2;
                        printResult(
                          numberOfStops: numberOfStops,
                          time: time,
                          direction1: direction1,
                          route: routeToChange,
                          direction2: direction2,
                          routeFromChange: routeFromChange,
                        );

                        data.add(
                          dataOutput(
                            direction1: direction1,
                            direction2: direction2,
                            route: routeToChange,
                            routeFromChange: routeFromChange,
                            numberOfStops: numberOfStops,
                            time: time,
                            ticketPrice: ticketPriceCalculation(numberOfStops),
                          ),
                        );
                      }

                      //////////////////////line three imbaba to line two/////////////////////

                      if (lineThreeImbabaDirction.contains(
                            startStationController.text.trim(),
                          ) &&
                          lineTwoStations.contains(
                            endStationController.text.trim(),
                          )) {
                        int startIndex = lineThreeImbabaDirction.indexOf(
                          startStationController.text.trim(),
                        );
                        int interChangeIndexLineThree = lineThreeImbabaDirction
                            .indexOf("Attaba");
                        String direction1 =
                            (interChangeIndexLineThree > startIndex)
                            ? "Imbaba direction"
                            : "Adly Mansour direction";
                        List<String> routeToChange = getRoute(
                          startIndex: startIndex,
                          endIndex: interChangeIndexLineThree,
                          stations: lineThreeImbabaDirction,
                        );
                        int endIndex = lineTwoStations.indexOf(
                          endStationController.text.trim(),
                        );
                        int interChangeIndexLineTwo = lineTwoStations.indexOf(
                          "Attaba",
                        );
                        String direction2 = (endIndex > interChangeIndexLineTwo)
                            ? "El-Mounib direction"
                            : "Shubra El-Kheima direction";
                        List<String> routeFromChange = getRoute(
                          startIndex: interChangeIndexLineTwo,
                          endIndex: endIndex,
                          stations: lineTwoStations,
                        );
                        int numberOfStops =
                            (interChangeIndexLineThree - startIndex).abs() +
                            (endIndex - interChangeIndexLineTwo).abs();
                        int time = numberOfStops * 2;
                        printResult(
                          numberOfStops: numberOfStops,
                          time: time,
                          direction1: direction1,
                          route: routeToChange,
                          direction2: direction2,
                          routeFromChange: routeFromChange,
                        );

                        data.add(
                          dataOutput(
                            direction1: direction1,
                            direction2: direction2,
                            route: routeToChange,
                            routeFromChange: routeFromChange,
                            numberOfStops: numberOfStops,
                            time: time,
                            ticketPrice: ticketPriceCalculation(numberOfStops),
                          ),
                        );
                      }

                      ///////////////// sort data by number of stops/////////////////////
                      data.sort(
                        (a, b) => a.numberOfStops.compareTo(b.numberOfStops),
                      );
                    },
                    child: const Text(
                      'plan trip',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            displayData(
                              text: 'Plan ',
                              spanText: '${index + 1}\n',
                            ),
                            displayData(
                              text: 'Number of stops: ',
                              spanText: '${data[index].numberOfStops}\n',
                            ),
                            displayData(
                              text: 'Estimated time to arrive: ',
                              spanText: '${data[index].time} minutes\n',
                            ),

                            displayData(
                              text: 'Ticket price: ',
                              spanText: '${data[index].ticketPrice}\n',
                            ),
                            displayData(
                              text: 'Direction: ',
                              spanText: '${data[index].direction1}\n',
                            ),

                            if (data[index].direction2.isNotEmpty)
                              displayData(
                                text: 'To Direction: ',
                                spanText: '${data[index].direction2}\n',
                              ),

                            displayData(
                              text: 'Route: ',
                              spanText: '${data[index].route.join(' -> ')}\n',
                            ),
                            if (data[index].routeFromChange.isNotEmpty)
                              displayData(
                                text: 'Route after change: ',
                                spanText:
                                    '${data[index].routeFromChange.join(' -> ')}\n',
                              ),
                            displayData(
                              text:
                                  'Thank you for using our metro trip planner!',
                              spanText: '',
                            ),
                            Divider(color: Colors.black),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text displayData({String text = '', String spanText = ''}) {
    return Text.rich(
      TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 20,
          backgroundColor: Colors.white,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: spanText,
            style: TextStyle(
              fontSize: 20,
              backgroundColor: Colors.white,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
