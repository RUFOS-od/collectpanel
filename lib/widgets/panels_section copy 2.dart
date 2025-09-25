import 'package:flutter/material.dart';

class PanelsSection extends StatelessWidget {
  const PanelsSection({super.key});

  final List<Map<String, String>> panels = const [
    {
      'title': 'Panels en ligne',
      'description': 'Touchez vos clients où qu’ils soient grâce à nos panels en ligne rapides et fiables.',
      'image': 'assets/images/brand_creation_15.jpg',
    },
    {
      'title': 'Panels téléphoniques',
      'description': 'Gardez la proximité avec vos consommateurs grâce à nos enquêtes téléphoniques personnalisées.',
      'image': 'assets/images/11602351.jpg',
    },
    {
      'title': 'Panels face-à-face',
      'description': 'Vivez l’authenticité du terrain avec nos panels en face-à-face, pour des insights plus profonds.',
      'image': 'assets/images/fingerprint-login-smartphone-urban-setting.jpg',
    },
    {
      'title': 'Panels spécialisés',
      'description': 'Accédez à des panels ciblés et qualifiés pour des résultats précis et exploitables.',
      'image': 'assets/images/cacfccf8-132c-48f8-a6ac-196a32cb762a.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Nos Types de Panels',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0066CC),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: panels.map((panel) {
              return SizedBox(
                width: 280,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          panel['image']!,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          panel['title']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0066CC),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          panel['description']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
