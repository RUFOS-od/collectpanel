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
            'Notre panel de consommateurs - Obtenir de vraies réponses de la part de vraies personnes',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              height: 1.01,
            ),
          ),
          const SizedBox(height: 43),
          const Text(
            'Chez CollectPanel, vous obtenez des données réelles collectées auprès de personnes réelles - un point de départ naturel pour toute étude de marché précise. Pour que votre prochaine décision soit la bonne.',
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
        videoPath: 'assets/videos/5948814_Gen_Z_Generation_Z_3840x2160.mp4', // MODIFIEZ ICI
      ),
    );
  }
}