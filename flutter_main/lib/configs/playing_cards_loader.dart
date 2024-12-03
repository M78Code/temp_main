class PlayingCardsLoader {

  /// 梅花纸牌
  static String clubsPlayingCard({ required int index, bool isBlack = false })  {
    assert(index >= 1 && index <= 13);
    return "assets/images/playingCards/clubs/${isBlack ? "black" : "normal"}/$index.png";
  }

  /// 方块纸牌
  static String diamondsPlayingCard({ required int index, bool isBlack = false })  {
    assert(index >= 1 && index <= 13);
    return "assets/images/playingCards/diamonds/${isBlack ? "black" : "normal"}/$index.png";
  }

  /// 红心纸牌
  static String heartsPlayingCard({ required int index, bool isBlack = false })  {
    assert(index >= 1 && index <= 13);
    return "assets/images/playingCards/hearts/${isBlack ? "black" : "normal"}/$index.png";
  }

  /// 黑桃纸牌
  static String spadesPlayingCard({ required int index, bool isBlack = false })  {
    assert(index >= 1 && index <= 13);
    return "assets/images/playingCards/spades/${isBlack ? "black" : "normal"}/$index.png";
  }

}