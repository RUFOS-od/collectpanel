import 'package:flutter/material.dart';

class BenefitsSection extends StatelessWidget {
  const BenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            'Les avantages CollectPanel',
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
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _buildBenefit(
                icon: Icons.emoji_events,
                title: 'Récompenses attractives',
                description: 'Cumulez des points et échangez-les contre des cadeaux, des chèques-cadeaux ou faites un don à une association.',
              ),
              _buildBenefit(
                icon: Icons.access_time,
                title: 'Flexibilité totale',
                description: 'Répondez aux enquêtes quand vous voulez, où vous voulez, depuis votre ordinateur, tablette ou smartphone.',
              ),
              _buildBenefit(
                icon: Icons.lock,
                title: 'Confidentialité garantie',
                description: 'Vos données personnelles sont protégées et ne sont jamais communiquées à des fins commerciales.',
              ),
              _buildBenefit(
                icon: Icons.insights,
                title: 'Influencez le marché',
                description: 'Votre opinion compte et influence directement les produits et services de demain.',
              ),
              _buildBenefit(
                icon: Icons.people, // Remplacement de Icons.diversity
                title: 'Communauté exclusive',
                description: 'Rejoignez une communauté de panélistes passionnés et participez à des études exclusives.',
              ),
              _buildBenefit(
                icon: Icons.support,
                title: 'Support réactif',
                description: 'Notre équipe est là pour vous accompagner et répondre à toutes vos questions.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBenefit({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return SizedBox(
      width: 350,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFF0066CC).withOpacity(0.1),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF0066CC),
              size: 36,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF003366),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
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