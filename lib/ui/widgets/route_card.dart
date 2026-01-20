import 'package:flutter/material.dart';
import '../../models/metro_route.dart';

/// عنصر واجهة عرض الرحلة
class RouteCard extends StatelessWidget {
  final MetroRoute route;
  final int planIndex;

  const RouteCard({super.key, required this.route, required this.planIndex});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // رقم الخطة
            _buildInfoRow('الخطة', '$planIndex', Colors.blue),
            const SizedBox(height: 12),

            // عدد المحطات
            _buildInfoRow(
              'عدد المحطات',
              '${route.numberOfStops}',
              Colors.orange,
            ),
            const SizedBox(height: 12),

            // الوقت المتوقع
            _buildInfoRow(
              'الوقت المتوقع',
              'دقيقة ${route.estimatedTime}',
              Colors.green,
            ),
            const SizedBox(height: 12),

            // سعر التذكرة
            _buildInfoRow(
              'سعر التذكرة',
              ' ${route.ticketPrice} جنيه ',
              Colors.red,
            ),
            const SizedBox(height: 16),

            // الاتجاه الأول
            _buildDirectionSection(
              'الاتجاه الأول',
              route.direction1,
              route.route,
            ),

            // الاتجاه الثاني (إن وجد)
            if (route.direction2.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildDirectionSection(
                'الاتجاه الثاني',
                route.direction2,
                route.routeAfterChange,
              ),
            ],

            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                '!شكراً لاستخدامك تطبيق التخطيط لرحلات المترو',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// بناء صف معلومات
  Widget _buildInfoRow(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  /// بناء قسم الاتجاه
  Widget _buildDirectionSection(
    String label,
    String direction,
    List<String> route,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          direction,
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            route.join(' → '),
            style: const TextStyle(fontSize: 12, color: Colors.black87),
            maxLines: 9,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
