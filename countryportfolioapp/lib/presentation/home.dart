import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/repository.dart';
import '../theme/theme_options.dart';
import '../theme/theme_manager.dart';
import 'bloc/home_bloc.dart';
import 'countrydetails.dart';

final RepositoryServices repositoryServices = RepositoryServices();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

ThemeManager _themeManager = ThemeManager();

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;
  late int pageNumber = 1;
  // Timer? _debounce;
  @override
  void initState() {
    super.initState();
    context
        .read<HomeBloc>()
        .add(FetchCountryListEvent(pagecount: 10, page: pageNumber));
    _themeManager.addListener(themeListener);

    // monitor search bar trigger
    _searchController.addListener(() {
      searchPlaces(_searchController.text);
    });
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  // search starts here
  Future<void> searchPlaces(String query) async {
    if (query.isNotEmpty) {
      print('search triggered');
      context.read<HomeBloc>().add(SearchingEvent(
          message: 'Searching... Kindly enter full country name...'));
      context.read<HomeBloc>().add(SearchCountryEvent(searchQuery: query));
      // if (_debounce?.isActive ?? false) _debounce!.cancel();
      // _debounce = Timer(const Duration(milliseconds: 300), () {
      // });
    } else {
      context
          .read<HomeBloc>()
          .add(FetchCountryListEvent(pagecount: 10, page: 1));
    }
  }
  //

  // pagination
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        setState(() {
          if (pageNumber >= 2) {
            pageNumber -= 1;
          } else {
            setState(() {
              pageNumber = 1;
            });
            print('pageNumber is at one');
          }
        });
        context
            .read<HomeBloc>()
            .add(FetchCountryListEvent(pagecount: 10, page: pageNumber));
        // context.read<MemberareasBloc>().add(LoadDashboardViewEvent());
      } else if (_selectedIndex == 1) {
        print('1 clicked');
        // context.read<MemberareasBloc>().add(LoadSearchViewEvent());
      } else if (_selectedIndex == 2) {
        print('pageNumber');
        print(pageNumber);
        print('2 clicked');
        setState(() {
          pageNumber += 1;
        });
        context
            .read<HomeBloc>()
            .add(FetchCountryListEvent(pagecount: 10, page: pageNumber));
      }
    });
  }
  //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  AppBar(
                    title: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Explore'),
                        Text(
                          '.',
                          style: TextStyle(
                            fontSize: 80,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      Switch(
                        value: _themeManager.themeMode == ThemeMode.dark,
                        onChanged: (newValue) {
                          _themeManager.toggleTheme(newValue);
                        },
                      ),
                    ],
                  ),

                  // search bar section
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).focusColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: _searchController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Search Country',
                        hintStyle: Theme.of(context).textTheme.titleMedium,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),

                  // language and filter boxed
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // language select
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (BuildContext context) {
                                return FractionallySizedBox(
                                  heightFactor: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Language Selection',
                                          // style: ,
                                        ),
                                        const SizedBox(height: 16.0),
                                        const Text(
                                            'All Languages will display here'),
                                        const SizedBox(height: 16.0),
                                        SizedBox(
                                          height: 60,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.language),
                                SizedBox(width: 5),
                                Text('EN')
                              ],
                            ),
                          ),
                        ),
                        // filter box
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (BuildContext context) {
                                return FractionallySizedBox(
                                  heightFactor: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Filter Display',
                                          // style: ,
                                        ),
                                        const SizedBox(height: 16.0),
                                        const Text(
                                            'Filter options display here'),
                                        const SizedBox(height: 16.0),
                                        SizedBox(
                                          height: 60,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.filter_alt_outlined),
                                SizedBox(width: 5),
                                Text('Filter')
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          buildWhen: (previous, current) {
            return current is FetchCountyListState ||
                current is SearchResultState;
          },
          listenWhen: (previous, current) {
            return current is LoadingState ||
                current is LoadingErrorState ||
                current is SearchResultState;
          },
          listener: (context, state) {
            if (state is LoadingState) {
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(state.messsage!),
                    CircularProgressIndicator(
                      backgroundColor: Theme.of(context).focusColor,
                      color: Colors.black,
                    ),
                  ],
                ),
              );
            }
            if (state is LoadingErrorState) {
              Center(
                child: Column(
                  children: [
                    const Text('Error fetching country list'),
                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<HomeBloc>()
                            .add(FetchCountryListEvent(pagecount: 10, page: 1));
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }
          },
          builder: (context, state) {
            print('Current state: $state'); // Debugging line
            if (state is FetchCountyListState) {
              final countryProfile = state.countries;
              return SingleChildScrollView(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const PageScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: countryProfile?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final allCountries = countryProfile?[index];

                    return GestureDetector(
                      onTap: () {
                        // navigate to country detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewCountryDetails(
                              countryName: allCountries.countryName,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: NetworkImage(allCountries!.flag),
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(allCountries.countryName),
                          subtitle: Text(allCountries.countryFullName),
                          trailing: const Icon(Icons.arrow_outward_sharp),
                        ),
                      ),
                    );
                  },
                ),
              );
            }

            // search result display starts here
            else if (state is SearchResultState) {
              print('state is SearchResultState');
              final searchResult = state.searchResults;
              if (searchResult == null || searchResult.isEmpty) {
                return const Center(child: Text("No results found"));
              }
              return SingleChildScrollView(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const PageScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: searchResult.length,
                  itemBuilder: (BuildContext context, int index) {
                    final searchResultData = searchResult[index];

                    return GestureDetector(
                      onTap: () {
                        // navigate to country detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewCountryDetails(
                              countryName: searchResultData.countryName,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: NetworkImage(searchResultData.flag),
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(searchResultData.countryName),
                          subtitle: Text(searchResultData.countryFullName),
                          trailing: const Icon(Icons.arrow_outward_sharp),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            // search result display ends here

            else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).focusColor,
                  color: Colors.black,
                ),
              );
            }
          },
        ),
        bottomNavigationBar: Container(
          height: 60,
          margin: EdgeInsets.zero,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 2,
                color: Colors.grey,
              ),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back),
                label: 'Back',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.language),
                label: 'Page $pageNumber',
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.arrow_forward_rounded,
                ),
                label: 'Next',
              ),
            ],
            selectedItemColor: const Color.fromRGBO(255, 206, 49, 1),
            unselectedItemColor: Colors.grey[700],
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              fontFamily: 'montserrat',
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              fontFamily: 'montserrat',
            ),
          ),
        ),
      ),
    );
  }
}
