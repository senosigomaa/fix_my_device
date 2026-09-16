import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'schedule_address_screen.dart';

class FaultDetailsScreen extends StatefulWidget {
  const FaultDetailsScreen({super.key});

  @override
  State<FaultDetailsScreen> createState() => _FaultDetailsScreenState();
}

class _FaultDetailsScreenState extends State<FaultDetailsScreen> {
  final List<String> _issues = ['لا يبرد جيداً', 'تسريب مياه', 'صوت مزعج', 'لا يعمل تماماً'];
  final Set<int> _selectedIssues = {0};

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
        title: const Text('تفاصيل العطل'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(24),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'الخطوة 2 من 4: تحديد المشكلة',
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
            const Text('الأعطال الشائعة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(_issues.length, (index) {
                final isSelected = _selectedIssues.contains(index);
                return FilterChip(
                  label: Text(_issues[index]),
                  selected: isSelected,
                  selectedColor: AppColors.primary,
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                    fontSize: 12,
                  ),
                  onSelected: (val) {
                    setState(() {
                      if (val) {
                        _selectedIssues.add(index);
                      } else {
                        _selectedIssues.remove(index);
                      }
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            const Text('وصف إضافي للمشكلة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 8),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'اكتب تفاصيل إضافية عن العطل إن وجدت...',
                hintStyle: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: AppColors.border)),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
            const SizedBox(height: 20),
            const Text('الصور والمرفقات (اختياري)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: AppColors.border),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_outlined, color: AppColors.primary, size: 20),
                    label: const Text('إضافة صورة', style: TextStyle(color: AppColors.textPrimary, fontSize: 12)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: AppColors.border),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.mic_none_rounded, color: AppColors.primary, size: 20),
                    label: const Text('تسجيل صوتي', style: TextStyle(color: AppColors.textPrimary, fontSize: 12)),
                  ),
                ),
              ],
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
                    MaterialPageRoute(builder: (_) => const ScheduleAddressScreen()),
                  );
                },
                child: const Text('متابعة لتحديد الموعد', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
