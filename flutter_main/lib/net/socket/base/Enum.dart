/// 设备判断
enum DeviceTypeEnum {
  // ignore: constant_identifier_names
  WEB(1), // 网页
// ignore: constant_identifier_names
  MOBILE(2), //手机网页
  // ignore: constant_identifier_names
  IOS(3), //Ios
  // ignore: constant_identifier_names
  ANDROID(4), //Android
  // ignore: constant_identifier_names
  OTHER(5); //其他设备

  final int value;

  const DeviceTypeEnum(this.value);
}

enum GameType {
  // ignore: constant_identifier_names
  NONE(-1), // 不是任何游戏类型
  // ignore: constant_identifier_names
  LIVE_LOBBY(-121091), // 直播大厅
  // ignore: constant_identifier_names
  MATCH_LOBBY(-121090), // 比赛大厅
  // ignore: constant_identifier_names
  HALL_VIDEO(-121099), // 全景视频界面
  // ignore: constant_identifier_names
  ALL_GOOD_BACCARAT(0), // 百家乐->好路推荐
  // ignore: constant_identifier_names
  ALL_BACCARAT(1), // 百家乐->全部
  // ignore: constant_identifier_names
  ALL_EUROPE_AMERICA(2), // 欧美游戏->全部
  // ignore: constant_identifier_names
  ALL_ASIA(3), // 亚洲游戏->全部
  // ignore: constant_identifier_names
  ALL_GOOD_FBACCARAT(4), // 特色好路推荐
  // ignore: constant_identifier_names
  ALL_FBACCARAT(5), // 特色全部
  // ignore: constant_identifier_names
  ALL_LIVEGAME(6), // 视讯全部
  // ignore: constant_identifier_names
  GOOD(100), // 好路桌台
  // ignore: constant_identifier_names
  CLASSIC_BACCARAT(2001), // 经典百家乐
  // ignore: constant_identifier_names
  FAST_BACCARAT(2002), // 极速百家乐
  // ignore: constant_identifier_names
  BID_BACCARAT(2003), // 竞咪百家乐
  // ignore: constant_identifier_names
  VIP_BACCARAT(2004), // 包桌百家乐
  // ignore: constant_identifier_names
  REVEAL_BACCARAT(2005), // 共咪百家乐
  // ignore: constant_identifier_names
  DRAGON_TIGER(2006), // 龙虎
  // ignore: constant_identifier_names
  ROULETTE(2007), // 轮盘
  // ignore: constant_identifier_names
  SIC_BO(2008), // 骰宝
  // ignore: constant_identifier_names
  BULL_FIGHT(2009), // 牛牛
  // ignore: constant_identifier_names
  WIN_THREE_CARD(2010), // 炸金花
  // ignore: constant_identifier_names
  THREE_TRUMPS(2011), // 三公
  // ignore: constant_identifier_names
  BLACKJACK(2012), // 旧21点
  // ignore: constant_identifier_names
  MULTI_PLAY(2013), // 多台
  // ignore: constant_identifier_names
  PIT_BACCARAT(2014), // 高额贵宾百家乐
  // ignore: constant_identifier_names
  DOU_NIU(2015), // 斗牛
  // ignore: constant_identifier_names
  INSURANCE_BACCARAT(2016), // 保险百家乐
  // ignore: constant_identifier_names
  CRYPTO_CLASSIC_BACCARAT(2017), // 区块链百家乐
  // ignore: constant_identifier_names
  MATCH_BACCARAT(2018), // 比赛百家乐
  // ignore: constant_identifier_names
  TEXAS_POKER(2019), // 德州扑克
  // ignore: constant_identifier_names
  FAN_TAN(2020), // 番摊
  // ignore: constant_identifier_names
  BLACKJACK_PLUS(2021), // 21点
  // ignore: constant_identifier_names
  COLO_DISC(2022), // 色碟
  // ignore: constant_identifier_names
  PAI_GOW(2023), // 温州牌九
  // ignore: constant_identifier_names
  CASINO_BACCARAT(2024), // 现场VIP百家乐
  // ignore: constant_identifier_names
  ANDA_BAHA(2025), // 安达巴哈
  // ignore: constant_identifier_names
  INDIAN_FRIED_GOLDEN_FLOWER(2026), // 印度炸金花
  // ignore: constant_identifier_names
  DANCE_BACCARAT(2027), // 劲舞百家乐
  // ignore: constant_identifier_names
  OB_BALL(2028), // 滚球
  // ignore: constant_identifier_names
  MARK_SIX(2029), // 6合彩
  // ignore: constant_identifier_names
  BACCARAT_ZHUBO(2030), // 主播百家乐
  // ignore: constant_identifier_names
  GAME_3D(2031), // 3D游戏
  // ignore: constant_identifier_names
  GAME_5D(2032); // 5D游戏

