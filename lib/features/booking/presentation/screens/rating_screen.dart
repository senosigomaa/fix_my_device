import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../main_layout/presentation/screens/main_nav_screen.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _rating = 5;
  final Set<String> _selectedCompliments = {'دقة المواعيد', 'نظافة المكان'};

  final List<String> _compliments = [
    'دقة المواعيد',
    'احترافية الفني',
    'نظافة المكان',
    'سعر مناسب',
    'شرح وافٍ للعطل',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: AppColors.textPrimary),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const MainNavScreen()),
              (route) => false,
            );
          },
        ),
        title: const Text(
          'تقييم الخدمة',
          style: TextStyle(color: AppColors.textPrimary, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 36,
              backgroundColor: Color(0xFFEFF6FF),
              child: Text('👨‍🔧', style: TextStyle(fontSize: 36)),
            ),
            const SizedBox(height: 12),
            const Text(
              'أحمد محمود عبد الرازق',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
            ),
            const SizedBox(height: 4),
            const Text(
              'صيانة تكييف سبليت (شارب)',
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),

            // Rating Stars
            const Text(
              'كيف كانت تجربتك مع الفني والخدمة؟',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final starValue = index + 1;
                return IconButton(
                  icon: Icon(
                    starValue <= _rating ? Icons.star_rounded : Icons.star_outline_rounded,
                    color: Colors.amber,
                    size: 38,
                  ),
                  onPressed: () => setState(() => _rating = starValue),
                );
              }),
            ),
            const SizedBox(height: 20),

            // Compliments Tags
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'ما الذي أعجبك في الخدمة؟',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _compliments.map((item) {
                final isSelected = _selectedCompliments.contains(item);
                return FilterChip(
                  label: Text(item),
                  selected: isSelected,
                  selectedColor: AppColors.primary,
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                    fontSize: 11,
                  ),
                  onSelected: (val) {
                    setState(() {
                      if (val) {
                        _selectedCompliments.add(item);
                      } else {
                        _selectedCompliments.remove(item);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Feedback Text Area
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'اكتب رأيك أو ملاحظاتك هنا لتحسين جودة الخدمة...',
                hintStyle: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.border),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
            const SizedBox(height: 32),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('شكراً لتقييمك! نسعد دائماً بخدمتك')),
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const MainNavScreen()),
                    (route) => false,
                  );
                },
                child: const Text(
                  'إرسال التقييم',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
