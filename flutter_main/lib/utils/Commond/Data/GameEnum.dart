/**
* 游戏现场厅类型 
*/
enum CasinoIdType {
  /**全部厅*/
  ALL(0),
  /**旗舰厅*/
  FLAG_SHIP(1),
  /**区块链厅*/
  CRYPTO(2),
  /**亚太厅*/
  LUXURY_CASINO(3),
  /**乌克兰厅*/
  UKRAINE_CASINO(4),    
  /**国际厅*/
  INTL_CASINO(5),
  /**透亮厅/主播厅*/
  FLAG_TOULIANG(6),
  /**美洲厅*/
  AMERICAN(7),
  /**新旗舰厅*/
  NEW_FLAG_SHIP(8),
  /**新主播厅*/
  NEW_FLAG_TOULIANG(9),
  /**韩国厅*/
  KOREA(10),
  /**台湾厅*/
  TAIWAN(11);

  final int value;
  const CasinoIdType(this.value);
}

/**
 * 游戏类型
 */

enum GameType {
    /**主播间返回 */
    HALL_VIDEO(-121099),
    /**比赛大厅 */
    MATCH_LOBBY(-121090),
    LIVE_LOBBY(-121091),
    /** 不是任何游戏类型 */
    NONE(-1),
    /**百家乐好路*/
    Baccarat_GOOD_ROAD(0),
    /**大厅所有游戏 */
    HALL_ALL(1),
    /** */
    Baccarat_GOOD_ROAD_F(4),
    /** 经典百家乐 */
    BACCARAT(2001),
    /** 极速百家乐 */
    BACCARAT_FAST(2002),
    /** 竞咪百家乐 */
    BACCARAT_BID (2003),
    /** 包桌百家乐 */
    BACCARAT_VIP (2004),
    /** 共咪百家乐 */
    BACCARAT_REVEAL(2005),
    /** 龙虎，服务器下发的39、6也是这个类型，6=39=2006*/
    DRAGONTIGER(2006),
    /** 轮盘，服务器下发的2、29也是这个类型，2=29=2007*/
    ROULETTE(2007),
    /** 骰宝，服务器下发的3、31也是这个类型，3=31=2008*/
    SIC_BO(2008),
    /** 牛牛 */
    NIUNIU(2009),
    /** 炸金花 */
    WIN_THREE_CARDS(2010),
    /** 三公 */
    THREE_TRUMPS(2011),
    /** 21点 */
    BLACKJACK_OLD(2012),
    /** 多台 */
    MULTIPLAY(2013),
    /** 高额百家乐 是竞咪 */
    BACCARAT_HIGH_STAKES(2014),
    /** 斗牛 */
    DOU_NIU(2015),
    /** 保险百家乐 */
    BACCARAT_INSURANCE(2016),  
    /** 区块链经典百家乐 */
    CRYPTO_CLASSIC_BACCARAT(2017),
    /** 百家乐大赛 */
    BACCARAT_MATCH(2018),
    /** 德州扑克 */
    TEXASPOKER(2019),
    /** 番摊 */
    FAN_TAN(2020),
    /** 21点 */
    BLACKJACK(2021),
    /** 色碟 */
    COLORDISC(2022),
    /** 牌九 */
    PAIGOW(2023),
    /**安达巴哈 */
    ANDARBAHAR(2025),
    /**印度炸金花 */
    INDIA_THREECARDS(2026),
    /** 劲舞百家乐*/
    BACCARAT_JINWU(2027),
    /**OB滚球 */
    OBBALL(2028),
    /**六合彩 */
    MarkSix(2029),
    /**主播厅游戏 */
    BACCARAT_ZHUBO(2030),
    /**3D游戏 */
    GAME_3D(2031),
    /**5D游戏 */
    GAME_5D(2032);

  final int value;

  const GameType(this.value);
}

/**
 * 游戏分组ID
 */
enum GameGroupType {
  NONE(-99),
  /** 好路推荐列表 */
  GOOD_ROAD_LIST(-1),
  /** 全部游戏*/
  ALL(0),
  /** 百家乐->全部 */
  ALL_BACCARAT(1),
  /** 欧美游戏->全部 */
  ALL_EUROPE_AMERICA(2),
  /** 亚洲游戏->全部" */
  ALL_ASIA(3),
  /** 特色百家乐->好路推荐 */
  ALL_GOOD_BACCARAT_SPECIAL(4),
  /** 特色百家乐->全部 */
  ALL_BACCARAT_SPECIAL(5),
  /** 彩票全部 */
  ALL_LIVEGAME(6),
  /** 百家乐好路推荐 */
  GOOD_ROAD_BACCARAT(9),
  /** 好路推荐 */
  GOOD_ROAD(19),
  /** PC 亚洲全部 */
  PC_YAZHOU_GAME(20),
  /** PC 百家乐全部 */
  PC_BACCARAT(26),
  /** 百家乐 */
  BACCARAT(27),
  /** PC 欧美全部 */
  PC_OUMEI_GAME(28),
  /**欧美全部 */
  OUMEI_GAME(29),
  /** 亚洲全部 */
  YAZHOU_GAME(31),
  /** 特色百家乐 */
  BACCARAT_SPECIAL(35),
  /** PC 视讯彩票 */
  PC_LIVE_GAME(38),
  /** 视讯彩票 */
  LIVE_GAME(39),
  /** 歷史桌台 */
  HISTORY_GAME(40),
  /** 全部游戏 */
  ALL_GAME(42);

