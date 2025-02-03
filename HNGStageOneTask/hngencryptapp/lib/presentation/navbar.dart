import 'package:flutter/material.dart';

import 'viewallencrypt.dart';

class AppNavBar extends StatelessWidget {
  final String navText;
  final bool showButton;
  const AppNavBar({
    super.key,
    this.navText = 'HNG Data Encrypt App',
    this.showButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      actions: [
        if (showButton)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ViewEncryptionHistory();
                  },
                ),
              );
            },
            child: const Text(
              'View History',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        const SizedBox(
          width: 5,
        )
      ],
      title: Text(
        navText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
