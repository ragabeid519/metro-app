/// نموذج بيانات الرحلة
class MetroRoute {
  final int numberOfStops;
  final int estimatedTime;
  final int ticketPrice;
  final String direction1;
  final String direction2;
  final List<String> route;
  final List<String> routeAfterChange;

  MetroRoute({
    required this.numberOfStops,
    required this.estimatedTime,
    required this.ticketPrice,
    required this.direction1,
    required this.direction2,
    required this.route,
    required this.routeAfterChange,
  });

  /// نسخ كائن الرحلة مع إمكانية تغيير البيانات
  MetroRoute copyWith({
    int? numberOfStops,
    int? estimatedTime,
    int? ticketPrice,
    String? direction1,
    String? direction2,
    List<String>? route,
    List<String>? routeAfterChange,
  }) {
    return MetroRoute(
      numberOfStops: numberOfStops ?? this.numberOfStops,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      ticketPrice: ticketPrice ?? this.ticketPrice,
      direction1: direction1 ?? this.direction1,
      direction2: direction2 ?? this.direction2,
      route: route ?? this.route,
      routeAfterChange: routeAfterChange ?? this.routeAfterChange,
    );
  }
}

/// استثناء مخصص للأخطاء المتعلقة بالمترو
class MetroException implements Exception {
  final String message;

  MetroException(this.message);

  @override
  String toString() => 'MetroException: $message';
}
