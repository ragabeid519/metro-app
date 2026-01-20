import 'package:dapi_game/constants/metro_stations.dart';

/// الثوابت الخاصة بتطبيق مترو الأنفاق
class MetroConstants {
  /// أسعار التذاكر حسب عدد المحطات
  static const Map<String, dynamic> ticketPrices = {
    '1-9': 8,
    '10-16': 10,
    '17-23': 15,
    '24+': 20,
  };

  /// وقت الانتقال بين كل محطتين (بالدقائق)
  static const int travelTimePerStop = 2;

  /// محطات الخط الأول
  static const List<String> lineOneStations = [
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

  /// محطات الخط الثاني
  static const List<String> lineTwoStations = [
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

  /// محطات الخط الثالث (اتجاه إمبابة)
  static const List<String> lineThreeImbaba = [
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
    "Sudan",
    "Imbaba",
    "El Bohy",
    "Al Qawmeyya",
    "Ring Road",
    "Rod El Farag Corridor",
  ];

  /// محطات الخط الثالث (اتجاه جامعة القاهرة)
  static const List<String> lineThreeCairoUniversity = [
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
    "Tawfikia",
    "Wadi El Nile",
    "Gamat El Dowal",
    "Boulak El Dakrour",
    "Cairo University",
  ];

  static const List<String> spatialTest = [
    "Sudan",
    "Imbaba",
    "El Bohy",
    "Al Qawmeyya",
    "Ring Road",
    "Rod El Farag Corridor",
  ];
  static const List<String> spatialTest2 = [
    "Tawfikia",
    "Wadi El Nile",
    "Gamat El Dowal",
    "Boulak El Dakrour",
    "Cairo University",
  ];

  /// نقاط التحويل (المحطات المشتركة بين الخطوط)
  static const String interchangeShohadaa = "Al-Shohadaa";
  static const String interchangeSadat = "Sadat";
  static const String interchangeNasser = "Nasser";
  static const String interchangeAttaba = "Attaba";
  static const String interchangeKitKat = "Kit Kat";
  static const String interchangeCairoUniversity = "Cairo University"; //

  static const List<MetroStation> cairoMetroStations = [
    // --- Line 1 (Blue) ---
    MetroStation(name: "Helwan", lat: 29.8489, lng: 31.3341, line: 1),
    MetroStation(name: "Ain Helwan", lat: 29.8633, lng: 31.3345, line: 1),
    MetroStation(
      name: "Helwan University",
      lat: 29.8767,
      lng: 31.3289,
      line: 1,
    ),
    MetroStation(name: "Wadi Hof", lat: 29.8972, lng: 31.3142, line: 1),
    MetroStation(name: "Hadayek Helwan", lat: 29.9097, lng: 31.3017, line: 1),
    MetroStation(name: "El-Maasara", lat: 29.9239, lng: 31.2911, line: 1),
    MetroStation(name: "Tura El-Balad", lat: 29.9442, lng: 31.2753, line: 1),
    MetroStation(name: "Kozzika", lat: 29.9344, lng: 31.2844, line: 1),
    MetroStation(name: "Tura El-Asmant", lat: 29.9514, lng: 31.2683, line: 1),
    MetroStation(name: "Hadayek El-Maadi", lat: 29.9711, lng: 31.2514, line: 1),
    MetroStation(name: "Maadi", lat: 29.9592, lng: 31.2592, line: 1),
    MetroStation(name: "Dar El-Salam", lat: 29.9914, lng: 31.2422, line: 1),
    MetroStation(name: "El-Zahraa", lat: 30.0053, lng: 31.2339, line: 1),
    MetroStation(name: "Mar Girgis", lat: 30.0064, lng: 31.2300, line: 1),
    MetroStation(
      name: "El-Malek El-Saleh",
      lat: 30.0156,
      lng: 31.2322,
      line: 1,
    ),
    MetroStation(name: "Sayeda Zeinab", lat: 30.0294, lng: 31.2336, line: 1),
    MetroStation(name: "Saad Zaghloul", lat: 30.0361, lng: 31.2361, line: 1),
    MetroStation(
      name: "Sadat",
      lat: 30.0444,
      lng: 31.2357,
      line: 1,
    ), // Intersection L1 & L2
    MetroStation(
      name: "Nasser",
      lat: 30.0528,
      lng: 31.2394,
      line: 1,
    ), // Intersection L1 & L3
    MetroStation(name: "Orabi", lat: 30.0553, lng: 31.2422, line: 1),
    MetroStation(
      name: "Al-Shohadaa",
      lat: 30.0614,
      lng: 31.2461,
      line: 1,
    ), // Intersection L1 & L2
    MetroStation(name: "Ghamra", lat: 30.0672, lng: 31.2658, line: 1),
    MetroStation(name: "El-Demerdash", lat: 30.0769, lng: 31.2764, line: 1),
    MetroStation(name: "Manshiet El-Sadr", lat: 30.0828, lng: 31.2853, line: 1),
    MetroStation(name: "Kobri El-Qobba", lat: 30.0875, lng: 31.2917, line: 1),
    MetroStation(
      name: "Hammamat El-Qobba",
      lat: 30.0919,
      lng: 31.2983,
      line: 1,
    ),
    MetroStation(name: "Saray El-Qobba", lat: 30.0989, lng: 31.3031, line: 1),
    MetroStation(name: "Hadayek El-Qobba", lat: 30.1042, lng: 31.3083, line: 1),
    MetroStation(name: "Ain Shams", lat: 30.1308, lng: 31.3139, line: 1),
    MetroStation(name: "Ezbet El-Nakhl", lat: 30.1506, lng: 31.3286, line: 1),
    MetroStation(name: "El-Marg", lat: 30.1561, lng: 31.3353, line: 1),
    MetroStation(name: "New El Marg", lat: 30.1633, lng: 31.3414, line: 1),

    // --- Line 2 (Red) ---
    MetroStation(name: "Shobra El Kheima", lat: 30.1226, lng: 31.2452, line: 2),
    MetroStation(
      name: "Kolleyet El-Zeraa",
      lat: 30.1133,
      lng: 31.2464,
      line: 2,
    ),
    MetroStation(name: "Mezallat", lat: 30.1044, lng: 31.2461, line: 2),
    MetroStation(name: "Khalafawy", lat: 30.0978, lng: 31.2458, line: 2),
    MetroStation(name: "St. Teresa", lat: 30.0886, lng: 31.2458, line: 2),
    MetroStation(name: "Rod El-Farag", lat: 30.0811, lng: 31.2456, line: 2),
    MetroStation(name: "Massarra", lat: 30.0711, lng: 31.2453, line: 2),
    MetroStation(
      name: "Ataba",
      lat: 30.0526,
      lng: 31.2471,
      line: 2,
    ), // Intersection L2 & L3
    MetroStation(name: "Mohamed Naguib", lat: 30.0456, lng: 31.2442, line: 2),
    MetroStation(name: "Opera", lat: 30.0422, lng: 31.2258, line: 2),
    MetroStation(name: "Dokki", lat: 30.0383, lng: 31.2119, line: 2),
    MetroStation(name: "El Bohoth", lat: 30.0356, lng: 31.2003, line: 2),
    MetroStation(
      name: "Cairo University",
      lat: 30.0263,
      lng: 31.2008,
      line: 2,
    ), // Intersection L2 & L3
    MetroStation(name: "Faisal", lat: 30.0169, lng: 31.2014, line: 2),
    MetroStation(name: "Giza", lat: 30.0075, lng: 31.2014, line: 2),
    MetroStation(name: "Omm El-Misryeen", lat: 30.0017, lng: 31.2075, line: 2),
    MetroStation(name: "Sakiat Mekki", lat: 29.9953, lng: 31.2111, line: 2),
    MetroStation(name: "El Mounib", lat: 29.9814, lng: 31.2131, line: 2),

    // --- Line 3 (Green) ---
    MetroStation(name: "Adly Mansour", lat: 30.1425, lng: 31.4011, line: 3),
    MetroStation(name: "El Haykestep", lat: 30.1364, lng: 31.3853, line: 3),
    MetroStation(
      name: "Omar Ibn El-Khattab",
      lat: 30.1294,
      lng: 31.3686,
      line: 3,
    ),
    MetroStation(name: "Qobaa", lat: 30.1250, lng: 31.3578, line: 3),
    MetroStation(name: "Hesham Barakat", lat: 30.1222, lng: 31.3497, line: 3),
    MetroStation(name: "El-Nozha", lat: 30.1189, lng: 31.3411, line: 3),
    MetroStation(name: "Nadie El-Shams", lat: 30.1194, lng: 31.3417, line: 3),
    MetroStation(name: "Alf Maskan", lat: 30.1136, lng: 31.3361, line: 3),
    MetroStation(name: "Heliopolis", lat: 30.1017, lng: 31.3342, line: 3),
    MetroStation(name: "Haroun", lat: 30.0975, lng: 31.3258, line: 3),
    MetroStation(name: "Al-Ahram", lat: 30.0917, lng: 31.3208, line: 3),
    MetroStation(name: "Koleyet El-Banat", lat: 30.0864, lng: 31.3139, line: 3),
    MetroStation(name: "Cairo Stadium", lat: 30.0736, lng: 31.3047, line: 3),
    MetroStation(name: "Fair Zone", lat: 30.0700, lng: 31.2972, line: 3),
    MetroStation(name: "Abbassia", lat: 30.0639, lng: 31.2853, line: 3),
    MetroStation(name: "Abdou Pasha", lat: 30.0617, lng: 31.2758, line: 3),
    MetroStation(name: "El-Geish", lat: 30.0583, lng: 31.2672, line: 3),
    MetroStation(name: "Bab El-Shaaria", lat: 30.0528, lng: 31.2586, line: 3),
    MetroStation(name: "Maspero", lat: 30.0539, lng: 31.2319, line: 3),
    MetroStation(name: "Safaa Hegazy", lat: 30.0608, lng: 31.2239, line: 3),
    MetroStation(name: "Kit Kat", lat: 30.0633, lng: 31.2136, line: 3),
  ];
}
