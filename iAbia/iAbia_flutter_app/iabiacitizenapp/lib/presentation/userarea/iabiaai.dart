import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:iabiacitizenapp/core/utils/device_utils.dart';
import 'package:iabiacitizenapp/presentation/bloc/app_state_bloc.dart';
import 'package:iabiacitizenapp/presentation/shared/custom_app_bar.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AI extends StatefulWidget {
  const AI({super.key});

  @override
  State<AI> createState() => _AIState();
}

class _AIState extends State<AI> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, String>> messages = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    context.read<AppStateBloc>().add(
      ChatAvailabilityStatusEvent(isChatAvailable: false),
    );
    loadMessages();
  }

  Future<void> loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString('chat_messages');
    if (stored != null) {
      final decoded = json.decode(stored);
      setState(() {
        messages =
            decoded
                .map<Map<String, String>>((e) => Map<String, String>.from(e))
                .toList();
      });
      context.read<AppStateBloc>().add(
        ChatAvailabilityStatusEvent(isChatAvailable: true),
      );
    }
  }

  Future<void> saveMessages() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('chat_messages', json.encode(messages));
  }

  Future<void> handleSend() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({'text': text, 'sender': 'user'});
      _controller.clear();
    });

    saveMessages();
    await Future.delayed(Duration(milliseconds: 300));
    scrollToBottom();
    await getAIResponse(text);
    context.read<AppStateBloc>().add(
      ChatAvailabilityStatusEvent(isChatAvailable: true),
    );
  }

  Future<void> getAIResponse(String prompt) async {
    setState(() => isLoading = true);

    try {
      final response = await http.post(
        Uri.parse("http://localhost:5000/api"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(prompt),
      );

      final data = json.decode(response.body);
      print('data');
      print(data);
      if (data["status"] == 200) {
        setState(() {
          messages.add({
            'text': data["reply"] ?? "I didn't understand that.",
            'sender': 'assistant',
          });
        });
        saveMessages();
        scrollToBottom();
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> clearChat() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('chat_messages');
    setState(() => messages.clear());
    ChatAvailabilityStatusEvent(isChatAvailable: false);
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent + 100,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Widget buildMessage(Map<String, String> msg) {
    final isUser = msg['sender'] == 'user';
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          color: isUser ? AppColors.primary : AppColors.darkBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: MarkdownBody(
          data: msg['text'] ?? '',
          styleSheet: MarkdownStyleSheet(
            p: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }

  // ChatIsAvailableStatusState
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      showBackButton: false,
      centerTitle: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<AppStateBloc, AppStateState>(
            buildWhen:
                (previous, current) =>
                    current is ChatIsAvailableStatusState ||
                    current is ChatIsNotAvailableStatusState,
            builder: (context, state) {
              if (state is ChatIsAvailableStatusState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      width: 150,
                      image: AssetImage('assets/images/iabialogo.png'),
                    ),
                    Text(
                      'No conversations yet...',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Send a message to start conversation',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                );
              } else if (state is ChatIsNotAvailableStatusState) {
                return Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(12),
                    itemCount: messages.length + (isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < messages.length) {
                        return buildMessage(messages[index]);
                      } else {
                        return const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Fetching response..",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              } else {
                return Center(child: Text('data2'));
              }
            },
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.background)),
              color: AppColors.primary,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: AppColors.primary),
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      hintStyle: const TextStyle(color: AppColors.primary),
                      filled: true,
                      fillColor: AppColors.background,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    onSubmitted: (_) => handleSend(),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: AppColors.primary),
                    onPressed: handleSend,
                  ),
                ),
                SizedBox(width: AppSizes.spacingS),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    color: AppColors.primary,
                    onPressed: clearChat,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      title: Row(
        children: [
          Image(
            width: 150,
            image: AssetImage('assets/images/iabialogonobg.png'),
          ),
          // Text('Chat with iAbia AI'),
        ],
      ),
    );
  }
}