  final int value;
  const GameGroupType(this.value);
}

/// 游戏桌台状态
/// 0--准备中， 1--洗牌中，2--下注中，3--开牌中，4--结算中，6--维护中，11-维护中
enum GameStatus {
  /// 准备中
  READY(0),
  /// 洗牌中
  SHUFFLE(1),
  /// 下注中
  BET(2),
  /// 开牌中
  OPEN(3),
  /// 结算中
  COUNT(4),
  /// 维护中
  MAINTAIN(6);

  final int value;
  const GameStatus(this.value);
}

/**
 * 游戏桌台开放状态 
*/
enum OpenStatus {
  /**准备中 */
  READY(0),
  /**洗牌中 */
  SHUFFLE(1),
  /**下注中 */
  BET(2),
  /**开牌中 */
  OPEN(3),
  /**结算中 */
  COUNT(4),
  /**维护中*/
  MAINTAIN(6),
  /**即将开放 */
  OPENSOON(7);

  final int value;
  const OpenStatus(this.value);
}

/**
 * 百家乐不同下注玩法组的ID类型
 */
enum BaccaratBetPointGroupType {
    NONE(0),
    /** 庄 */
    BANKER(3001),
    /** 闲 */
    PLAYER(3002),
    /** 和 */
    TIE(3003),
    /** 庄对 */
    BANKER_NUMBER_PAIR(3004),
    /** 闲对 */
    PLAYER_NUMBER_PAIR(3005),
    /** 大 */
    BIG(3006),
    /** 小 */
    SMALL(3007),
    /** 完美对子 */
    ALL_PAIR(3009),
    /** 庄龙宝 */
    BANKER_DRAGON(3010),
    /** 闲龙宝 */
    PLAYER_DRAGON(3011),
    /** 超级6 */
    SUPER_SIX(3012),
    /** 庄免佣 */
    BANKER_FREE(3013),
    /** 任意对子 */
    ANY_NUMBER_PAIR(3014),
    /** 超和(0) */
    SUPER_TIE_ZERO(4100),
    /** 超和(1) */
    SUPER_TIE_ONE(4101),
    /** 超和(2) */
    SUPER_TIE_TWO(4102),
    /** 超和(3) */
    SUPER_TIE_THREE(4103),
    /** 超和(4) */
    SUPER_TIE_FOUR(4104),
    /** 超和(5) */
    SUPER_TIE_FIVE(4105),
    /** 超和(6) */
    SUPER_TIE_SIX(4106),
    /** 超和(7) */
    SUPER_TIE_SEVEN(4107),
    /** 超和(8) */
    SUPER_TIE_EIGHT(4108),
    /** 超和(9) */
    SUPER_TIE_NINE(4109),
    /** 超级对 */
    SUPER_PAIR(4110),
    /** 龙7 */
    DRAGON_SEVEN(4111),
    /** 熊猫8 */
    PANDA_EIGHT(4112),
    /** 大老虎 */
    BIG_TIGER(4113),
    /** 小老虎 */
    SMALL_TIGER(4114),
    /** 庄天牌 */
    BANKER_SKY(4115),
    /** 闲天牌 */
    PLAYER_SKY(4116),
    /** 天牌 */
    SKY(4117),
    /** 龙 */
    DRAGON(4118),
    /** 虎 */
    TIGER(4119),
    /** 龙虎和 */
    DRAGON_TIGER_TIE(4120),
    /** 庄保险(第一轮) */
    BANKER_INSURANCE_FIRST(4121),
    /** 庄保险(第二轮) */
    BANKER_INSURANCE_SECOND(4122),
    /** 闲保险(第一轮) */
    PLAYER_INSURANCE_FIRST(4123),
    /** 闲保险(第二轮) */
    PLAYER_INSURANCE_SECOND(4124),
    /** 老虎和 */
    TIGER_TIE(4204),
    /** 老虎对 */
    TIGER_PAIR(4205),
    /** 不存在,只做映射用 */
    SUPER_TIE(-1),
    /** 不存在,只做映射用 */
    BANKER_PLAYER_DRAGON (-2);
  final int value;
  const BaccaratBetPointGroupType(this.value);
}

/**
* VIP牌桌的状态
*/
enum VIPTableStatus {
  /**未包桌和独享*/
  NONE(0),
  /**共享包桌*/
  ShareVIP(1),
  /**独享包桌 */
  OneSelfVIP(2);

  final int value;
  const VIPTableStatus(this.value);
}

/**
 * 服务器连接类型
 */
enum ServiceTypeConst {
  /** 大厅,长连接 */
  HALL(7),
  /** 多台,长连接 */
  MULTIPLE(2),
  /** 游戏服,同时只能连接一个 */
  GAME(3),
  /** 聊天,同时只能连接一个 */
  CHAT(4);

  final int value;
  const ServiceTypeConst(this.value);
}
