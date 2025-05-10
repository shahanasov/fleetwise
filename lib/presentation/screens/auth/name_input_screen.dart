import 'package:fleetwise/services/authrepository.dart';
import 'package:fleetwise/presentation/screens/auth/document_upload_screen.dart';
import 'package:flutter/material.dart';

class NameInputPage extends StatefulWidget {
  const NameInputPage({super.key});

  @override
  State<NameInputPage> createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              // Main Content
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      const Text(
                        'What shall we call you?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A5C),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Subtitle
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          children: [
                            TextSpan(text: 'Enter full name as on your '),
                            TextSpan(
                              text: 'Aadhar Card',
                              style: TextStyle(color: Color(0xFF1E3A5C)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Profile Avatar
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB6E388),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Image.asset('asset/images/avatar.png'),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Name Label
              const Text(
                'Your Full Name*',
                style: TextStyle(fontSize: 14, color: Color(0xFF1E3A5C)),
              ),
              const SizedBox(height: 8),

              // Name Input Field
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  hintText: '',
                ),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),

              const Spacer(),

              // Submit Button
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      final name = nameController.text.trim();

                      if (name.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter your name'),
                          ),
                        );
                        return;
                      }
Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DocumentUploadPage(),
                              ),
                            );
                      // AuthRepository()
                      //     .updateUserName(name)
                      //     .then((_) {
                            
                      //     })
                      //     .catchError((e) {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(
                      //           content: Text('Failed to update name: $e'),
                      //         ),
                      //       );
                      //     });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDAE6F1),
                      foregroundColor: const Color(0xFF486A8F),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
