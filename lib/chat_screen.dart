import 'package:cx_payment_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [
    "Welcome to Support! How can we help you?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Uses main container gradient
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Chat with Admin",
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _showReportPaymentDialog,
            icon: const Icon(Icons.receipt_long, color: AppTheme.kLimeGreen),
            tooltip: "Inform about Payment",
          )
        ],
      ),
      body: Column(
        children: [
          // Info banner for the new feature
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.kLimeGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.kLimeGreen.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline,
                    size: 20, color: AppTheme.kLimeGreen),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Paid via UTR? Tap the receipt icon above to notify admin.",
                    style: GoogleFonts.manrope(
                        color: Colors.white70, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                // Determine if it's user or admin (for demo, alternating or just simple)
                // For this mock, first message is Admin, subsequent are User
                final isUser = index > 0;
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isUser
                          ? AppTheme.kLimeGreen
                          : const Color(0xFF2C2C35),
                      borderRadius: BorderRadius.circular(20).copyWith(
                        bottomRight:
                            isUser ? Radius.zero : const Radius.circular(20),
                        topLeft:
                            !isUser ? Radius.zero : const Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      _messages[index],
                      style: GoogleFonts.manrope(
                        color: isUser ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          16, 10, 16, 30), // Extra bottom padding for overlap
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E22),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: _messageController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Type a message...",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: _sendMessage,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: AppTheme.kLimeGreen,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.send, color: Colors.black, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      _messages.add(_messageController.text.trim());
      _messageController.clear();
    });
  }

  void _showReportPaymentDialog() {
    final TextEditingController utrController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFF1E1E22),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Verify Payment",
                style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Enter the UTR ID to inform admin.",
                style: GoogleFonts.manrope(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey[800]!),
                ),
                child: TextField(
                  controller: utrController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter UTR ID",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (utrController.text.isNotEmpty) {
                      // Perform action (e.g., send via API or add to chat)
                      setState(() {
                        _messages.add(
                            "Submitted Payment Confirmation. UTR: ${utrController.text}");
                      });
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.kLimeGreen,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: GoogleFonts.manrope(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
