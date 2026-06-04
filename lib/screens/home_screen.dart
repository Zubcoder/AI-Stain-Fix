import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'camera_screen.dart';
import 'chat_screen.dart';
import 'history_screen.dart';
import 'settings_screen.dart';
import '../services/analytics_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _screens = const [
    CameraScreen(),
    ChatScreen(),
    HistoryScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: theme.dividerColor, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) {
            const tabNames = ['camera', 'chat', 'history', 'settings'];
            AnalyticsService.tabChanged(tabNames[i]);
            setState(() => _currentIndex = i);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.camera_alt_outlined),
              activeIcon: const Icon(Icons.camera_alt),
              label: l10n.camera,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat_outlined),
              activeIcon: const Icon(Icons.chat_rounded),
              label: l10n.chatTab,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.history_outlined),
              activeIcon: const Icon(Icons.history),
              label: l10n.history,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings_outlined),
              activeIcon: const Icon(Icons.settings),
              label: l10n.settings,
            ),
          ],
        ),
      ),
    );
  }
}
