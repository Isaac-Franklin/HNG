import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EncryptTextAlgo {
  // generate IV for encryption
  static final IV iv = IV.fromLength(16);

  static String encryptAES(String encryptionKey, String plainText) {
    final Key key = Key.fromUtf8(encryptionKey.padRight(32, '0').substring(0, 32));
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

// encryptionKey = SECRET KEY
// ENCRYPTEDVALUE = ENCRYPTED TEXT
  static Future<String> saveEncryptedData(
      String encryptionKey, String value) async {
    final prefs = await SharedPreferences.getInstance();
    String encryptedValue = encryptAES(encryptionKey, value);
    String storedValue = '${iv.base64}_$encryptedValue';
    print('storedValue');
    print(storedValue);
    await prefs.setString(encryptionKey, storedValue);
    // await prefs.setString(encryptionKey, encryptedValue);
    return encryptedValue;
  }
}
