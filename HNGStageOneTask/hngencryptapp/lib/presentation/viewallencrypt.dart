import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hngencryptapp/presentation/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/decryptalgo.dart';

class ViewEncryptionHistory extends StatefulWidget {
  const ViewEncryptionHistory({super.key});

  @override
  State<ViewEncryptionHistory> createState() => _ViewEncryptionHistoryState();
}

class _ViewEncryptionHistoryState extends State<ViewEncryptionHistory> {
  late String encryptionKey;
  late String decryptedText;
  // fetch all save encryptions
  Future<Map<String, dynamic>> getAllSharedPreferencesData() async {
    final prefs = await SharedPreferences.getInstance();
    final Set<String> keys = prefs.getKeys(); // Get all stored keys

    Map<String, dynamic> data = {};

    for (String key in keys) {
      dynamic storedValue =
          prefs.get(key); // Get value (handles all data types)

      if (storedValue is String && storedValue.contains('_')) {
        List<String> parts = storedValue.split('_');

        if (parts.length >= 2) {
          data[key] = parts[1]; // Store the encrypted text only
        } else {
          data[key] = 'Invalid format'; // Handle cases where split() fails
        }
      } else {
        data[key] =
            storedValue; // Store original value if it's not an encrypted string
      }
    }

    return data;
  }

  // clear all saved encryptions history

  Future<void> clearAllSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print("All SharedPreferences data cleared!");
  }

  // Copy text to clipboard
  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("'$text' copied")),
    );
  }

  Future<void> _decryptData(textController, decryptionKeyController) async {
    String userKey = decryptionKeyController;
    String encryptedText = textController;

    if (userKey.isEmpty) {
      print("Please enter both the secret key.");
    }

    String? result = await DecryptData.decryptAES(encryptedText, userKey);
    _showDecryptionDialog(context, result);
  }

  @override
  void initState() {
    getAllSharedPreferencesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppNavBar(
          navText: 'Encrypted Data History',
          showButton: false,
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getAllSharedPreferencesData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data found."));
          }

          return ListView(
            children: snapshot.data!.entries.map(
              (entry) {
                return ListTile(
                  title: Text(entry.value.toString()),
                  onTap: () {
                    copyToClipboard(entry.value.toString());
                  },
                  subtitle: const Text(
                    'Click to copy to clipboard',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    onPressed: () {
                      // decrypt data form bottom sheet here
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: double.infinity,
                            height: 300,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Enter key to decrypt data!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Encryption: ${entry.value.toString()}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 30,
                                    ),

                                    // form starts here
                                    Form(
                                      child: Column(
                                        children: [
                                          TextField(
                                            // controller: _decryptionKeyController,
                                            onChanged: (value) {
                                              encryptionKey = value;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'Enter decryption key',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                backgroundColor: Colors.blue,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                ),
                                              ),
                                              onPressed: () {
                                                _decryptData(
                                                    entry.value.toString(),
                                                    encryptionKey);
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'Process Decryption',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Decrypt',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          clearAllSharedPreferences();
          Navigator.pop(context);
        },
        child: const Text(
          textAlign: TextAlign.center,
          'Clear History',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
          ),
        ),
      ),
    );
  }

  void _showDecryptionDialog(BuildContext context, String decryptedText) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text("Decryption Result"),
          content: SelectableText(
            decryptedText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: decryptedText));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Copied to clipboard!")),
                );
              },
              child: const Text("Copy"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
