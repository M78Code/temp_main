import 'dart:convert';
import 'dart:typed_data';
/**
 * 百家乐所有结果的bitMap Font文字对应的字符集合
 */
class RoadPaperAllBitMapCharacterList_Baccrart {
  /**百家乐问路对应的结果*/
  static List<String> baccaratAskRoad = ["庄", "闲"];

  /**DW商户问路 */
  static List<String> baccaratDWAskRoad = ["庄", "闲"];
  /**龙虎对应的结果 */
  static List<String> dragonTigerAskRoad = ["龙", "虎"];

  static List<String> mainRoadBankerWin = ["庄", "装", "撞", "状"];
  static List<String> mainRoadPlayerWin = ["闲", "现", "县", "线"];
  static List<String> mainRoadBankerSix = ["壮", "狀", "戆", "僮"];
  static List<String> mainRoadTie = ["合", "河", "荷", "和"];

  static List<String> mainRoadOtherList = ["龙", "虎", "聋", "虎", "风"];

  static List<String> dragonRoadBankerWinList = ["龙","隆","拢","珑","庄","装","撞","状"];
  static List<String> dragonRoadBankerSixList = ["壮", "狀", "戆", "僮"];
  static List<String> dragonRoadPlayerWinList = ["聋","农","浓","侬","闲","现","县","线"];
  static List<String> dragonRoadPlayerTieList = ["合", "河", "荷", "和"];

  static List<String> winPointRoadBankerWinList = [
    "鳞亿而闪式物流器把酒食益铒馓",
    "磷以尔山师吴六气爸久",
    "邻意儿删试午留起吧就",
    "凛翼饵伞四屋扭琪捌纠"
  ];
  static List<String> winPointRoadPlayerWinList = [
    "麟一贰善思舞溜期罢救湿易洱霰",
    "霖亦耳扇寺五柳骑巴旧",
    "淋伊二擅诗吾刘其八九",
    "令咦鲕三斯武硫妻霸玖"
  ];
  static List<String> winPointRoadTieList = [
    "琳依鸸杉室误妞弃芭鸠尸艺尓毵",
    "林宜洏散是乌牛棋扒韭",
    "临义佴潵石无瘤启拔揪",
    "零衣迩衫使伍纽鳍疤究"
  ];

  static List<String> bigSmallRoadBigList = ["大", "打", "搭", "答"];
  static List<String> bigSmallRoadSmallList = ["小", "笑", "萧", "肖"];

  static List<String> zhisha = ["百", "杀"];

  static List<List<String>> bigRoadBankerWin = [
    ["骝", "锈", "绣", "秀"],
    ["留", "裤", "窟", "齁"],
    ["刘", "库", "鎏", "琉"],
    ["流", "旒", "继", "疁"],
    ["柳", "果", "裹", "过"],
    ["溜", "节", "界", "接"],
    ["瘤", "母", "体", "木"],
    ["硫", "围", "喂", "未"],
    ["陆", "茨", "慈", "次"],
    ["遛", "紫", "兹", "自"],
    ["馏", "哒", "嗒", "大"],
    ["瑠", "血", "邪", "写"],
    ["绺", "客", "渴", "刻"],
    ["锍", "葛", "格", "革"],
    ["镏", "即", "级", "基"],
    ["旈", "活", "奤", "祸"]
  ];

  static List<List<String>> bigRoadBankerSixWin = [
    ["鲅", "蔻", "硁", "徎"],
    ["蕖", "刳", "鸲", "秸"],
    ["钚", "湫", "莒", "圪"],
    ["桀", "莙", "洸", "窖"],
    ["钯", "猓", "硌", "趏"],
    ["俐", "嗟", "墂", "桦"],
    ["揆", "焜", "赦", "钰"],
    ["炯", "泂", "迦", "桧"],
    ["鳍", "只", "姬", "指"],
    ["焗", "蛰", "瑰", "噷"],
    ["狃", "舵", "陀", "怼"],
    ["伽", "沫", "溴", "敷"],
    ["绯", "窠", "鲲", "远"],
    ["稗", "峻", "氪", "迁"],
    ["钧", "剀", "噱", "倩"],
    ["铂", "骅", "劼", "苑"]
  ];

  static List<List<String>> bigRoadPlayerWin = [
    ["或", "羞", "休", "修"],
    ["先", "县", "线", "仙"],
    ["含", "酷", "哭", "焊"],
    ["寒", "翰", "撼", "涵"],
    ["韩", "国", "郭", "锅"],
    ["汉", "借", "阶", "截"],
    ["真", "姆", "提", "目"],
    ["帧", "位", "维", "为"],
    ["还", "词", "刺", "此"],
    ["海", "子", "仔", "字"],
    ["害", "答", "搭", "达"],
    ["嗨", "谢", "鞋", "些"],
    ["咳", "珂", "课", "壳"],
    ["耗", "阁", "戈", "镉"],
    ["亥", "机", "集", "鸡"],
    ["伤", "货", "蝦", "霍"]
  ];