  final int value;

  const GameType(this.value);

  static GameType getGameTypeFromValue(int value) {
    return GameType.values.firstWhere((gameType) => gameType.value == value,
        orElse: () => GameType.NONE);
  }
}

// ignore: camel_case_types
enum GAME_ENV {
  // ignore: constant_identifier_names
  // DEV6("dev6"),
  DEV6("dev"),
  // ignore: constant_identifier_names
  FAT6("fat6"),
  // ignore: constant_identifier_names
  UAT6("uat6"),
  // ignore: constant_identifier_names
  PRO6("pro6"),
  dev("dev"),
  test("test"),
  test2("test2"),
  training("training"),
  prerelease("prerelease"),
  release("release");

  final String value;

  const GAME_ENV(this.value);
}

enum SocketType {
  // ignore: constant_identifier_names
  HEART_BEAT(1), //心跳 用于时间校验的
  // ignore: constant_identifier_names
  CHANGE_KEY(2), //更换密钥
  // ignore: constant_identifier_names
  PROXY_HEART_BEAT(3), //proxy心跳 用于断线重连的
  // ignore: constant_identifier_names
  CONSTRAINT_RECONNECT(4), //强制断线重连
  // ignore: constant_identifier_names
  RECONNECT_CHAT(5), //当聊天或桌边主播或主播厅链接断开，通知客户端进行对应的处理
  // ignore: constant_identifier_names
  RECONNECT_MULTI(6), //当多台好路链接断开，通知客户端进行对应的处理
  // ignore: constant_identifier_names
  RECONNECT_MATCH(10), //大赛服务链接断开
  // ignore: constant_identifier_names
  SERVER_LIMITED(11), //限流通知
  // ignore: constant_identifier_names
  INTER_GAME(101), //进入游戏
  // ignore: constant_identifier_names
  OUT_GAME(102), //离开游戏
  // ignore: constant_identifier_names
  BET(105), //下注
  // ignore: constant_identifier_names
  REQ_ROADPAPER(116), //请求整靴路纸
  // ignore: constant_identifier_names
  GET_LIMITED_REQUEST(180), //获取桌台限红数据
  // ignore: constant_identifier_names
  GOOD_ROAD_BETTING(218), // 好路下注
  // ignore: constant_identifier_names
  SEND_BET_PANEL_ID(231), //进入直播间
  // ignore: constant_identifier_names
  FAST_BET_REQUEST(271), //快速下注->取消下注
  // ignore: constant_identifier_names
  GOOD_ROAD_FAST_BET_REQUEST(272), //好路投注取消下注
  // ignore: constant_identifier_names
  INTER_MULTIPLE(301), //加入多台
  // ignore: constant_identifier_names
  INTER_GOOD_ROAD(302), //加入好路投注 好路投注列表数据
  // ignore: constant_identifier_names
  MULTIPLE_TABLE_LIST_CHANGE(304), //请求多台桌台列表
  // ignore: constant_identifier_names
  NEW_INTER_GAME(401), //支持秒进桌的游戏进入游戏
  // ignore: constant_identifier_names
  MATCH_JOIN_MATCH_HALL(601), //加入比赛大厅
  // ignore: constant_identifier_names
  LOGIN(10000), //登录请求
  // ignore: constant_identifier_names
  NOTICE(10011), //公告
  // ignore: constant_identifier_names
  RECOMMEND_TABLE(10022), //推荐桌子
  // ignore: constant_identifier_names
  QUICK_TABLE_REQ(10024), //请求快速进桌
  // ignore: constant_identifier_names
  KICK_NOTICE(10026), //踢人请求
  // ignore: constant_identifier_names
  REFRESH_BALANCE(10037), //刷新余额
  // ignore: constant_identifier_names
  DEFAULT_LABEL_REQ(10041), //请求默认标签
  // ignore: constant_identifier_names
  DEFAULT_CHIPS_CONFIG_RESPONSE(10051), //查询当前玩家筹码配置信息
  // ignore: constant_identifier_names
  GOOD_ROAD_CHANGE_REQUEST(10056), //请求更改好路列表
  /** */
  LOBBY_GAME_MAPPER(10067), // 选择游戏,获取大分类和对应的标签和桌台数
  // ignore: constant_identifier_names
  GOOD_ROAD_LIST(10021), //好路推荐列表
  // ignore: constant_identifier_names
  GAME_LIST_SWITCH_TAB(10027), //切换标签
  // ignore: constant_identifier_names
  TABLE_BASE_DATA(10070), //桌台基础数据
  // ignore: constant_identifier_names
  TABLE_ROAD(10071), //桌台路纸
  // ignore: constant_identifier_names
  TABLE_BOOT_REPORT(10072), //桌台靴统计
  // ignore: constant_identifier_names
  TABLE_BET_POINT_LIMIT(10073), //桌台限红
  // ignore: constant_identifier_names
  TABLE_BOOT_NUMBER_LIMIT(10074), //桌台牌靴局数限制
  // ignore: constant_identifier_names
  TABLE_VERSION(10075), //桌台版本号查询
  // ignore: constant_identifier_names
  GROUP_ROOM_MAPPER(10078), //新的列表，包含玩法限制，玩法限红
  // ignore: constant_identifier_names
  BET_HALL(10079), //大厅下注
  // ignore: constant_identifier_names
  FAST_BET_REQUEST_HALL(10080), //快速下注大厅版本
  // ignore: constant_identifier_names
  TABLE_CACHE_IDS(10081), //用户本地缓存限红记录
  // ignore: constant_identifier_names
  TABLE_CHANGE_INFO(10083), //桌台数据变化请求
  // ignore: constant_identifier_names
  TABLE_ITEM_INFO(10084), //单个桌台数据请求
  // ignore: constant_identifier_names
  TABLE_ROUND_LIST(10087), //单个桌台已开局局号列表请求
  // ignore: constant_identifier_names
  TABLE_GET_ROUND_INFO(10088), //获取局结果请求
  // ignore: constant_identifier_names
  QUICK_CUT_TABLE(10091), //通知服务器 快速换桌状态变更
  // ignore: constant_identifier_names
  USER_SELF_CHIP(10092), //用户自定义筹码
  // ignore: constant_identifier_names
  CHECK_LIMIT(10093), //玩家放置筹码时，发送信息给服务端做比对进行记录。（只管发，不管返回）
  // ignore: constant_identifier_names
  LIVE_ENTER_ROOM_REQUEST(50000), //进入直播间
  // ignore: constant_identifier_names
  JOIN_LIVE_AGENT_REQUEST(50001), //请求加入美女主播服
  // ignore: constant_identifier_names
  LIVE_ROOMS_REQUEST(50002), //请求主播列表
  // ignore: constant_identifier_names
  LIVE_LEAVE_ROOM_REQUEST(50019), //离开直播间
  // ignore: constant_identifier_names
  LEAVE_LIVE_AGENT_REQUEST(50025), //请求离开美女主播服
  // ignore: constant_identifier_names
  LIVE_GIFT_AMOUNT_CHANGE_REQUEST(50022), //主播礼物点变化广播
  // ignore: constant_identifier_names
  LIVE_GIFT_LIST_REQUEST(50023), //礼物列表查询
  // ignore: constant_identifier_names
  LIVE_SEND_GIFT_REQUEST(50024), //送礼
  // ignore: constant_identifier_names
  LIVE_BET_PANEL_CHANGE_REQUEST(50026), //主播切换玩法面板广播
  LIVE_CHAT_INTER(30000), //进入l聊天室
  LIVE_168(168),
  LIVE_CHAT_SEND(30002); //发送聊天消息

