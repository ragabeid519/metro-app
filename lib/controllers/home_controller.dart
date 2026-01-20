import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/metro_constants.dart';
import '../models/metro_route.dart';
import '../services/metro_service.dart';

/// متحكم GetX لإدارة رحلات المترو
class HomeController extends GetxController {
  final startStationController = TextEditingController();
  final endStationController = TextEditingController();

  // المتغيرات التفاعلية
  final RxList<MetroRoute> routes = <MetroRoute>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool hasError = false.obs;

  // المحطات المخزنة مؤقتاً
  late final List<String> _allStations;
  late final Map<String, List<String>> _lineStations;

  @override
  void onInit() {
    super.onInit();
    _initializeStations();
  }

  /// تهيئة محطات المترو
  void _initializeStations() {
    _lineStations = {
      'line1': MetroConstants.lineOneStations,
      'line2': MetroConstants.lineTwoStations,
      'line3Imbaba': MetroConstants.lineThreeImbaba,
      'line3Cairo': MetroConstants.lineThreeCairoUniversity,
    };

    _allStations = MetroService.getAllStations();
  }

  /// الحصول على جميع محطات المترو لقائمة الاختيار
  List<String> getAllStations() => _allStations;

  /// حساب الرحلات بين محطتين
  Future<void> planTrip() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';
      routes.clear();

      final start = startStationController.text.trim();
      final end = endStationController.text.trim();

      // التحقق من صحة المدخلات
      MetroService.validateStations(start, end);

      // حساب الرحلات الممكنة
      final calculatedRoutes = _calculateAllPossibleRoutes(start, end);

      if (calculatedRoutes.isEmpty) {
        throw MetroException('لا توجد رحلة متاحة بين هاتين المحطتين');
      }

