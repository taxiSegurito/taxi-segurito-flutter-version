import 'dart:convert';
import 'dart:typed_data';

Uint8List bytesFromBase64String(String base64String) {
  return base64Decode(base64String);
}

String stringFromBase64Bytes(Uint8List bytes) {
  return base64Encode(bytes);
}
