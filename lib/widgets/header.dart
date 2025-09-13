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
      _isMenuOpen = false; // Fermer le menu après sélection
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Pour les écrans larges (desktop)
          if (constraints.maxWidth > 1000) {
            return _buildDesktopHeader();
          }
          // Pour les écrans moyens (tablette)
          else if (constraints.maxWidth > 600) {
            return _buildTabletHeader();
          }
          // Pour les petits écrans (mobile)
          else {
            return _buildMobileHeader();
          }
        },
      ),
    );
  }

  Widget _buildDesktopHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'CollectPanel',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0066CC),
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < _menuItems.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextButton(
                  onPressed: () => _onItemTapped(i),
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
          ],
        ),
        Row(
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
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                print('Commencer cliqué');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0066CC),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
        ),
      ],
    );
  }

  Widget _buildTabletHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'CollectPanel',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0066CC),
          ),
        ),
        Row(
          children: [
            // Afficher seulement les 3 premiers éléments du menu
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextButton(
                  onPressed: () => _onItemTapped(i),
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
            // Menu déroulant pour les autres éléments
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_horiz, color: Colors.black87),
              onSelected: (value) {
                final index = _menuItems.indexOf(value);
                if (index != -1) {
                  _onItemTapped(index);
                }
              },
              itemBuilder: (BuildContext context) {
                return _menuItems.sublist(3).map((String item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList();
              },
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                print('Connexion cliquée');
              },
              icon: const Icon(Icons.person, color: Color(0xFF0066CC)),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                print('Commencer cliqué');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0066CC),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
        ),
      ],
    );
  }

  Widget _buildMobileHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'CollectPanel',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0066CC),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    print('Connexion cliquée');
                  },
                  icon: const Icon(Icons.person, color: Color(0xFF0066CC)),
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
        // Menu déroulant pour mobile
        if (_isMenuOpen)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                for (int i = 0; i < _menuItems.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextButton(
                      onPressed: () => _onItemTapped(i),
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
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    print('Commencer cliqué');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0066CC),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
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
            ),
          ),
      ],
    );
  }
}