  final int value;

  const SocketType(this.value);
}

enum ModeType {
  // ignore: constant_identifier_names
  NONE(0),
  // ignore: constant_identifier_names
  DEALER_MODE(1), //荷官模式
  // ignore: constant_identifier_names
  SIMPLE_MODE(2), //极简单模式
  // ignore: constant_identifier_names
  ROAD_PAPER(3), //路纸模式
  // ignore: constant_identifier_names
  SCENE_MODE(4); //现场模式

  final int value;

  const ModeType(this.value);
}

/// 钱包类型
enum WalletType {
  // ignore: constant_identifier_names
  BASE(0), // 普通钱包
  // ignore: constant_identifier_names
  SINGLE(1); //单一钱包

  final int value;

  const WalletType(this.value);
}

enum GroupType {
  // ignore: constant_identifier_names
  GOOD_ROAD(9), // 好路推荐列表 客户端自己用
  // ignore: constant_identifier_names
  LIVE(16),
  // ignore: constant_identifier_names
  CLASSIC_BACCARAT(26), // 经典百家乐全部
  // ignore: constant_identifier_names
  WESTERN_GAME(28), // 欧美全部
  // ignore: constant_identifier_names
  ASIA_GAME(30), // 亚洲全部
  // ignore: constant_identifier_names
  FEATURE_BACCARAT(34), // 特色百家乐全部
  // ignore: constant_identifier_names
  GOOD_ROAD_F(36), // 经典标签下的好路
  // ignore: constant_identifier_names
  LIVE_GAME(38); // 视讯游戏

