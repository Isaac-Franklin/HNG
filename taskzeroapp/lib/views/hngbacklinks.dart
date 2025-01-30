import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hngbacklinksview.dart';

class HNGBacklinksView extends StatefulWidget {
  const HNGBacklinksView({super.key});

  @override
  State<HNGBacklinksView> createState() => _HNGBacklinksViewState();
}

class _HNGBacklinksViewState extends State<HNGBacklinksView> {
  Future<void> _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      print('link clicked');
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('HNG Backlinks'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text('A few HNG backlinks will be listed here:'),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(child: Text('Hire a React developer')),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HNGBacklinksViewRepo(
                                linkUrl:
                                    'https://hng.tech/hire/react-native-developers',
                              );
                            },
                          ),
                        );
                      },
                      child: const Text('Click Here'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(child: Text('Hire a Kotlin developer')),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HNGBacklinksViewRepo(
                                linkUrl:
                                    'https://hng.tech/hire/Kotlin-native-developers',
                              );
                            },
                          ),
                        );
                      },
                      child: const Text('Click Here'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(child: Text('Hire a Mobile UI/UX developer')),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HNGBacklinksViewRepo(
                                linkUrl:
                                    'https://hng.tech/hire/mobile-ui-ux-developers',
                              );
                            },
                          ),
                        );
                      },
                      child: const Text('Click Here'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(child: Text('Hire an iOS developer')),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HNGBacklinksViewRepo(
                                linkUrl: 'https://hng.tech/hire/ios-developers',
                              );
                            },
                          ),
                        );
                      },
                      child: const Text('Click Here'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
