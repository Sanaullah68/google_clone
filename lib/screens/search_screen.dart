import 'package:flutter/material.dart';
import 'package:google_clone/colors.dart';
import 'package:google_clone/widgets/search_footer.dart';
import 'package:google_clone/widgets/search_header.dart';
import 'package:google_clone/widgets/search_result_component.dart';
import 'package:google_clone/widgets/search_tabs.dart';
import 'package:google_clone/services/api_service.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen(
      {super.key, required this.searchQuery, required this.start});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header
              const SearchHeader(),
              //tabs for maps images etc
              Padding(
                padding: EdgeInsets.only(left: size.width <= 760 ? 0 : 150.0),
                child: const SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: SearchTabs()),
              ),
              const Divider(
                height: 0,
                thickness: 0.3,
              ),
              //search components
              FutureBuilder(
                future: ApiService().fetchData(
                  queryTerm: searchQuery,
                  start: start,
                ),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: size.width <= 760 ? 10 : 150.0, top: 12),
                          child: Text(
                            'About ${snapshot.data?['searchInformation']['formattedTotalResults']} results ${snapshot.data?['searchInformation']['formattedSearchTime']} seconds',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(
                                0xff70757a,
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: size.width <= 768 ? 10 : 150.0,
                                top: 10,
                              ),
                              child: SearchResultComponent(
                                  link: snapshot.data?['items'][index]
                                      ['formattedUrl'],
                                  desc: snapshot.data?['items'][index]
                                      ['snippet'],
                                  text: snapshot.data?['items'][index]['title'],
                                  linkToGo: snapshot.data?['items'][index]
                                      ['link']),
                            );
                          },
                          itemCount: snapshot.data['items'].length,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                        start:
                                            (int.parse(start) - 10).toString(),
                                        searchQuery: searchQuery,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "< Prev",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: blueColor,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                        searchQuery: searchQuery,
                                        start:
                                            (int.parse(start) + 10).toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Next >",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SearchFooter(),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              //pagination
            ],
          ),
        ),
      ),
    );
  }
}
