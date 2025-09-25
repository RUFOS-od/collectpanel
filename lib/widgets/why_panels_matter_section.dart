import 'package:flutter/material.dart';

class WhyPanelsMatterSection extends StatelessWidget {
  const WhyPanelsMatterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Espace de 50px comme dans le code HTML
        Container(
          color: Colors.white,
          height: 50,
        ),
        // Section principale
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          color: const Color(0xFF003366), // Vert foncé similaire au design
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 800) {
                // Version mobile
                return Column(
                  children: [
                    _buildImageSection(),
                    const SizedBox(height: 40),
                    _buildContentSection(),
                  ],
                );
              } else {
                // Version desktop
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildImageSection(),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      child: _buildContentSection(),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/images/VEC SAV 359-04.jpg',
          fit: BoxFit.cover,
          height: 400,
          // Placeholder en cas d'erreur de chargement
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 400,
              color: const Color(0xFF0066CC).withOpacity(0.1),
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 60,
                  color: Color(0xFF0066CC),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pourquoi les panels sont importants',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 34),
        const Text(
          'Notre panel est un vaste réseau de personnes à travers l\'Afrique, l\'Asie et l\'Amérique qui ont accepté de répondre aux enquêtes de nos clients et d\'exprimer leur opinion sur tous les sujets, de la politique à l\'emballage des pizzas. Pour chaque étude spécifique, nous sélectionnons soigneusement les répondants de notre réseau qui correspondent au groupe cible souhaité. Lorsque le panel reflète véritablement votre groupe cible, vous pouvez avoir confiance dans les résultats et dans le bien-fondé de vos décisions. C\'est pourquoi, lorsqu\'il s\'agit de collecter des données, il est essentiel de bien choisir le panel.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 30),
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
            'Découvrir notre approche',
            style: TextStyle(
              color: Color(0xFF003366),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}