// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hngencryptapp/presentation/viewallencrypt.dart';

import '../service/encryptalgo.dart';
import 'navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool _checkFormStatus = false;
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _keyController = TextEditingController();

  Future<String?> _textEncryptionFxn() async {
    if (_textController.text.isNotEmpty && _keyController.text.isNotEmpty) {
      _checkFormStatus = true;
      await EncryptTextAlgo.saveEncryptedData(
        _keyController.text,
        _textController.text,
      );
      _textController.clear();
      _keyController.clear();
    } else if (_textController.text.isEmpty || _keyController.text.isEmpty) {
      _checkFormStatus = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Boss do the calms!, You've not filled the form properly.",
          ),
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app navigation bar
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppNavBar()),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Kindly fill the form below to encrypt data:',
              ),
              const SizedBox(
                height: 30,
              ),

              // Form for encrypt string and encryption key below
              Form(
                child: Column(
                  children: [
                    TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        labelText: 'Enter text to encrypt',
                        // errorText:
                        //     'Kindly fill this field to continue encrypting...',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: _keyController,
                      decoration: const InputDecoration(
                        labelText: 'Enter encryption key',
                        helperText:
                            'If you enter a key less than 32, the system makes it up with 0s',
                        // errorText:
                        //     'Kindly fill this field to continue encrypting...',
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        onPressed: () {
                          _textEncryptionFxn();
                          if (_checkFormStatus) {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (BuildContext context) {
                                return SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'Text Encryption Successfull!',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 30,
                                          ),

                                          // View history button

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
                                                'View Encryption History',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: const Text(
                          'Encrypt',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