  static List<List<String>> bigRoadTie = [
    ["一", "亦", "已", "以"],
    ["二", "而", "儿", "尔"],
    ["三", "潵", "帴", "糁"],
    ["四", "蝈", "帼", "椁"],
    ["五", "皆", "介", "杰"],
    ["六", "替", "题", "踢"],
    ["七", "威", "韦", "魏"],
    ["八", "玼", "赐", "辞"],
    ["九", "姿", "梓", "资"],
    ["十", "笪", "怛", "妲"],
    ["幺", "蟹", "协", "斜"],
    ["哈", "可", "克", "科"],
    ["黑", "个", "哥", "歌"],
    ["红", "及", "急", "己"],
    ["打", "蛤", "铪", "虾"]
  ];

  static String otherEmptyChar = "摆";
  static String emptyChar = "百";

  static List<String> bigEyeRoadList = ["喝", "话"];
  static List<String> smallRoadList = ["活", "厚"];
  static List<String> smallQRoadList = ["酒", "回"];

  static Map<String, int> BigRoadPicIndexCharacterMap = {};

  /**
   * 通过路纸结果中的字找到对应该显示的图片
   * @param character 解析后的字符 例如：杀、百、一这些
   * @returns 返回图片的名字
   */
  static int? GetBigRoadPicNameByCharacter(String character) {
    print("大路的解析数据");
    if (BigRoadPicIndexCharacterMap.isEmpty) {
      InitBigRoadPicNameCharacterMap();
    }
    print("大路的解析数据${BigRoadPicIndexCharacterMap}");
    if (BigRoadPicIndexCharacterMap.containsKey(character)) {
      return BigRoadPicIndexCharacterMap[character];
    }
    return -1;
  }
  /**
   * 大路所有结果对应的文字，不要修改里面的文字顺序
   * 因为老代码使用BitMap文字，所以将不同结果的图片变成了文字的ASCII码，
   * 这样获得对应文字即可显示路纸结果的图片
   * 这里的文字和图片命名有关，不要修改里面的文字顺序
   */
  static List<String> BigRoadCharacterList = [
    "骝","锈","绣","秀","留","裤","窟","齁","刘","库","鎏","琉","流","旒","继","疁","柳","果",
    "裹","过","溜","节","界","接","瘤","母","体","木","硫","围","喂","未","陆","茨","慈","次",
    "遛","紫","兹","自","馏","哒","嗒","大","瑠","血","邪","写","绺","客","渴","刻","锍","葛",
    "格","革","镏","即","级","基","旈","活","奤","祸","鲅","蔻","硁","徎","蕖","刳","鸲","秸",
    "钚","湫","莒","圪","桀","莙","洸","窖","钯","猓","硌","趏","俐","嗟","墂","桦","揆","焜",
    "赦","钰","炯","泂","迦","桧","鳍","只","姬","指","焗","蛰","瑰","噷","狃","舵","陀","怼",
    "伽","沫","溴","敷","绯","窠","鲲","远","稗","峻","氪","迁","钧","剀","噱","倩","铂","骅",
    "劼","苑","或","羞","休","修","先","县","线","仙","含","酷","哭","焊","寒","翰","撼","涵",
    "韩","国","郭","锅","汉","借","阶","截","真","姆","提","目","帧","位","维","为","还","词",
    "刺","此","海","子","仔","字","害","答","搭","达","嗨","谢","鞋","些","咳","珂","课","壳",
    "耗","阁","戈","镉","亥","机","集","鸡","伤","货","蝦","霍","二","而","儿","尔","椁","魏",
    "蝈","威","糁","杰","踢","辞","资","妲","歌","虾","潵","帼","皆","替","韦","玼","姿","笪",
    "斜","科","个","己","蛤","四","七","蟹","可","及","帴","介","题","赐","梓","怛","哥","铪",
    "以","三","五","六","八","九","十","协","克","黑","急","打","幺","哈","红","亦","已","一"
  ];

  /**
   * 初始化路子的文字对应该显示的图片的MAP
   * 这里的文字已经人为添加的时候编好顺序，所以只需要for循环每个++获得图片的名字
   * 图片从1开始
   */
  static void InitBigRoadPicNameCharacterMap() {
    int startIndexPic = 1;
    BigRoadPicIndexCharacterMap = {};
    for (int i = 0; i < BigRoadCharacterList.length; i++) {
      String key = BigRoadCharacterList[i];
      int value = (startIndexPic + i);
      BigRoadPicIndexCharacterMap[key] = value;
    }
  }


