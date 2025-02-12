import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

class ViewCountryDetails extends StatefulWidget {
  final String countryName;
  const ViewCountryDetails({
    super.key,
    required this.countryName,
  });

  @override
  State<ViewCountryDetails> createState() => _ViewCountryDetailsState();
}

class _ViewCountryDetailsState extends State<ViewCountryDetails> {
  @override
  void initState() {
    super.initState();
    context
        .read<HomeBloc>()
        .add(FetchCountryDetailsEvent(countryName: widget.countryName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.countryName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),

      // body
      body: BlocConsumer<HomeBloc, HomeState>(
        buildWhen: (previous, current) {
          return current is FetchCountryDetailsState;
        },
        listenWhen: (previous, current) {
          return current is LoadingState || current is LoadingErrorState;
        },
        listener: (context, state) {
          if (state is LoadingState) {
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading details for ${widget.countryName}...'),
                  const SizedBox(height: 10.0),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Error fetching country list'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(FetchCountryDetailsEvent(
                          countryName: widget.countryName));
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is FetchCountryDetailsState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: NetworkImage(state.countryDetails!.flag),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 220,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1000),
                    viewportFraction: 1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // Textual country details starts here
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).focusColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                countryDataBox(state, 'Country Name:',
                                    state.countryDetails?.countryName),
                                const SizedBox(height: 10.0),
                                countryDataBox(state, 'Capital:',
                                    state.countryDetails?.capital),
                                const SizedBox(height: 10.0),
                                countryDataBox(
                                    state,
                                    'Population:',
                                    state.countryDetails?.population
                                        .toString()),
                                const SizedBox(height: 10.0),
                                countryDataBox(state, 'Continent:',
                                    state.countryDetails?.motto),
                              ],
                            ),
                          ),

                          //
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).focusColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 10.0),
                                countryDataBox(state, 'Official Language:',
                                    state.countryDetails?.officialLang),
                                const SizedBox(height: 10.0),
                                countryDataBox(state, 'Area Size:',
                                    '${state.countryDetails?.areaSize.toString()}'),
                                const SizedBox(height: 10.0),
                                countryDataBox(state, 'Religion:',
                                    state.countryDetails?.religion),
                                const SizedBox(height: 10.0),
                                countryDataBox(state, 'Language:',
                                    state.countryDetails?.officialLang),
                              ],
                            ),
                          ),

                          //
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).focusColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 10.0),
                                countryDataBox(state, 'Government:',
                                    state.countryDetails?.government),
                                const SizedBox(height: 10.0),
                                countryDataBox(state, 'Independence:',
                                    state.countryDetails?.independenceData),
                                const SizedBox(height: 10.0),
                                countryDataBox(state, 'Currency:',
                                    state.countryDetails?.currency),
                                const SizedBox(height: 10.0),
                                countryDataBox(
                                    state, 'GDP:', state.countryDetails?.gdp),
                              ],
                            ),
                          ),

                          //
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).focusColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 10.0),
                                countryDataBox(state, 'Time zone:',
                                    state.countryDetails?.timeZone),
                                const SizedBox(height: 10.0),
                                countryDataBox(state, 'Date Format:',
                                    state.countryDetails?.dateFormat),
                                const SizedBox(height: 10.0),
                                countryDataBox(state, 'Dialing code:',
                                    state.countryDetails?.dailCode),
                                const SizedBox(height: 10.0),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Loading details for ${widget.countryName}...'),
                  const SizedBox(height: 10.0),
                  CircularProgressIndicator(
                    backgroundColor: Theme.of(context).focusColor,
                    color: Colors.black,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Row countryDataBox(FetchCountryDetailsState state, title, subtitle) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          flex: 8,
          child: Text(
            subtitle,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}
