import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class BottomNavScaffold extends StatelessWidget {
  final Widget child;

  const BottomNavScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // final location =
    //     GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    final location = GoRouterState.of(context).uri.toString();

    int index = _calculateIndex(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex) {
          switch (newIndex) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/submitentry');
              break;
            case 2:
              context.go('/communityarea');
              break;
            case 3:
              context.go('/ai');
              break;
          }
        },
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Report'),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper),
            label: 'Activity',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'iAbia AI'),
        ],
      ),
    );
  }

  int _calculateIndex(String location) {
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/submitentry')) return 1;
    if (location.startsWith('/communityarea')) return 2;
    if (location.startsWith('/ai')) return 3;
    return 0;
  }
}
