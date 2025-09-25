import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Comment ça marche',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF003366),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Container(
            width: 70,
            height: 4,
            color: const Color(0xFF0066CC),
          ),
          const SizedBox(height: 60),

          // Layout responsive
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth >= 1000) {
                crossAxisCount = 3; // Desktop
              } else if (constraints.maxWidth >= 600) {
                crossAxisCount = 2; // Tablette
              }

              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 24,
                mainAxisSpacing: 30,
                childAspectRatio: 0.85,
                children: [
                  _buildStep(
                    number: 1,
                    title: 'Inscription',
                    description:
                        'Rejoignez notre panel et devenez acteur du changement.',
                    svgPath: 'assets/icons/signup.svg',
                  ),
                  _buildStep(
                    number: 2,
                    title: 'Questionnaires',
                    description:
                        'Partagez vos avis, influencez les marques et inspirez l’avenir.',
                    svgPath: 'assets/icons/survey.svg',
                  ),
                  _buildStep(
                    number: 3,
                    title: 'Récompenses',
                    description:
                        'Transformez vos réponses en cadeaux exclusifs et avantages uniques.',
                    svgPath: 'assets/icons/rewards.svg',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required int number,
    required String title,
    required String description,
    required String svgPath,
  }) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 260, // 🔥 largeur plus fine
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 6,
          shadowColor: Colors.grey.withOpacity(0.25),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0066CC).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SvgPicture.asset(
                    svgPath,
                    fit: BoxFit.contain,
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
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