  final int value;

  const GroupType(this.value);
}

enum GameCasinoType {
  // ignore: constant_identifier_names
  ALL(0), //(0 全部厅)
  // ignore: constant_identifier_names
  FLAG_SHIP(1), //(1L, "旗舰厅"),
  // ignore: constant_identifier_names
  CRYPTO(2), //(2L, "区块链厅"),
  // ignore: constant_identifier_names
  LUXURY_CASINO(3), //(3L, "亚太厅"),
  // ignore: constant_identifier_names
  UKRAINE_CASINO(4), //(4L, "乌克兰厅"), 欧洲厅
  // ignore: constant_identifier_names
  INTL_CASINO(5), //(5L, "国际厅");
  // ignore: constant_identifier_names
  FLAG_ROOM(6), //(6L,透亮厅)
  // ignore: constant_identifier_names
  AMERICAN(7), //(7L,“美洲厅”)
  // ignore: constant_identifier_names
  NEW_FLAG_SHIP(8), //(8L,“新旗舰厅”)
  // ignore: constant_identifier_names
  NEW_THOROUGH(9), //(9L,“新主播厅”)
  // ignore: constant_identifier_names
  KOREA_HALL(10), //(10L,“韩国厅”)
  // ignore: constant_identifier_names
  TAIWAN_HALL(11); //(11L,“台湾厅”)

  final int value;

  const GameCasinoType(this.value);
}
