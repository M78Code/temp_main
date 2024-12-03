class ColorLog {
  bool _isRoom = false;

  ColorLog(bool isRoom) {
    this._isRoom = isRoom;
  }

  void logServerData(String title, dynamic msg) {
    String titleCss =
        "font-size:15px;align-items: center;color:#FFF680;background:#7D783D;";
    print('%cGet:$title = %o');
    print(titleCss);
    print(msg);
  }

  void logSendServerData(String title, [dynamic msg]) {
    String titleCss =
        "font-size:15px;align-items: center;color:#403075;background:#887CAF;";

    if (msg != null) {
      print('%cSend:${title} %o');
      print(titleCss);
      print(msg);
    } else {
      print('%cSend:${title} ');
      print(titleCss);
    }
  }

  void logNormal(String title, [dynamic data]) {
    String titleCss = "";
    if (_isRoom) {
      titleCss =
          "font-size:15px;text-align: center;align-items: center;color:#D2ED9E;background:#2D882D;";
    } else {
      titleCss =
          "font-size:15px;text-align: center;align-items: center;color:#ED77C9;background:#5E2E50;";
    }
    if (data != null) {
      print('%c ${title} %o');
      print(titleCss);
      print(data);
    } else {
      print('%c ${title} ');
      print(titleCss);
    }
  }

  void logError(dynamic title) {
    String titleCss =
        "font-size:16px;text-align: center;align-items: center;color:#FFAAAA;background:#AA3939;";
    print('%c ${title} ');
    print(titleCss);
  }
}

final RoomColLog = ColorLog(true);
final GameColLog = ColorLog(false);
