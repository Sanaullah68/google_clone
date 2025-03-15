import 'package:flutter/material.dart';
import 'package:google_clone/widgets/search_header.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header
            SearchHeader(),
            //tabs for maps images etc
            //search components
            //pagination
          ],
        ),
      ),
    );
  }
}
