import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  int _selectedIndex = 0;
  bool _isMenuOpen = false;

  final List<String> _menuItems = [
    'Solutions',
    'Comment ça fonctionne',
    'Où nous sommes',
    'Ressources',
    'Entreprise',
    'Contact',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isMenuOpen = false; // Fermer le menu après sélection sur mobile
    });
    print('Navigation vers: ${_menuItems[index]}');
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Barre principale
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              const Text(
                'CollectPanel',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0066CC),
                ),
              ),

              // Menu desktop (visible seulement sur grands écrans)
              if (MediaQuery.of(context).size.width > 1000)
                _buildDesktopMenu(),

              // Boutons de connexion (visibles sur desktop et tablette)
              if (MediaQuery.of(context).size.width > 600) _buildAuthButtons(),

              // Menu hamburger (visible seulement sur mobile et tablette)
              if (MediaQuery.of(context).size.width <= 1000)
                Row(
                  children: [
                    if (MediaQuery.of(context).size.width > 600)
                      TextButton(
                        onPressed: () {
                          print('Connexion cliquée');
                        },
                        child: const Text(
                          'Connexion',
                          style: TextStyle(
                            color: Color(0xFF0066CC),
                          ),
                        ),
                      ),
                    IconButton(
                      onPressed: _toggleMenu,
                      icon: Icon(
                        _isMenuOpen ? Icons.close : Icons.menu,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
            ],
          ),

          // Menu déroulant pour mobile/tablette
          if (_isMenuOpen && MediaQuery.of(context).size.width <= 1000)
            _buildMobileMenu(),
        ],
      ),
    );
  }

  Widget _buildDesktopMenu() {
    return Expanded(
      child: Center(
        child: Wrap(
          spacing: 8,
          children: List.generate(_menuItems.length, (index) {
            return TextButton(
              onPressed: () => _onItemTapped(index),
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              child: Text(
                _menuItems[index],
                style: TextStyle(
                  color: _selectedIndex == index
                      ? const Color(0xFF0066CC)
                      : Colors.black87,
                  fontWeight: _selectedIndex == index
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildAuthButtons() {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            print('Connexion cliquée');
          },
          child: const Text(
            'Connexion',
            style: TextStyle(
              color: Color(0xFF0066CC),
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: () {
            print('Commencer cliqué');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0066CC),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Text(
            'Commencer',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileMenu() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
      ),
      child: Column(
        children: [
          // Éléments du menu
          for (int i = 0; i < _menuItems.length; i++)
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () => _onItemTapped(i),
                style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: Text(
                  _menuItems[i],
                  style: TextStyle(
                    color: _selectedIndex == i
                        ? const Color(0xFF0066CC)
                        : Colors.black87,
                    fontWeight: _selectedIndex == i
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),

          // Bouton Commencer (seulement sur mobile)
          if (MediaQuery.of(context).size.width <= 600)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  print('Commencer cliqué');
                  _toggleMenu();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0066CC),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  'Commencer',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
