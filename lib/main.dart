import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// 1. Refactored email validator (AI ne regex diya)
bool validateEmail(String email) {
  const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  final regex = RegExp(pattern);
  return email.isNotEmpty && regex.hasMatch(email);
}

// 2. Phone validator
bool validatePhoneNumber(String phone) {
  final digitsOnly = phone.replaceAll(RegExp(r'\D'), '');
  return digitsOnly.length == 10;
}

// 3. Reverse string
String reverseString(String input) {
  return input.split('').reversed.join('');
}

// 4. Capitalize first letter
String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}

// 5. Even number check
bool isEvenNumber(int number) {
  return number % 2 == 0;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Functions Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📧 Email "test@example.com" valid? ${validateEmail("test@example.com")}'),
            Text('📞 Phone "123-456-7890" valid? ${validatePhoneNumber("123-456-7890")}'),
            Text('🔄 Reverse "hello": ${reverseString("hello")}'),
            Text('🔠 Capitalize "flutter": ${capitalizeFirstLetter("flutter")}'),
            Text('🔢 Is 4 even? ${isEvenNumber(4)}'),
            const SizedBox(height: 20),
            const Text('✅ Sab functions sahi kaam kar rahe hain.', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}