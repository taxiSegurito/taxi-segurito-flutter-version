import 'dart:convert';
import 'dart:typed_data';

Uint8List imageFromBase64(String base64String) {
  return base64Decode(base64String);
}
