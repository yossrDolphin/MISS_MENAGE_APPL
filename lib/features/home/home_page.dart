import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixio/features/services/presentation/categories_page.dart';
import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../services/models/service.dart';
import '../services/presentation/service_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
  elevation: 0,

  centerTitle: true,
  iconTheme: const IconThemeData(color: Colors.black87),
    leading: Builder(
    builder: (context) => InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.black12,
        onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Image.asset(
          'assets/fixiologo.png',
          height: 32,
          fit: BoxFit.contain,
        ),
      ),
    ),
  ),

  actions: [
    IconButton(
      tooltip: 'Logout',
      icon: const Icon(Icons.logout, color: Colors.black),
      onPressed: () async {
        final confirm = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Do you really want to log out?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Logout'),
              ),
            ],
          ),
        );

        if (confirm == true) {
          await FirebaseAuth.instance.signOut();
        }
      },
    ),
  ],
),
  drawer: _buildDrawer(context),


      body: const CategoriesPage(),
    );
  }
Widget _buildDrawer(BuildContext context) {
  return Drawer(
    width: MediaQuery.of(context).size.width * 0.75, // 75% de l’écran
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
    ),
    child: Column(
      children: [
        const SizedBox(height: 50),

        // LOGO
        Image.asset(
          'assets/fixiologo.png',
          height: 40,
        ),

        const SizedBox(height: 30),

        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),

        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () {},
        ),

        const Spacer(),

        const Divider(),

        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
        ),

        const SizedBox(height: 20),
      ],
    ),
  );
}

}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.silver,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary, size: 32),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // NEXT STEP: navigate to service details
            final service = Service(
             name: title,
             description: subtitle,
             icon: icon,
             );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ServiceDetailsPage(service: service),
          ),
        );
        },
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
           // LOGO
         Image.asset(
          'assets/fixioWelcome.png',
          height: 50,
        ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome to Fixio',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Trusted home services, all in one place.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    /*
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
    */
  return const CategoriesPage();


  }
}