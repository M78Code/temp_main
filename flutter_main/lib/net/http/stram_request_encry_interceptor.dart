import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';

class StramRequestEncryInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {

      final requestData = options.data;

      options.data = "{\"data\": \"${encryptData(requestData)}\",\"clientType\": 1}";

      handler.next(options);
  }


// AES Encryption Function
  String encryptData(Map<String, dynamic> data) {
    // Define the AES key (16-byte key for AES-128)
    final key = Key.fromUtf8('jg8e9FuYMK6Qcn56');

    // Use ECB mode with PKCS7 padding
    final encrypter = Encrypter(AES(key, mode: AESMode.ecb, padding: 'PKCS7'));

    // Convert the data to UTF-8 encoded string
    final plainText = utf8.encode(jsonEncode(data));

    // Encrypt the plain text
    final encrypted = encrypter.encryptBytes(plainText);

    // Return the encrypted string in Hex encoding
    return hex.encode(encrypted.bytes);
  }

}