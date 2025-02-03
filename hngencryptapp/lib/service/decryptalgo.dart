import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DecryptData {
  static Future<String> decryptAES(String userEncryptedText, secretKey) async {
    // fetch store data alongside the IV for decrypting
    // Retrieve stored data
    final prefs = await SharedPreferences.getInstance();

    String? storedValue = prefs.getString(secretKey);
    if (storedValue == null) {
      return 'Kpele, wrong Secret Key. Kindly try again!';
    }
    print(userEncryptedText);

    // Split the stored value into IV and encrypted text
    List<String> parts = storedValue.split('_');
    if (parts.length != 2) {
      return 'Invalid stored data format!';
    }

    String ivBase64 = parts[0];
    String encryptedText = parts[1];
    if (encryptedText != userEncryptedText) {
      return 'Invalid stored data format!';
    }

    // Ensure userKey is 16, 24, or 32 bytes
    final Key key = Key.fromUtf8(secretKey.padRight(32, '0').substring(0, 32));

    // generate encrypter before decrypting text
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    // Convert IV back from Base64
    final IV iv = IV.fromBase64(ivBase64);

    // error check and decrypt when supplied data is valid
    try {
      return encrypter.decrypt64(encryptedText, iv: iv);
    } catch (e) {
      return 'Decryption failed: Invalid key or corrupted data';
    }
  }
}
