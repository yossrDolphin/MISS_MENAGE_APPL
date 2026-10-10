import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../theme/app_shadows.dart';
import '../theme/app_text_styles.dart';
import 'primary_button.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          AppShadows.card,
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 30,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        title,
                        style: AppTextStyles.title,
                      ),

                      const SizedBox(height: 4),

                      Text(
                        description,
                        style: AppTextStyles.caption,
                      ),

                    ],
                  ),
                ),

              ],
            ),

            const SizedBox(height: 18),

            Row(
              children: const [

                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),

                SizedBox(width: 4),

                Text(
                  "4.9",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),

                SizedBox(width: 4),

                Text("(120 reviews)"),

              ],
            ),

            const SizedBox(height: 18),

            PrimaryButton(
              text: "Book Now",
              icon: Icons.calendar_today,
              onPressed: onTap,
            ),

          ],
        ),
      ),
    );
  }
}