
import 'package:flutter_main/utils/Commond/Tool/Base64Tool.dart';
import 'dart:typed_data';

class RoadPaperParseBytesTool {


  /// 二进制字符串内容
  String _bitString = "";

  /// 当前解析到二进制字符串的第几个字符
  int _curParseIndex = 0;

  /// 二进制字符串的长度
  int _length = 0;


  /// 构造函数
  RoadPaperParseBytesTool(String base64String ) {
    // base64String = "PQYegAAAAAAAAoAAAAAAAAgAAAAAAAAogAAAAAAAgAAAAAAAA4AAAAAAAAgEAgEAgEBoYAAAAAECgkAAAAAAAoFAoAAAAAgAAAAAAAAoHAAAAAAAgEAAAAAAA4lEoAAAAAgAAAAAAAA4IAAAAAAAgcGAAAAAAoHAAAAAAAgQAAAAAAAolAAAAAAAgEAAAAAAAoAAAAAAAAgEAAAAAAAoAAAAAAAAgAAAAAAAAoAAAAAAAAgAAAAAAAAoFA4FGoAAgEAAAAAAAoFAoAAAAAAx2ADw";
    Uint8List buf = Base64Tool.decode(base64String);
    // print("==️===buf❤: $buf");
    _bitString = _getBits(buf);
    // print("当前bitsstirng为xi❤️${_bitString}");
    _length = _bitString.length;
  }

  /// 获得路子的二进制长度
  int get length => _length;

  /// 获取当前Uint8List的二进制字符串
  String _getBits(Uint8List buf) {
    StringBuffer str = StringBuffer();
    for (int i = 0; i < buf.length; i++) {
      String bitsStr = buf[i].toRadixString(2).padLeft(8, '0');
      str.write(bitsStr);
    }
    // print("当前路子二进制str: ${str.toString()}");
    return str.toString();
  }


  /// 获取指定长度的bit并转换成数值
  int getNextInteger(int size) {
// bug 猜测
    var curEndIndex=(_curParseIndex + size);
    if((curEndIndex)>_bitString.length){
      curEndIndex=_bitString.length;
    }
    // print("当前bitstring❤️${_bitString}");
    String bits = _bitString.substring(_curParseIndex, _curParseIndex + size);
    int intValue = int.parse(bits, radix: 2);
    if((_curParseIndex + size)>_bitString.length)
    {
      var maxSize=_bitString.length-_curParseIndex;
      _curParseIndex += maxSize;
    }else
    {
      _curParseIndex += size;
    }
    return intValue;
  }



/// 获取指定长度的bit并转换成数值
// int getNextInteger(int size) {
//   // bug 猜测
//   if (_bitString.length < _curParseIndex + size) {return 0;}
//   String bits = _bitString.substring(_curParseIndex, _curParseIndex + size);
//   int intValue = int.parse(bits, radix: 2);
//   _curParseIndex += size;
//   return intValue;
// }

}
