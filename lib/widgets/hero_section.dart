import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 1000) {
            // Version mobile : contenu au-dessus, image en dessous
            return Column(
              children: [
                _buildContentSection(),
                const SizedBox(height: 40),
                _buildImageSection(),
              ],
            );
          } else {
            // Version desktop : contenu à gauche, image à droite
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: _buildContentSection(),
                ),
                const SizedBox(width: 40),
                Expanded(
                  flex: 6,
                  child: _buildImageSection(),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  /// --- Texte principal (gauche) ---
  Widget _buildContentSection() {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Obtenez des réponses réelles,\nde vraies personnes',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Chez CollectPanel, nous connectons les marques aux consommateurs authentiques. '
            'Des données fiables pour guider vos décisions et assurer le succès de vos projets.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0066CC),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
              'En savoir plus',
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

  /// --- Illustration SVG (droite) ---
  Widget _buildImageSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SvgPicture.asset(
        'assets/images/onlineP.svg', // 🔥 chemin de ton SVG
        fit: BoxFit.contain,
        height: 400,
      ),
    );
  }
}
