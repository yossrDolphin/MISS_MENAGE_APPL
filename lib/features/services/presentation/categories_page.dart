import 'package:fixio/core/widgets/app_search_bar.dart';
import 'package:fixio/core/widgets/home_banner.dart';
import 'package:fixio/core/widgets/section_title.dart';
import 'package:fixio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'services_page.dart';

import 'widgets/category_card.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Greeting
             Text(
              AppLocalizations.of(context)!.welcome,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 6),

             Text(
              AppLocalizations.of(context)!.findBest,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 24),

            /// Search
            const AppSearchBar(),

            const SizedBox(height: 24),

            /// Banner
            HomeBanner(
              onPressed: () {},
            ),

            const SizedBox(height: 32),

            SectionTitle(
              title: AppLocalizations.of(context)!.categories,
            ),

            const SizedBox(height: 18),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: 1.05,
              children: [
                CategoryCard(
                  title:   AppLocalizations.of(context)!.cleaning,
                  icon: Icons.cleaning_services,
                  color: Colors.orange,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const ServicesPage(category: "Cleaning"),
                      ),
                    );
                  },
                ),

                CategoryCard(
                  title:   AppLocalizations.of(context)!.plumbing,
                  icon: Icons.plumbing,
                  color: Colors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const ServicesPage(category: "Plumbing"),
                      ),
                    );
                  },
                ),

                CategoryCard(
                  title:   AppLocalizations.of(context)!.electrical,
                  icon: Icons.electrical_services,
                  color: Colors.amber,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const ServicesPage(category: "Electricity"),
                      ),
                    );
                  },
                ),

                CategoryCard(
                  title:   AppLocalizations.of(context)!.installation,
                  icon: Icons.handyman,
                  color: Colors.green,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const ServicesPage(category: "Installation"),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 36),

            const SectionTitle(
              title: "Popular Services",
            ),

            const SizedBox(height: 16),

            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.comingSoon,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}