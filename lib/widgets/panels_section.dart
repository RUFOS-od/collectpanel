import 'package:flutter/material.dart';

class PanelsSection extends StatelessWidget {
  const PanelsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: const Color(0xFFF5F9FC),
      child: Column(
        children: [
          const Text(
            'Nos panels de consommateurs',
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPanelCard(
                title: 'Panel Grand Public',
                description: 'Participez à des études sur une grande variété de produits et services du quotidien.',
              ),
              _buildPanelCard(
                title: 'Panel B2B',
                description: 'Donnez votre avis sur des solutions professionnelles si vous êtes décideur en entreprise.',
              ),
              _buildPanelCard(
                title: 'Panel Spécialisé',
                description: 'Rejoignez des panels ciblés selon vos domaines d\'expertise ou centres d\'intérêt.',
              ),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0066CC),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: const Text(
              'Découvrir tous nos panels',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPanelCard({
    required String title,
    required String description,
  }) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFF0066CC).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.people,
              size: 60,
              color: Color(0xFF0066CC),
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
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: const Text(
              'En savoir plus →',
              style: TextStyle(
                color: Color(0xFF0066CC),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}