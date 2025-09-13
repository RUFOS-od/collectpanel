import 'package:flutter/material.dart';
import 'package:collect_panel/widgets/header.dart';
import 'package:collect_panel/widgets/hero_section.dart';
import 'package:collect_panel/widgets/why_panels_matter_section.dart'; // Ajoutez cette ligne
import 'package:collect_panel/widgets/how_it_works.dart';
import 'package:collect_panel/widgets/panels_section.dart';
import 'package:collect_panel/widgets/benefits_section.dart';
import 'package:collect_panel/widgets/contact_section.dart';
import 'package:collect_panel/widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Header(),
            HeroSection(),
            WhyPanelsMatterSection(), // Ajoutez cette ligne avant HowItWorksSection
            HowItWorksSection(),
            PanelsSection(),
            BenefitsSection(),
            ContactSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}