import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'order_summary_screen.dart';

class ScheduleAddressScreen extends StatefulWidget {
  const ScheduleAddressScreen({super.key});

  @override
  State<ScheduleAddressScreen> createState() => _ScheduleAddressScreenState();
}

class _ScheduleAddressScreenState extends State<ScheduleAddressScreen> {
  int _visitType = 0;
  int _selectedDay = 2;
  int _selectedSlot = 1;

  final List<String> _days = ['اليوم', 'غداً', 'الأربعاء', 'الخميس'];
  final List<String> _slots = ['الفترة الصباحية (9 ص - 12 ظ)', 'فترة الظهيرة (1 م - 4 م)', 'الفترة المسائية (5 م - 9 م)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('الموعد والعنوان'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(24),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'الخطوة 3 من 4: الوقت والموقع',
              style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 12),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('نوع الزيارة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => setState(() => _visitType = 0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _visitType == 0 ? AppColors.primary.withOpacity(0.08) : Colors.white,
                        border: Border.all(color: _visitType == 0 ? AppColors.primary : AppColors.border, width: _visitType == 0 ? 2 : 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Text('📅 زيارة مجدولة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () => setState(() => _visitType = 1),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _visitType == 1 ? AppColors.primary.withOpacity(0.08) : Colors.white,
                        border: Border.all(color: _visitType == 1 ? AppColors.primary : AppColors.border, width: _visitType == 1 ? 2 : 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Text('⚡ زيارة طارئة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('اختر يوم الزيارة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_days.length, (index) {
                final isSelected = _selectedDay == index;
                return InkWell(
                  onTap: () => setState(() => _selectedDay = index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: isSelected ? AppColors.primary : AppColors.border),
                    ),
                    child: Text(
                      _days[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            const Text('الفترة الزمنية المناسبة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 10),
            Column(
              children: List.generate(_slots.length, (index) {
                final isSelected = _selectedSlot == index;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: InkWell(
                    onTap: () => setState(() => _selectedSlot = index),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primary.withOpacity(0.06) : Colors.white,
                        border: Border.all(color: isSelected ? AppColors.primary : AppColors.border),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_off, color: isSelected ? AppColors.primary : AppColors.textSecondary, size: 18),
                          const SizedBox(width: 8),
                          Text(_slots[index], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.border),
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on_outlined, color: AppColors.primary, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text('المنزل: الحي الأول، شارع النخيل، عمارة 14 - الشيخ زايد', style: TextStyle(fontSize: 11, color: AppColors.textPrimary)),
                  ),
                  Text('تغيير', style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const OrderSummaryScreen()),
                  );
                },
                child: const Text('متابعة لملخص الطلب والدفع', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
