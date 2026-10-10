import 'package:flutter/material.dart';

import '../theme/app_shadows.dart';
import '../theme/app_text_styles.dart';
import 'status_chip.dart';

class BookingCard extends StatelessWidget {
  final String serviceName;
  final String date;
  final String status;
  final IconData icon;
  final VoidCallback? onTap;

  const BookingCard({
    super.key,
    required this.serviceName,
    required this.date,
    required this.status,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            AppShadows.card,
          ],
        ),
        child: Row(
          children: [

            CircleAvatar(
              radius: 26,
              child: Icon(icon),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    serviceName,
                    style: AppTextStyles.title,
                  ),

                  const SizedBox(height: 6),

                  Text(
                    date,
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),

            StatusChip(
              status: status,
            ),

          ],
        ),
      ),
    );
  }
}