import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// ==================== 5 FUNCTIONS ====================
bool validateEmail(String email) {
  const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  return email.isNotEmpty && RegExp(pattern).hasMatch(email);
}

bool validatePhoneNumber(String phone) {
  final digitsOnly = phone.replaceAll(RegExp(r'\D'), '');
  return digitsOnly.length == 10;
}

String reverseString(String input) => input.split('').reversed.join('');

String capitalizeFirstLetter(String input) =>
    input.isEmpty ? input : input[0].toUpperCase() + input.substring(1);

bool isEvenNumber(int number) => number % 2 == 0;
// ==================== END ====================

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Utility Suite',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const InteractiveDemoPage(),
    );
  }
}

class InteractiveDemoPage extends StatefulWidget {
  const InteractiveDemoPage({super.key});
  @override
  State<InteractiveDemoPage> createState() => _InteractiveDemoPageState();
}

class _InteractiveDemoPageState extends State<InteractiveDemoPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController stringController = TextEditingController();
  final TextEditingController capitalizeController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  String emailResult = '';
  String phoneResult = '';
  String reverseResult = '';
  String capitalizeResult = '';
  String evenResult = '';

  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() => emailResult = validateEmail(emailController.text).toString()));
    phoneController.addListener(() => setState(() => phoneResult = validatePhoneNumber(phoneController.text).toString()));
    stringController.addListener(() => setState(() => reverseResult = reverseString(stringController.text)));
    capitalizeController.addListener(() => setState(() => capitalizeResult = capitalizeFirstLetter(capitalizeController.text)));
    numberController.addListener(() => setState(() {
      int? num = int.tryParse(numberController.text);
      evenResult = num != null ? (isEvenNumber(num) ? 'Even' : 'Odd') : 'Enter number';
    }));
    // Initial values
    emailController.text = 'test@example.com';
    phoneController.text = '123-456-7890';
    stringController.text = 'hello';
    capitalizeController.text = 'flutter';
    numberController.text = '4';
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    stringController.dispose();
    capitalizeController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Utility Suite - Interactive', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildInteractiveCard(
              icon: Icons.email,
              title: 'Email Validator',
              controller: emailController,
              result: emailResult,
              hint: 'Enter email address',
            ),
            _buildInteractiveCard(
              icon: Icons.phone,
              title: 'Phone Validator',
              controller: phoneController,
              result: phoneResult,
              hint: 'Enter phone number (10 digits)',
            ),
            _buildInteractiveCard(
              icon: Icons.text_fields,
              title: 'String Reverser',
              controller: stringController,
              result: reverseResult,
              hint: 'Enter any string',
            ),
            _buildInteractiveCard(
              icon: Icons.format_size,
              title: 'Capitalize First Letter',
              controller: capitalizeController,
              result: capitalizeResult,
              hint: 'Enter any string',
            ),
            _buildInteractiveCard(
              icon: Icons.numbers,
              title: 'Even Number Check',
              controller: numberController,
              result: evenResult,
              hint: 'Enter a number',
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.indigo.shade400, Colors.purple.shade400]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  '✅ Type anything above - results update in real time!',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractiveCard({
    required IconData icon,
    required String title,
    required TextEditingController controller,
    required String result,
    required String hint,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 28, color: Theme.of(context).primaryColor),
                const SizedBox(width: 12),
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('Result: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: title == 'Even Number Check'
                        ? (result == 'Even' ? Colors.green.shade100 : Colors.red.shade100)
                        : (result == 'true' ? Colors.green.shade100 : Colors.red.shade100),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    result.isEmpty ? ' ' : result,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: title == 'Even Number Check'
                          ? (result == 'Even' ? Colors.green.shade800 : Colors.red.shade800)
                          : (result == 'true' ? Colors.green.shade800 : Colors.red.shade800),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}