  /// 判断是不是直杀
  static bool isZhiSha(String character) {
    if (character == zhisha[1]) {
      return true;
    }
    return false;
  }

  // 通过关键字匹配paper icon
  // 第一个参数为路子每个点的文字
  // 第二个参数为是否roadPaperIcon直杀
  static String? roadPaperIcon({ required String word,bool isZhiSha = false}) {
    print("大路的解析数据${word},是否为直杀${isZhiSha}");
    int? index = GetBigRoadPicNameByCharacter(word);
    if (index == -1) return null;
    if(isZhiSha)
    {
      "assets/images/road/roadPaperDirectIcon/${index}.png";
    }
    return "assets/images/road/roadPaperIcon/${index}.png";
  }


  // 除了大路的路子图显示（暂用）
  static List<List<String>> batchRoadPaperIcon({ required List<List<String>> words }) {
    return words.map((row) {
      return row.map((word) {
        return roadPaperIcon(word: word) ?? "";
      }).toList();
    }).toList();
  }


  //获得路子图片的所有路径路纸 ?? 在UI层调用这个方法
  //第一个参数为需要显示的路子的二维数组文字集
  //第一个参数为直杀路路子的二维数组文字集
  static List<List<String>> batchBigRoadPaperIcon(
      {required List<List<String>> roadPaperWords,
        required List<List<String>> ZhiShaPaperWords}) {
    List<List<String>> tempNewList= [[]];
    bool isZhiShaU;
    for(int i=0;i<roadPaperWords.length;i++)
    {
      List<String> tempOneList=[];
      for(int j=0;j<roadPaperWords[i].length;j++)
      {
        isZhiShaU=isZhiSha(ZhiShaPaperWords[i][j]);
        String word = roadPaperWords[i][j];
        var roadWay = roadPaperIcon(word: word, isZhiSha: isZhiShaU);
        tempOneList.add(roadWay ?? "");
      }
      tempNewList.add(tempOneList);
    }
    return tempNewList;
  }

  /// 以下是珠路盘相关

  /**
   * 所有珠盘路的文字和图片对应关系的map
   * 第一个string key为路珠文字
   * 第二个string value为图片名字
   */
  static Map<String,String>ZhuPanRoadRoadPicNameCharacterMap={};

  /**
   * 珠盘路（庄闲珠盘、点数珠盘、龙宝珠盘、大小珠盘）都在这取值
   * 所有结果对应的文字，不要修改里面的文字顺序
   * 因为老代码使用BitMap文字，所以将不同结果的图片变成了文字的ASCII码，
   * 这样获得对应文字即可显示路纸结果的图片
   * 这里的文字和图片命名有关，不要修改里面的文字顺序
   */
  static List<String> AllZhuPanRoadCharacterList= [
    "庄","装","撞","状","闲","现","县","线","壮","狀","戆","僮","合","河","荷","和",
    "龙","隆","拢","珑","聋","农","浓","侬","大","打","搭","答","小","笑","萧","肖",
    "鳞","亿","而","闪","式","物","流","器","把","酒","磷","以","尔","山","师","吴",
    "六","气","爸","久","邻","意","儿","删","试","午","留","起","吧","就","凛","翼",
    "饵","伞","四","屋","扭","琪","捌","纠","麟","一","贰","善","思","舞","溜","期",
    "罢","救","霖","亦","耳","扇","寺","五","柳","骑","巴","旧","淋","伊","二","擅",
    "诗","吾","刘","其","八","九","令","咦","鲕","三","斯","武","硫","妻","霸","玖",
    "琳","依","鸸","杉","室","误","妞","弃","芭","鸠","林","宜","洏","散","是","乌",
    "牛","棋","扒","韭","临","义","佴","潵","石","无","瘤","启","拔","揪","零","衣",
    "迩","衫","使","伍","纽","鳍","疤","究","虎","风","尓","洱","铒","霰","毵","馓",
    "湿","食","尸","艺","易","益"];

  /**
   * 通过路纸结果中的字找到对应该显示的图片
   * @param character 解析后的字符 例如：庄、闲、六这些
   * @returns 返回图片的名字
   */
  static String? GetZhuPanRoadLuZhuPicNameByCharacter(String character) {
    // print("获取珠盘路${character}");
    if (ZhuPanRoadRoadPicNameCharacterMap.isEmpty) {
      InitZhuPanRoadRoadPicNameCharacterMap();
    }
    // print("获取珠盘路♥${ZhuPanRoadRoadPicNameCharacterMap}");
    if (ZhuPanRoadRoadPicNameCharacterMap.containsKey(character)) {
      // print("获取珠盘路♥${character}");
      return ZhuPanRoadRoadPicNameCharacterMap[character];
    }
    return "";
  }

