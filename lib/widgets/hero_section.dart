import 'package:flutter/material.dart';
import 'package:collect_panel/widgets/video_player_widget.dart';

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
            // Version mobile
            return Column(
              children: [
                _buildContentSection(),
                const SizedBox(height: 30),
                _buildVideoSection(),
              ],
            );
          } else {
            // Version desktop
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: _buildContentSection(),
                ),
                const SizedBox(width: 30),
                Expanded(
                  flex: 7,
                  child: _buildVideoSection(),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildContentSection() {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Notre panel de consommateurs - Obtenir rapidement de vraies réponses de la part de vraies personnes',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              height: 1.01,
            ),
          ),
          const SizedBox(height: 43),
          const Text(
            "Notre solution révolutionne la collecte de données en Afrique."
            "Nous sommes une entreprise innovante spécialisée dans la collecte intelligente de données marketing en Afrique."
            "Notre mission est de réinventer la manière dont les marques, institutions et ONG accèdent aux insights consommateurs, en combinant la technologie mobile, l’intelligence artificielle et le pouvoir des panels rémunérés."
            "Nous croyons que chaque donnée est une source d’intelligence stratégique et que chaque répondant mérite d’être valorisé et récompensé pour sa contribution.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 30),
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

  Widget _buildVideoSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: const VideoPlayerWidget(
        videoPath: 'assets/videos/DataQualityCampaign_V04_compressed.mp4', // MODIFIEZ ICI
      ),
    );
  }
}