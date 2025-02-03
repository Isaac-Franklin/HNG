import 'package:shared_preferences/shared_preferences.dart';

import 'decryptalgo.dart';

class EncryptionHistory {
  static Future<String?> getDecryptedData(String secretKey) async {
    final prefs = await SharedPreferences.getInstance();
    // String? encryptedText = prefs.getString(secretKey);
    String? encryptedTextValue = prefs.getString(secretKey);
    if (encryptedTextValue != null) {
      return DecryptData.decryptAES(encryptedTextValue, secretKey);
    }
    return null;
  }
}
