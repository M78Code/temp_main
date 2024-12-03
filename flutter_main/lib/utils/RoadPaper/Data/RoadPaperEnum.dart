enum RoadPaperType_Baccarat {
  NONE(0),
  MAIN_ROAD(1),
  BIG_ROAD(2),
  BIG_EYE_ROAD(3),
  SMALL_ROAD(4),
  SMALL_Q_ROAD(5),
  DRAG_BOUNS(6),
  WIN_POINT(7),
  BIG_PAIR_ROAD(8),
  BIG_PAIR_AND_SUPER_SIX_ROAD(9),
  BIG_SMALL(10),
  ZHI_SHA(11);

  final int value;
  const RoadPaperType_Baccarat(this.value);
}

enum RoadPaperTypeRoulette {
  WIN_NUMBER(0),
  BLACK_RED(1),
  BIG_SMALL(2),
  ODD_EVEN(3),
  DOZEN_COLUMN(4);

  final int value;
  const RoadPaperTypeRoulette(this.value);
}

enum RoadPaperTypeSicBo {
  POINT(0),
  NUMBER(1),
  TOTAL_POINT(2),
  BIG_SMALL(3),
  ODD_EVEN(4);

  final int value;
  const RoadPaperTypeSicBo(this.value);
}

enum RoadPaperBaccaratAskRoadWinState {
  BANKER_WIN(0),
  PLAYER_WIN(1),
  TIE(2);

  final int value;
  const RoadPaperBaccaratAskRoadWinState(this.value);
}

enum BaccaratResult {
  EMPTY(-1),
  PLAYER_WIN(0),
  BANKER_WIN(1),
  TIE(2),
  BANKER_SIX(3),
  DRAGON_WIN(4),
  TIGER_WIN(5),
  PHENIX_WIN(6);

  final int value;
  const BaccaratResult(this.value);


  // 静态方法通过 value 获取对应的枚举
  static BaccaratResult fromValue(int value) {
    return BaccaratResult.values.firstWhere(
          (result) {
            // print("获取到路子结果👍");
            return result.value == value;
          } ,
        orElse: () {
          // print("获取到路子结果❤️");
          return BaccaratResult.EMPTY ;
        }, // 如果找不到，返回 EMPTY
    );
  }

}
