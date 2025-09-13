import 'package:flutter/material.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            'Comment ça marche',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF003366),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 60,
            height: 4,
            color: const Color(0xFF0066CC),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStep(
                number: 1,
                title: 'Inscription',
                description: 'Créez votre profil en quelques minutes pour rejoindre notre panel de consommateurs.',
                icon: Icons.person_add,
              ),
              _buildStep(
                number: 2,
                title: 'Questionnaires',
                description: 'Répondez à des enquêtes ciblées sur vos centres d\'intérêt et habitudes de consommation.',
                icon: Icons.assignment,
              ),
              _buildStep(
                number: 3,
                title: 'Récompenses',
                description: 'Gagnez des points échangeables contre des cadeaux ou des dons à des associations.',
                icon: Icons.card_giftcard,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required int number,
    required String title,
    required String description,
    required IconData icon,
  }) {
    return SizedBox(
      width: 280,
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF0066CC),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'ÉTAPE $number',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0066CC),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF003366),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}