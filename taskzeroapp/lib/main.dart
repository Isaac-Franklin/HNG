import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'views/githubpage.dart';
import 'views/hngbacklinks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'HNG Task Zero'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Uri _gitHubURL = Uri.parse('https://github.com/Isaac-Franklin/HNG');

  Future<void> _launchURL() async {
    if (await canLaunchUrl(_gitHubURL)) {
      print('link clicked');
      await launchUrl(_gitHubURL, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $_gitHubURL";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hi, Mentor!',
              style: TextStyle(fontSize: 32.0),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Please find links to GitHub repo and HNG backlinks below!',
              style: TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ViewRepo();
                    },
                  ),
                );
              },
              child: const Text('View GitHub Repo'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HNGBacklinksView();
                    },
                  ),
                );
              },
              child: const Text('View HNG Backlinks'),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
