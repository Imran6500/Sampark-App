import 'package:flutter/material.dart';

myTabBar(TabController tabController, BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: TabBar(
        controller: tabController,
        indicatorWeight: 4,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        dividerColor: Theme.of(context).colorScheme.primaryContainer,
        tabs: const [
          Tab(text: "Chats"),
          Tab(text: "Groups"),
          Tab(text: "Calls"),
        ]),
  );
}
