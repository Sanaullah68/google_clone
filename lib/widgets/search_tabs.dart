import 'package:flutter/material.dart';
import 'package:google_clone/widgets/search_tab.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SearchTab(
            isActive: true,
            text: 'ALL',
            icon: Icons.search,
          ),
          const SizedBox(
            width: 20,
          ),
          SearchTab(
            text: 'Images',
            icon: Icons.image,
          ),
          const SizedBox(
            width: 20,
          ),
          SearchTab(
            text: 'Map',
            icon: Icons.map,
          ),
          const SizedBox(
            width: 20,
          ),
          SearchTab(
            text: 'News',
            icon: Icons.article,
          ),
          const SizedBox(
            width: 20,
          ),
          SearchTab(
            text: 'Shopping',
            icon: Icons.shop,
          ),
          const SizedBox(
            width: 20,
          ),
          SearchTab(
            text: 'More',
            icon: Icons.more_vert,
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
