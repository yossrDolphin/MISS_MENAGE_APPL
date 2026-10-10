import 'package:fixio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final String? hintText;

  const AppSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
     this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: onTap != null,
      decoration: InputDecoration(
        hintText:  hintText ?? AppLocalizations.of(context)!.searchHint,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.tune),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}