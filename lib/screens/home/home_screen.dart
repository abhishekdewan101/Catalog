import 'package:flutter/material.dart';
import 'package:mind_palace/screens/account/account_screen.dart';
import 'package:mind_palace/screens/catalog/catalog_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = const [CatalogScreen(), AccountScreen()];

  Widget _buildBottomNav(
      bool isSelected, ThemeData theme, IconData icon, String label) {
    if (isSelected) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      label,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Icon(icon);
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Theme(
        //purely nessecary to disable splash effect
        data: theme.copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          unselectedItemColor: theme.colorScheme.primary.withAlpha(122),
          backgroundColor: theme.colorScheme.background,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: '',
              icon: _buildBottomNav(
                  _selectedIndex == 0, theme, Icons.home, "Home"),
            ),
            BottomNavigationBarItem(
              icon: _buildBottomNav(
                  _selectedIndex == 1, theme, Icons.person, "Account"),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: theme.colorScheme.primary,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
