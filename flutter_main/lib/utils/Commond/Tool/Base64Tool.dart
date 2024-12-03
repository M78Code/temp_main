import 'dart:typed_data';

/**
 * 服务器下发的Base64加密解密工具
 */
class Base64Tool {
  static final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  static final List<int> lookup = List.filled(256, 0);

  static bool isInite=false;

  // 初始化 lookup 表
  static void initLookup() {
    for (int i = 0; i < chars.length; i++) {
      lookup[chars.codeUnitAt(i)] = i;
    }
  }

  /**
   * Base64 加密
   * @param arraybuffer
   * @returns 返回加密后的字符串
   */
  static String encode(Uint8List arraybuffer) {
    if(!isInite){
      initLookup();
      isInite=true;
    }
    int len = arraybuffer.length;
    StringBuffer base64 = StringBuffer();

    for (int i = 0; i < len; i += 3) {
      base64.write(chars[arraybuffer[i] >> 2]);
      base64.write(chars[((arraybuffer[i] & 3) << 4) | (arraybuffer[i + 1] >> 4)]);
      base64.write(chars[((arraybuffer[i + 1] & 15) << 2) | (arraybuffer[i + 2] >> 6)]);
      base64.write(chars[arraybuffer[i + 2] & 63]);
    }

    if ((len % 3) == 2) {
      base64.write('=');
    } else if (len % 3 == 1) {
      base64.write('==');
    }

    return base64.toString();
  }

  /**
   * Base64 解密
   * @param base64
   * @returns 返回解码后的 Uint8List
   */
  static Uint8List decode(String base64) {
    if(!isInite){
      initLookup();
      isInite=true;
    }
    int bufferLength = (base64.length * 3) ~/ 4;
    int len = base64.length;
    int p = 0;

    if (base64.endsWith('=')) {
      bufferLength--;
      if (base64.endsWith('==')) {
        bufferLength--;
      }
    }

    Uint8List bytes = Uint8List(bufferLength);
    int encoded1, encoded2, encoded3, encoded4;

    for (int i = 0; i < len; i += 4) {
      encoded1 = lookup[base64.codeUnitAt(i)];
      encoded2 = lookup[base64.codeUnitAt(i + 1)];
      encoded3 = lookup[base64.codeUnitAt(i + 2)];
      encoded4 = lookup[base64.codeUnitAt(i + 3)];

      bytes[p++] = (encoded1 << 2) | (encoded2 >> 4);
      if (p < bufferLength) {
        bytes[p++] = ((encoded2 & 15) << 4) | (encoded3 >> 2);
      }
      if (p < bufferLength) {
        bytes[p++] = ((encoded3 & 3) << 6) | (encoded4 & 63);
      }
    }

    return bytes;
  }
}