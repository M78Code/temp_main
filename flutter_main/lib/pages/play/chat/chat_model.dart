enum PlayerEnableChatEnum {
  /** 允许聊天 */
  ENABLE(0),
  /** 没有下注 */
  NOT_BET(1),
  /** 身份不正确 */
  IDENTITY_NOT_ALLOW(2),
  /** 禁言 */
  MUTE(3),
  /** 玩家被禁用 */
  PLAYER_DISABLE(4),
  /** 玩家商户不支持聊天 */
  PLAYER_AGENT_DISABLE(5),
  /**流水限制不够不支持聊天 */
  PLAYER_BETLIMIT_DISABLE(6),
  /**发言频繁请稍后再试 */
  PLAYER_SENDFAST_DISABLE(7);

  static PlayerEnableChatEnum getChatTypeFromValue(int value) {
    return PlayerEnableChatEnum.values.firstWhere(
        (chatType) => chatType.value == value,
        orElse: () => PlayerEnableChatEnum.PLAYER_SENDFAST_DISABLE);
  }

  final int value;

  const PlayerEnableChatEnum(this.value);
}

/// 聊天 快捷数据
const List<String> ChatList = [
  "庄！跟我",
  "闲！跟我",
  "这把该出庄了吧？",
  "这把该出和了吧？",
  "该是出对子的时候了",
  "小小！小小！",
  "顶满！！顶满！！",
  "吹掉！！吹掉！！",
  "不要怂，就是干",
  "心态爆炸了…",
  "这把我观望下",
  "这谁顶得住啊",
  "看到长龙跟一发",
  "来张天牌提提神",
  "奈斯！继续继续",
  "这桌荷官真漂亮啊",
  "小姐姐，来个么么哒",
  "这荷官蛮旺的",
  "下一把怎么说？",
  "大哥们推荐下啊",
  "稳住才是王道",
  "这台子旺我啊",
  "难受啊",
  "爽！我就说这把肯定能赢",
  "收！！！",
  "淦！明天再来",
  "哈哈，连赢中",
  "拜拜了，各位",
  "决战到天亮",
];

///聊天 表情图标
const List<Map<String, String>> ChatIconList = [
  {"name": "来个庄", "res": "app_com_biaoqing1"},
  {"name": "暗中观察", "res": "app_com_biaoqing2"},
  {"name": "来个闲", "res": "app_com_biaoqing3"},
  {"name": "又赢了", "res": "app_com_biaoqing4"},
  {"name": "不太稳", "res": "app_com_biaoqing5"},
  {"name": "老板", "res": "app_com_biaoqing6"},
  {"name": "下什么好", "res": "app_com_biaoqing7"},
  {"name": "跟我下注", "res": "app_com_biaoqing8"},
  {"name": "换桌下注", "res": "app_com_biaoqing9"},
  {"name": "叹气", "res": "app_com_biaoqing10"},
  {"name": "稳一手", "res": "app_com_biaoqing11"},
  {"name": "摆手", "res": "app_com_biaoqing12"},
  {"name": "仍是英雄", "res": "app_com_biaoqing13"},
  {"name": "哼", "res": "app_com_biaoqing14"},
  {"name": "太棒了", "res": "app_com_biaoqing15"},
  {"name": "小小", "res": "app_com_biaoqing16"},
  {"name": "啊啊啊", "res": "app_com_biaoqing17"},
  {"name": "爆庄啦", "res": "app_com_biaoqing18"},
  {"name": "吹吹吹", "res": "app_com_biaoqing19"},
  {"name": "电视勿扰", "res": "app_com_biaoqing20"},
  {"name": "顶顶顶", "res": "app_com_biaoqing21"},
  {"name": "管到底", "res": "app_com_biaoqing22"},
  {"name": "接着干", "res": "app_com_biaoqing23"},
  {"name": "来个边", "res": "app_com_biaoqing24"},
  {"name": "输赢缩冲", "res": "app_com_biaoqing25"},
  {"name": "淡笑", "res": "main_icon1"},
  {"name": "得意", "res": "main_icon2"},
  {"name": "发怒", "res": "main_icon3"},
  {"name": "色", "res": "main_icon4"},
  {"name": "惊恐", "res": "main_icon5"},
  {"name": "鼓掌", "res": "main_icon6"},
  {"name": "疑问", "res": "main_icon7"},
  {"name": "打", "res": "main_icon8"},
  {"name": "可怜", "res": "main_icon9"},
  {"name": "偷笑", "res": "main_icon10"},
  {"name": "坏笑", "res": "main_icon11"},
  {"name": "抠鼻", "res": "main_icon12"},
  {"name": "亲亲", "res": "main_icon13"},
  {"name": "尴尬", "res": "main_icon14"},
  {"name": "调皮", "res": "main_icon15"},
  {"name": "流泪", "res": "main_icon16"},
  {"name": "擦汗", "res": "main_icon17"},
  {"name": "鄙视", "res": "main_icon18"},
  {"name": "害羞", "res": "main_icon19"},
  {"name": "再见", "res": "main_icon20"}
];

final List<String> ChatIconKeys =
    ChatIconList.map((e) => e['name'] as String).toList();

class IconTypeConfig {
  IconTypeConfig(
      {required this.selectIconDark,
      required this.selectIconLight,
      required this.unselectIconDark,
      required this.unselectIconLight});

  String selectIconLight;
  String unselectIconLight;

  String selectIconDark;
  String unselectIconDark;

  String getIcon(bool isDark, bool isSelect) {
    if (isDark) {
      if (isSelect) {
        return selectIconDark;
      } else {
        return unselectIconDark;
      }
    } else {
      if (isSelect) {
        return selectIconLight;
      } else {
        return unselectIconLight;
      }
    }
  }
}
