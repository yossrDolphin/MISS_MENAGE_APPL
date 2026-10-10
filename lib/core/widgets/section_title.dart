import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const SectionTitle({
    super.key,
    required this.title,
    this.actionText,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.title,
          ),

          if (actionText != null)
            TextButton(
              onPressed: onActionPressed,
              child: Text(actionText!),
            ),
        ],
      ),
    );
  }
}