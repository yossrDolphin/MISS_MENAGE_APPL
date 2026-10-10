import 'package:fixio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';


import 'primary_button.dart';

class HomeBanner extends StatelessWidget {
  final VoidCallback onPressed;

  const HomeBanner({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff2563EB),
            Color(0xff3B82F6),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Icon(
            Icons.home_repair_service,
            color: Colors.white,
            size: 42,
          ),

          const SizedBox(height: 18),

           Text(
           AppLocalizations.of(context)!.helpQst,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

           Text(
            AppLocalizations.of(context)!.bookTrust,
            style: TextStyle(
              color: Colors.white70,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 24),

          PrimaryButton(
            text: AppLocalizations.of(context)!.findServices,
            icon: Icons.arrow_forward,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}