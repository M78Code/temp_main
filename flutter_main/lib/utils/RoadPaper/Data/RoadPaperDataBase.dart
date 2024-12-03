/// 路纸客户端UI数据的基类
class RoadPaperDataBase {
  /// 服务器下发的BASE64加密的路纸数据
  /// RoadInfo里面的任意路纸的Content
  /// 缓存下来用于对比，避免重复执行路纸UI刷新
  String content;

  /// 当前路纸的版本号
  /// 不同的版本使用的样式不同
  int version;

  /// 服务器下发的单个桌子解密转换为位图显示文字后的内容
  /// 是一个二维字符串数组
  /// 客户端根据这个数组去查找bitmap位图对应的文字图进行显示
  List<List<String>> allRoadPaperTextList;

  RoadPaperDataBase({
    required this.content,
    required this.version,
    required this.allRoadPaperTextList,
  });
}
