import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      color: const Color(0xFF002244),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFooterColumn(
                title: 'CollectPanel',
                items: [
                  'À propos de nous',
                  'Notre histoire',
                  'Nos valeurs',
                  'Carrières',
                  'Espace presse',
                ],
              ),
              _buildFooterColumn(
                title: 'Panels',
                items: [
                  'Panel Grand Public',
                  'Panel B2B',
                  'Panel Spécialisé',
                  'Devenir panéliste',
                  'Espace panéliste',
                ],
              ),
              _buildFooterColumn(
                title: 'Support',
                items: [
                  'FAQ',
                  'Centre d\'aide',
                  'Contact',
                  'Confidentialité',
                  'Conditions d\'utilisation',
                ],
              ),
              _buildFooterColumn(
                title: 'Suivez-nous',
                items: [
                  'LinkedIn',
                  'Twitter',
                  'Facebook',
                  'Instagram',
                  'YouTube',
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Divider(color: Colors.white24),
          const SizedBox(height: 20),
          const Text(
            '© 2023 CollectPanel France. Tous droits réservés.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterColumn({required String title, required List<String> items}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                item,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}