class CryptoUnit {
  static int ipToInt(String ip) {
    final reg = RegExp(
        r'^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$');
    final result = reg.firstMatch(ip);
    if (result == null) {
      return -1;
    }
    return ((int.parse(result.group(1)!) << 24) |
        (int.parse(result.group(2)!) << 16) |
        (int.parse(result.group(3)!) << 8) |
        int.parse(result.group(4)!));
  }
}
