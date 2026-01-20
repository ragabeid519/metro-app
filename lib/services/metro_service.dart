import '../constants/metro_constants.dart';
import '../models/metro_route.dart';

/// خدمة حساب رحلات المترو
class MetroService {
  /// حساب سعر التذكرة بناءً على عدد المحطات
  static int calculateTicketPrice(int numberOfStops) {
    if (numberOfStops >= 1 && numberOfStops <= 9) {
      return MetroConstants.ticketPrices['1-9'];
    } else if (numberOfStops >= 10 && numberOfStops <= 16) {
      return MetroConstants.ticketPrices['10-16'];
    } else if (numberOfStops >= 17 && numberOfStops <= 23) {
      return MetroConstants.ticketPrices['17-23'];
    } else if (numberOfStops >= 24) {
      return MetroConstants.ticketPrices['24+'];
    }
    return 0;
  }

  /// حساب الوقت المتوقع للوصول
  static int calculateEstimatedTime(int numberOfStops) {
    return numberOfStops * MetroConstants.travelTimePerStop;
  }

  /// الحصول على المسار بين محطتين
  static List<String> getRoute({
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

  /// التحقق من وجود محطة في قائمة
  static bool isStationInLine(String station, List<String> stations) {
    return stations.contains(station.trim());
  }

  /// البحث عن فهرس المحطة
  static int findStationIndex(String station, List<String> stations) {
    return stations.indexOf(station.trim());
  }

  /// التحقق من صحة المدخلات
  static void validateStations(String startStation, String endStation) {
    if (startStation.isEmpty || endStation.isEmpty) {
      throw MetroException('يرجى اختيار محطة البداية والنهاية');
    }

    if (startStation.trim() == endStation.trim()) {
      throw MetroException('محطة البداية والنهاية يجب أن تكونا مختلفتين');
    }
  }

  /// الحصول على جميع محطات المترو
  static List<String> getAllStations() {
    final allStations = <String>{};
    allStations.addAll(MetroConstants.lineOneStations);
    allStations.addAll(MetroConstants.lineTwoStations);
    allStations.addAll(MetroConstants.lineThreeImbaba);
    allStations.addAll(MetroConstants.lineThreeCairoUniversity);
    return allStations.toList();
  }

  /// التحقق من وجود محطة في النظام
  static bool isValidStation(String station) {
    return getAllStations().contains(station.trim());
  }
}
