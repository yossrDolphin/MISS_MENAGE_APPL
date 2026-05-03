import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../../core/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final AuthService authService = AuthService();

  String? verificationId;
  bool codeSent = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenue',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            /// 📱 PHONE
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Téléphone (+216...)',
              ),
            ),

            const SizedBox(height: 16),

            /// 🔘 SEND SMS
            ElevatedButton(
              onPressed: loading
                  ? null
                  : () async {
                      setState(() => loading = true);

                      await authService.signInWithPhone(
                        phoneNumber: phoneController.text.trim(),
                        codeSent: (id) {
                          setState(() {
                            verificationId = id;
                            codeSent = true;
                            loading = false;
                          });
                        },
                        onError: (e) {
                           if (!mounted) return;
                            setState(() => loading = false);
                             ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                               content: Text(e.message ?? 'Erreur Firebase'),
                             ),
                             );
                        },
                      );
                    },
              child: Text(codeSent ? 'Code envoyé' : 'Envoyer le code'),
            ),

            /// 🔢 OTP
            if (codeSent) ...[
              const SizedBox(height: 16),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Code SMS',
                ),
              ),
              const SizedBox(height: 16),

              /// ✅ VERIFY OTP
              ElevatedButton(
                onPressed: () async {
                  try {
                    await authService.verifyOtp(
                      verificationId: verificationId!,
                      smsCode: otpController.text.trim(),
                    );
                if (!mounted) return;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomePage(),
                      ),
                    );
                  } catch (e) {
                   if (!mounted) return;

                     ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(
                      content: Text('Code invalide'),
                        ),
                       );
                  }
                },
                child: const Text('Se connecter'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
