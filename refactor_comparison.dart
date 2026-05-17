// ==================== BEFORE REFACTORING (Manual validation) ====================
// Yeh original version tha – manual checking using string methods.
bool validateEmail_before(String email) {
  if (email.isEmpty) return false;
  if (!email.contains('@')) return false;
  if (!email.contains('.')) return false;
  
  int atIndex = email.indexOf('@');
  int dotIndex = email.lastIndexOf('.');
  
  // @ ke baad . hona chahiye
  if (atIndex > dotIndex) return false;
  
  // @ pehla character nahi hona chahiye
  if (atIndex == 0) return false;
  
  // dot last character nahi hona chahiye
  if (dotIndex == email.length - 1) return false;
  
  return true;
}

// ==================== AFTER REFACTORING (Regex validation) ====================
// AI ne refactor kiya – single regex, cleaner aur faster.
bool validateEmail_after(String email) {
  const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  final regex = RegExp(pattern);
  return email.isNotEmpty && regex.hasMatch(email);
}

// ==================== DEMO ====================
void main() {
  print('Before refactor: ${validateEmail_before("test@example.com")}'); // true
  print('After refactor: ${validateEmail_after("test@example.com")}');  // true
  
  print('Before refactor: ${validateEmail_before("invalid")}'); // false
  print('After refactor: ${validateEmail_after("invalid")}');  // false
}