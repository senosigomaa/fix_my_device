import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'rating_screen.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  // 0: تم التأكيد, 1: تم تعيين الفني, 2: الفني في الطريق, 3: جاري الإصلاح, 4: تم الانتهاء
  final int _currentStep = 2;

  final List<Map<String, String>> _steps = [
    {'title': 'تم تأكيد الحجز', 'desc': 'تم استلام طلبك وجاري إسناد الفني'},
    {'title': 'تم تعيين الفني', 'desc': 'الفني أحمد محمود استلم طلبك'},
    {'title': 'الفني في الطريق إليك', 'desc': 'الوقت المتوقع للوصول: 25 دقيقة'},
    {'title': 'جاري الفحص والإصلاح', 'desc': 'الفني يقوم بالكشف عن جهاز التكييف'},
    {'title': 'اكتملت الخدمة', 'desc': 'تم تسليم الجهاز وتفعيل الضمان'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('متابعة الطلب #FD-8942'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Technician Info Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xFFEFF6FF),
                        child: Text('👨‍🔧', style: TextStyle(fontSize: 28)),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'أحمد محمود عبد الرازق',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.textPrimary),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'خبير صيانة تكييف وتبريد معتمد',
                              style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  '4.9 (124 تقييم)',
                                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Call & Chat Actions
                      Row(
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.primary.withOpacity(0.08),
                              shape: const CircleBorder(),
                            ),
                            icon: const Icon(Icons.call_rounded, color: AppColors.primary, size: 20),
                            onPressed: () {},
                          ),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.primary.withOpacity(0.08),
                              shape: const CircleBorder(),
                            ),
                            icon: const Icon(Icons.chat_bubble_outline_rounded, color: AppColors.primary, size: 20),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Timeline Steps Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'مراحل تنفيذ الخدمة',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 16),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _steps.length,
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          width: 2,
                          height: 24,
                          color: index < _currentStep ? AppColors.primary : AppColors.border,
                        ),
                      );
                    },
                    itemBuilder: (context, index) {
                      final isDone = index < _currentStep;
                      final isCurrent = index == _currentStep;

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isDone
                                  ? AppColors.primary
                                  : isCurrent
                                      ? AppColors.primary.withOpacity(0.12)
                                      : AppColors.background,
                              border: Border.all(
                                color: isDone || isCurrent ? AppColors.primary : AppColors.border,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              isDone
                                  ? Icons.check
                                  : isCurrent
                                      ? Icons.circle
                                      : Icons.access_time_rounded,
                              size: 16,
                              color: isDone
                                  ? Colors.white
                                  : isCurrent
                                      ? AppColors.primary
                                      : AppColors.textMuted,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _steps[index]['title']!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: isCurrent || isDone ? FontWeight.bold : FontWeight.normal,
                                    color: isCurrent || isDone ? AppColors.textPrimary : AppColors.textMuted,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _steps[index]['desc']!,
                                  style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Order Details Preview Card
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('الجهاز المطلوب', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      Text('تكييف سبليت (شارب)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('طريقة الدفع', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      Text('كاش عند الزيارة', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('الإجمالي المستحق', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      Text('120 جنيه', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primary)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Simulate Finish Service Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RatingScreen()),
                  );
                },
                child: const Text(
                  'اكتمال الإصلاح والتقييم',
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
