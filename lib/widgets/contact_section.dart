import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF0066CC).withOpacity(0.9),
            const Color(0xFF003366),
          ],
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Prêt à rejoindre notre panel ?',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Inscrivez-vous dès maintenant et commencez à participer à nos études',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text(
              'S\'inscrire maintenant',
              style: TextStyle(
                color: Color(0xFF0066CC),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Divider(color: Colors.white54, height: 40),
          const Text(
            'Une question ? Contactez-nous',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContactMethod(
                icon: Icons.mail,
                detail: 'info@collectpanel.com',
              ),
              const SizedBox(width: 40),
              _buildContactMethod(
                icon: Icons.phone,
                detail: '+225 0703785519',
              ),
              const SizedBox(width: 40),
              _buildContactMethod(
                icon: Icons.chat,
                detail: 'Chat en direct',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactMethod({required IconData icon, required String detail}) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(width: 10),
        Text(
          detail,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}