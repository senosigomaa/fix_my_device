import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../booking/presentation/screens/order_tracking_screen.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          title: const Text('قائمة طلباتي'),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            tabs: [
              Tab(text: 'الطلبات الحالية (1)'),
              Tab(text: 'الطلبات السابقة (2)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Active Orders Tab
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildOrderCard(
                  context,
                  orderId: '#FD-8942',
                  serviceTitle: 'صيانة تكييف سبليت (شارب)',
                  date: 'اليوم، 01:30 م',
                  status: 'الفني في الطريق',
                  statusColor: AppColors.primary,
                  price: '120 جنيه',
                  isActive: true,
                ),
              ],
            ),
            // Past Orders Tab
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildOrderCard(
                  context,
                  orderId: '#FD-7721',
                  serviceTitle: 'صيانة غسالة أوتوماتيك (إل جي)',
                  date: '12 سبتمبر 2026',
                  status: 'مكتمل بنجاح',
                  statusColor: AppColors.success,
                  price: '280 جنيه',
                  isActive: false,
                ),
                _buildOrderCard(
                  context,
                  orderId: '#FD-6510',
                  serviceTitle: 'شحن فريون ثلاجة (سامسونج)',
                  date: '28 أغسطس 2026',
                  status: 'مكتمل بنجاح',
                  statusColor: AppColors.success,
                  price: '350 جنيه',
                  isActive: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard(
    BuildContext context, {
    required String orderId,
    required String serviceTitle,
    required String date,
    required String status,
    required Color statusColor,
    required String price,
    required bool isActive,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderId,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textPrimary),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            serviceTitle,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.access_time_rounded, size: 14, color: AppColors.textSecondary),
              const SizedBox(width: 4),
              Text(date, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            ],
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'التكلفة: $price',
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primary),
              ),
              if (isActive)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const OrderTrackingScreen()),
                    );
                  },
                  child: const Text('تتبع الطلب', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