      // ترتيب الرحلات حسب عدد المحطات
      calculatedRoutes.sort(
        (a, b) => a.numberOfStops.compareTo(b.numberOfStops),
      );
      routes.addAll(calculatedRoutes);
    } on MetroException catch (e) {
      _handleError(e.message);
    } catch (e) {
      _handleError('حدث خطأ غير متوقع: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  /// حساب جميع الرحلات الممكنة بين محطتين
  List<MetroRoute> _calculateAllPossibleRoutes(String start, String end) {
    final calculatedRoutes = <MetroRoute>[];

    // رحلات بدون تحويل
    final directRoutes = _calculateDirectRoutes(start, end);
    calculatedRoutes.addAll(directRoutes);

    // رحلات مع تحويل
    final transferRoutes = _calculateTransferRoutes(start, end);
    calculatedRoutes.addAll(transferRoutes);

    return calculatedRoutes;
  }

  /// حساب الرحلات المباشرة
  List<MetroRoute> _calculateDirectRoutes(String start, String end) {
    final directRoutes = <MetroRoute>[];

    // الخط الأول
    if (_isInLine(start, 'line1') && _isInLine(end, 'line1')) {
      final route = _createRoute(start, end, 'line1', '');
      if (route != null) directRoutes.add(route);
    }

    // الخط الثاني
    if (_isInLine(start, 'line2') && _isInLine(end, 'line2')) {
      final route = _createRoute(start, end, 'line2', '');
      if (route != null) directRoutes.add(route);
    }

    // الخط الثالث - اتجاه إمبابة
    if (_isInLine(start, 'line3Imbaba') && _isInLine(end, 'line3Imbaba')) {
      final route = _createRoute(start, end, 'line3Imbaba', '');
      if (route != null) directRoutes.add(route);
    }
    // الخط الثالث - اتجاه جامعة القاهرة
    else if (_isInLine(start, 'line3Cairo') && _isInLine(end, 'line3Cairo')) {
      final route = _createRoute(start, end, 'line3Cairo', '');
      if (route != null) directRoutes.add(route);
    }

    return directRoutes;
  }

  /// حساب الرحلات مع التحويل
  List<MetroRoute> _calculateTransferRoutes(String start, String end) {
    final transferRoutes = <MetroRoute>[];

    // تحويل من الخط الأول إلى الخط الثاني
    if (start != MetroConstants.interchangeShohadaa &&
        end != MetroConstants.interchangeShohadaa) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line1', 'line2', [
          MetroConstants.interchangeShohadaa,
        ]),
      );
    }
    // تحويل من الخط الأول إلى الخط الثاني
    if (start != MetroConstants.interchangeSadat &&
        end != MetroConstants.interchangeSadat) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line1', 'line2', [
          MetroConstants.interchangeSadat,
        ]),
      );
    }
    // تحويل من الخط الأول إلى الخط الثالث
    if (end != MetroConstants.interchangeNasser &&
        start != MetroConstants.interchangeNasser) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line1', 'line3Imbaba', [
          MetroConstants.interchangeNasser,
        ]),
      );
    }
    if (MetroConstants.spatialTest2.contains(end) &&
        end != MetroConstants.interchangeNasser &&
        start != MetroConstants.interchangeNasser) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line1', 'line3Cairo', [
          MetroConstants.interchangeNasser,
        ]),
      );
    }

    // تحويل من الخط الثاني إلى الخط الأول
    if (start != MetroConstants.interchangeShohadaa &&
        end != MetroConstants.interchangeShohadaa) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line2', 'line1', [
          MetroConstants.interchangeShohadaa,
        ]),
      );
    }
    // تحويل من الخط الثاني إلى الخط الأول
    if (end != MetroConstants.interchangeSadat &&
        start != MetroConstants.interchangeSadat) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line2', 'line1', [
          MetroConstants.interchangeSadat,
        ]),
      );
    }
    // تحويل من الخط الثاني إلى الخط الثالث
    if (end != MetroConstants.interchangeAttaba &&
        start != MetroConstants.interchangeAttaba) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line2', 'line3Imbaba', [
          MetroConstants.interchangeAttaba,
        ]),
      );
    }
    if (MetroConstants.spatialTest2.contains(end) &&
        MetroConstants.interchangeAttaba != 'Attaba') {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line2', 'line3Cairo', [
          MetroConstants.interchangeAttaba,
        ]),
      );
    }
    if (!MetroConstants.spatialTest.contains(end) &&
        end != MetroConstants.interchangeCairoUniversity &&
        start != MetroConstants.interchangeCairoUniversity) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line2', 'line3Cairo', [
          MetroConstants.interchangeCairoUniversity,
        ]),
      );
    }

    // تحويلات الخط الثالث
    if (start != MetroConstants.interchangeNasser &&
        end != MetroConstants.interchangeNasser) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line3Imbaba', 'line1', [
          MetroConstants.interchangeNasser,
        ]),
      );
    }
    if (start != MetroConstants.interchangeAttaba &&
        end != MetroConstants.interchangeAttaba) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line3Imbaba', 'line2', [
          MetroConstants.interchangeAttaba,
        ]),
      );
    }
    if (MetroConstants.spatialTest2.contains(start) &&
        start != MetroConstants.interchangeNasser &&
        end != MetroConstants.interchangeNasser) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line3Cairo', 'line1', [
          MetroConstants.interchangeNasser,
        ]),
      );
    }
    if (MetroConstants.spatialTest2.contains(start) &&
        start != MetroConstants.interchangeAttaba &&
        end != MetroConstants.interchangeAttaba) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line3Cairo', 'line2', [
          MetroConstants.interchangeAttaba,
        ]),
      );
    }
    if (!MetroConstants.spatialTest.contains(start) &&
        start != MetroConstants.interchangeCairoUniversity &&
        end != MetroConstants.interchangeCairoUniversity) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line3Cairo', 'line2', [
          MetroConstants.interchangeCairoUniversity,
        ]),
      );
    }
    // تحويل داخل الخط الثالث
    if (MetroConstants.spatialTest.contains(start) &&
        MetroConstants.spatialTest2.contains(end)) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line3Imbaba', 'line3Cairo', [
          MetroConstants.interchangeKitKat,
        ]),
      );
    }
    if (MetroConstants.spatialTest2.contains(start) &&
        MetroConstants.spatialTest.contains(end)) {
      transferRoutes.addAll(
        _getTransferRoute(start, end, 'line3Cairo', 'line3Imbaba', [
          MetroConstants.interchangeKitKat,
        ]),
      );
    }
    return transferRoutes;
  }

  /// الحصول على رحلة مع تحويل
  List<MetroRoute> _getTransferRoute(
    String start,
    String end,
    String fromLine,
    String toLine,
    List<String> interchangeStations,
  ) {
    final routes = <MetroRoute>[];

    if (!_isInLine(start, fromLine) || !_isInLine(end, toLine)) {
      return routes;
    }

    for (final interchange in interchangeStations) {
      if (_isInLine(interchange, fromLine) && _isInLine(interchange, toLine)) {
        try {
          final route1 = _createRoute(start, interchange, fromLine, '');
          final route2 = _createRoute(interchange, end, toLine, '');

          if (route1 != null && route2 != null) {
            final combinedRoute = MetroRoute(
              numberOfStops: route1.numberOfStops + route2.numberOfStops,
              estimatedTime: route1.estimatedTime + route2.estimatedTime,
              ticketPrice: MetroService.calculateTicketPrice(
                route1.numberOfStops + route2.numberOfStops,
              ),
              direction1: route1.direction1,
              direction2: route2.direction1,
              route: route1.route,
              routeAfterChange: route2.route,
            );
            routes.add(combinedRoute);
          }
        } catch (e) {
          continue;
        }
      }
    }

    return routes;
  }

  /// إنشاء رحلة
  MetroRoute? _createRoute(
    String start,
    String end,
    String lineName,
    String direction,
  ) {
    try {
      final stations = _lineStations[lineName]!;
      final startIndex = MetroService.findStationIndex(start, stations);
      final endIndex = MetroService.findStationIndex(end, stations);

      if (startIndex == -1 || endIndex == -1) return null;

      final route = MetroService.getRoute(
        startIndex: startIndex,
        endIndex: endIndex,
        stations: stations,
      );

      final numberOfStops = (endIndex - startIndex).abs();
      final direction1 = _getLineDirection(startIndex, endIndex, lineName);

      return MetroRoute(
        numberOfStops: numberOfStops,
        estimatedTime: MetroService.calculateEstimatedTime(numberOfStops),
        ticketPrice: MetroService.calculateTicketPrice(numberOfStops),
        direction1: direction1,
        direction2: direction,
        route: route,
        routeAfterChange: [],
      );
    } catch (e) {
      return null;
    }
  }

  /// الحصول على اتجاه الخط
  String _getLineDirection(int startIndex, int endIndex, String lineName) {
    final endStations = _lineStations[lineName]!.last;
    final startStations = _lineStations[lineName]!.first;

    if (endIndex > startIndex) {
      return 'اتجاه $endStations';
    } else {
      return 'اتجاه $startStations';
    }
  }

  /// التحقق من وجود محطة في خط معين
  bool _isInLine(String station, String lineName) {
    return MetroService.isStationInLine(station, _lineStations[lineName]!);
  }

  /// معالجة الأخطاء
  void _handleError(String message) {
    hasError.value = true;
    errorMessage.value = message;
  }

  /// مسح البيانات
  void clearData() {
    routes.clear();
    hasError.value = false;
    errorMessage.value = '';
  }

  @override
  void onClose() {
    startStationController.dispose();
    endStationController.dispose();
    super.onClose();
  }
}
