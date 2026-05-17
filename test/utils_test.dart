import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ai/main.dart';   // ← IMPORTANT: package name ab flutter_ai hai

void main() {
  group('validateEmail', () {
    test('valid email', () => expect(validateEmail('user@domain.com'), true));
    test('empty string', () => expect(validateEmail(''), false));
    test('no @', () => expect(validateEmail('userexample.com'), false));
  });

  group('validatePhoneNumber', () {
    test('10 digits', () => expect(validatePhoneNumber('1234567890'), true));
    test('with dashes', () => expect(validatePhoneNumber('123-456-7890'), true));
    test('short', () => expect(validatePhoneNumber('12345'), false));
  });

  group('reverseString', () {
    test('hello -> olleh', () => expect(reverseString('hello'), 'olleh'));
    test('empty', () => expect(reverseString(''), ''));
    test('single char', () => expect(reverseString('a'), 'a'));
  });

  group('capitalizeFirstLetter', () {
    test('flutter -> Flutter', () => expect(capitalizeFirstLetter('flutter'), 'Flutter'));
    test('empty', () => expect(capitalizeFirstLetter(''), ''));
    test('already capital', () => expect(capitalizeFirstLetter('Flutter'), 'Flutter'));
  });

  group('isEvenNumber', () {
    test('4 is even', () => expect(isEvenNumber(4), true));
    test('3 is odd', () => expect(isEvenNumber(3), false));
    test('0 is even', () => expect(isEvenNumber(0), true));
    test('-2 is even', () => expect(isEvenNumber(-2), true));
  });
}