  /**
   * 初始化各类珠盘路的map，key为路纸解析的文字，value为icon的图片路径
   * 这里的文字已经人为添加的时候编好顺序，所以只需要for循环每个++获得图片的名字
   * 图片从1开始
   */
  static void InitZhuPanRoadRoadPicNameCharacterMap() {
    // print("获取珠路盘初始化");
    int startIndexPic = 1;
    ZhuPanRoadRoadPicNameCharacterMap = {};
    for (int i = 0; i < AllZhuPanRoadCharacterList.length; i++) {
      String key = AllZhuPanRoadCharacterList[i];
      //修改文件加路径
      String value = "assets/images/road/roadPartIcon/cn/ZhuPanRoad/${startIndexPic +
          i}.png";
      ZhuPanRoadRoadPicNameCharacterMap[key] = value;
    }
  }


  // 通过关键字匹配各种珠盘路paper icon
  // 第一个参数为路子每个点的文字
  static String? roadZhuPanPaperIcon(String word) {
    // print("传进来的珠路盘单个数据为${word}");
    String? iconName = GetZhuPanRoadLuZhuPicNameByCharacter(word);
    if (iconName == "") return null;
    return iconName;
  }

  ///**** 珠盘路的显示
  static List<List<String>> batchZhuPanPaperIcons(
      { required List<List<String>> words }) {

    // print("传进来的珠路盘数据为${words}");
    return words.map((row) {
      return row.map((word) {
        return roadZhuPanPaperIcon(word) ?? "";
      }).toList();
    }).toList();
  }

  /// 以下是小路相关

  /**
   * 所有小路的文字和图片对应关系的map
   * 第一个string key为路珠文字
   * 第二个string value为图片名字
   */
  static Map<String,String> AllSmallRoadRoadPicNameCharacterMap={};

  /**
   * 小路、大眼仔、小强路 都在这取值
   * 所有结果对应的文字，不要修改里面的文字顺序
   * 因为老代码使用BitMap文字，所以将不同结果的图片变成了文字的ASCII码，
   * 这样获得对应文字即可显示路纸结果的图片
   * 这里的文字和图片命名有关，不要修改里面的文字顺序
   */
  static List<String> AllSmallRoadCharacterList=
  [ "喝","话","活","厚","酒","回"];

  /**
   * 通过路纸结果中的字找到对应该显示的图片
   * @param character 解析后的字符 例如：庄、闲、六这些
   * @returns 返回图片的名字
   */
  static String? GetSmallRoadLuZhuPicNameByCharacter(String character) {
    print("调用小路初始化22${character}");
    if (AllSmallRoadRoadPicNameCharacterMap.isEmpty) {
      InitAllSmallRoadRoadPicNameCharacterMap();
    }
    print("调用小路初始化33${AllSmallRoadRoadPicNameCharacterMap}");

    if (AllSmallRoadRoadPicNameCharacterMap.containsKey(character)) {
      print("调用小路初始化44");
      return AllSmallRoadRoadPicNameCharacterMap[character];
    }
    return "";
  }

  /**
   * 初始化小路的map，key为路纸解析的文字，value为icon的图片路径
   * 这里的文字已经人为添加的时候编好顺序，所以只需要for循环每个++获得图片的名字
   * 图片从1开始
   */
  static void InitAllSmallRoadRoadPicNameCharacterMap() {
    print("调用小路初始化");
    int startIndexPic = 0;
    AllSmallRoadRoadPicNameCharacterMap = {};
    for (int i = 0; i < AllSmallRoadCharacterList.length; i++) {
      String key = AllSmallRoadCharacterList[i];
      //修改文件加路径
      String value =
          "assets/images/road/roadPartIcon/cn/SmallRoad/${startIndexPic + i}.png";
      AllSmallRoadRoadPicNameCharacterMap[key] = value;
    }
  }

  // 通过关键字匹配各种小路paper icon
  // 第一个参数为路子每个点的文字
  static String? roadSmallRoadPaperIcon(String word) {
    String? iconName = GetSmallRoadLuZhuPicNameByCharacter(word);
    if (iconName == "") return null;
    return iconName;
  }

  ///**** 小路的显示
  static List<List<String>> batchSmallRoadPaperIcons(
      {required List<List<String>> words}) {
    print("调用小路初始化${words}");
    return words.map((row) {
      return row.map((word) {
        return roadSmallRoadPaperIcon(word) ?? "";
      }).toList();
    }).toList();
  }


}
