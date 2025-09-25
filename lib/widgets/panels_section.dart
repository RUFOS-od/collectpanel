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
      width: double.infinity, // pleine largeur
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20), // plus long et large
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Nos Types de Panels',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0066CC),
            ),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth > 1200) {
                crossAxisCount = 4; // grand écran (desktop large)
              } else if (constraints.maxWidth > 800) {
                crossAxisCount = 3; // desktop normal
              } else if (constraints.maxWidth > 600) {
                crossAxisCount = 2; // tablette
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemCount: panels.length,
                itemBuilder: (context, index) {
                  final panel = panels[index];
                  return Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              panel['image']!,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            panel['title']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0066CC),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            panel['description']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
