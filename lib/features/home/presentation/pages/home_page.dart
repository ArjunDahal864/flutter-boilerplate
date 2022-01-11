import 'package:auto_route/auto_route.dart';
import 'package:boiler/core/utils/router.dart';
import 'package:boiler/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        title: const Text("Boiler Project"),

        leading: const AutoBackButton(),
        centerTitle: true,

      ),
      routes: const [
        DashboardPageRouter(),
        ProfilePageRouter(),
        SettingsPageRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.dashboard),
              title:  Text(S.of(context).dashboard),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: Text(S.of(context).profile),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.settings),
              title: Text(S.of(context).setting),
            ),
          ],
        );
      },
    );
  }
}
