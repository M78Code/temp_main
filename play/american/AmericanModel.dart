class AmericanModel {
  AmericanModel(
      {required this.id, required this.codes, this.x = 0, this.y = 0});

  int id;

  Set<String> codes;

  ///横向 14等份中的位置
  double x;

  ///纵向15等份中的位置
  double y;

  static AmericanModel getModel(int id) {
    return AmericanModel.list().firstWhere((e) => e.id == id,
        orElse: () => AmericanModel.list().first);
  }

  static List<AmericanModel> list() {
    return [
      ///直注
      AmericanModel(id: 3100, codes: {'0'}, x: 8, y: 1),
      AmericanModel(id: 3101, codes: {'1'}, x: 12, y: 2.5),
      AmericanModel(id: 3102, codes: {'2'}, x: 8, y: 2.5),
      AmericanModel(id: 3103, codes: {'3'}, x: 4, y: 2.5),
      AmericanModel(id: 3104, codes: {'4'}, x: 12, y: 3.5),
      AmericanModel(id: 3105, codes: {'5'}, x: 8, y: 3.5),
      AmericanModel(id: 3106, codes: {'6'}, x: 4, y: 3.5),
      AmericanModel(id: 3107, codes: {'7'}, x: 12, y: 4.5),
      AmericanModel(id: 3108, codes: {'8'}, x: 8, y: 4.5),
      AmericanModel(id: 3109, codes: {'9'}, x: 4, y: 4.5),
      AmericanModel(id: 3110, codes: {'10'}, x: 12, y: 5.5),
      AmericanModel(id: 3111, codes: {'11'}, x: 8, y: 5.5),
      AmericanModel(id: 3112, codes: {'12'}, x: 4, y: 5.5),
      AmericanModel(id: 3113, codes: {'13'}, x: 12, y: 6.5),
      AmericanModel(id: 3114, codes: {'14'}, x: 8, y: 6.5),
      AmericanModel(id: 3115, codes: {'15'}, x: 4, y: 6.5),
      AmericanModel(id: 3116, codes: {'16'}, x: 12, y: 7.5),
      AmericanModel(id: 3117, codes: {'17'}, x: 8, y: 7.5),
      AmericanModel(id: 3118, codes: {'18'}, x: 4, y: 7.5),
      AmericanModel(id: 3119, codes: {'19'}, x: 12, y: 8.5),
      AmericanModel(id: 3120, codes: {'20'}, x: 8, y: 8.5),
      AmericanModel(id: 3121, codes: {'21'}, x: 4, y: 8.5),
      AmericanModel(id: 3122, codes: {'22'}, x: 12, y: 9.5),
      AmericanModel(id: 3123, codes: {'23'}, x: 8, y: 9.5),
      AmericanModel(id: 3124, codes: {'24'}, x: 4, y: 9.5),
      AmericanModel(id: 3125, codes: {'25'}, x: 12, y: 10.5),
      AmericanModel(id: 3126, codes: {'26'}, x: 8, y: 10.5),
      AmericanModel(id: 3127, codes: {'27'}, x: 4, y: 10.5),
      AmericanModel(id: 3128, codes: {'28'}, x: 12, y: 11.5),
      AmericanModel(id: 3129, codes: {'29'}, x: 8, y: 11.5),
      AmericanModel(id: 3130, codes: {'30'}, x: 4, y: 11.5),
      AmericanModel(id: 3131, codes: {'31'}, x: 12, y: 12.5),
      AmericanModel(id: 3132, codes: {'32'}, x: 8, y: 12.5),
      AmericanModel(id: 3133, codes: {'33'}, x: 4, y: 12.5),
      AmericanModel(id: 3134, codes: {'34'}, x: 12, y: 13.5),
      AmericanModel(id: 3135, codes: {'35'}, x: 8, y: 13.5),
      AmericanModel(id: 3136, codes: {'36'}, x: 4, y: 13.5),

      ///分注
      AmericanModel(id: 3200, codes: {'0', '1'}, x: 12, y: 2),
      AmericanModel(id: 3201, codes: {'0', '2'}, x: 8, y: 2),
      AmericanModel(id: 3202, codes: {'0', '3'}, x: 4, y: 2),
      AmericanModel(id: 3203, codes: {'1', '2'}, x: 10, y: 2.5),
      AmericanModel(id: 3204, codes: {'1', '4'}, x: 12, y: 3),
      AmericanModel(id: 3205, codes: {'2', '3'}, x: 6, y: 2.5),
      AmericanModel(id: 3206, codes: {'2', '5'}, x: 8, y: 3),
      AmericanModel(id: 3207, codes: {'3', '6'}, x: 4, y: 3),
      AmericanModel(id: 3208, codes: {'4', '5'}, x: 10, y: 3.5),
      AmericanModel(id: 3209, codes: {'4', '7'}, x: 12, y: 4),
      AmericanModel(id: 3210, codes: {'5', '6'}, x: 6, y: 3.5),
      AmericanModel(id: 3211, codes: {'5', '8'}, x: 8, y: 4),
      AmericanModel(id: 3212, codes: {'6', '9'}, x: 4, y: 4),
      AmericanModel(id: 3213, codes: {'7', '8'}, x: 10, y: 4.5),
      AmericanModel(id: 3214, codes: {'7', '10'}, x: 12, y: 5),
      AmericanModel(id: 3215, codes: {'8', '9'}, x: 6, y: 4.5),
      AmericanModel(id: 3216, codes: {'8', '11'}, x: 8, y: 5),
      AmericanModel(id: 3217, codes: {'9', '12'}, x: 4, y: 5),
      AmericanModel(id: 3218, codes: {'10', '11'}, x: 10, y: 5.5),
      AmericanModel(id: 3219, codes: {'10', '13'}, x: 12, y: 6),
      AmericanModel(id: 3220, codes: {'11', '12'}, x: 6, y: 5.5),
      AmericanModel(id: 3221, codes: {'11', '14'}, x: 8, y: 6),
      AmericanModel(id: 3222, codes: {'12', '15'}, x: 4, y: 6),
      AmericanModel(id: 3223, codes: {'13', '14'}, x: 10, y: 6.5),
      AmericanModel(id: 3224, codes: {'13', '16'}, x: 12, y: 7),
      AmericanModel(id: 3225, codes: {'14', '15'}, x: 6, y: 6.5),
      AmericanModel(id: 3226, codes: {'14', '17'}, x: 8, y: 7),
      AmericanModel(id: 3227, codes: {'15', '18'}, x: 4, y: 7),
      AmericanModel(id: 3228, codes: {'16', '17'}, x: 10, y: 7.5),
      AmericanModel(id: 3229, codes: {'16', '19'}, x: 12, y: 8),
      AmericanModel(id: 3230, codes: {'17', '18'}, x: 6, y: 7.5),
      AmericanModel(id: 3231, codes: {'17', '20'}, x: 8, y: 8),
      AmericanModel(id: 3232, codes: {'18', '21'}, x: 4, y: 8),
      AmericanModel(id: 3233, codes: {'19', '20'}, x: 10, y: 8.5),
      AmericanModel(id: 3234, codes: {'19', '22'}, x: 12, y: 9),
      AmericanModel(id: 3235, codes: {'20', '21'}, x: 6, y: 8.5),
      AmericanModel(id: 3236, codes: {'20', '23'}, x: 8, y: 9),
      AmericanModel(id: 3237, codes: {'21', '24'}, x: 4, y: 9),
      AmericanModel(id: 3238, codes: {'22', '23'}, x: 10, y: 9.5),
      AmericanModel(id: 3239, codes: {'22', '25'}, x: 12, y: 10),
      AmericanModel(id: 3240, codes: {'23', '24'}, x: 6, y: 9.5),
      AmericanModel(id: 3241, codes: {'23', '26'}, x: 8, y: 10),
      AmericanModel(id: 3242, codes: {'24', '27'}, x: 4, y: 10),
      AmericanModel(id: 3243, codes: {'25', '26'}, x: 10, y: 10.5),
      AmericanModel(id: 3244, codes: {'25', '28'}, x: 12, y: 11),
      AmericanModel(id: 3245, codes: {'26', '27'}, x: 6, y: 10.5),
      AmericanModel(id: 3246, codes: {'26', '29'}, x: 8, y: 11),
      AmericanModel(id: 3247, codes: {'27', '30'}, x: 4, y: 11),
      AmericanModel(id: 3248, codes: {'28', '29'}, x: 10, y: 11.5),
      AmericanModel(id: 3249, codes: {'28', '31'}, x: 12, y: 12),
      AmericanModel(id: 3250, codes: {'29', '30'}, x: 6, y: 11.5),
      AmericanModel(id: 3251, codes: {'29', '32'}, x: 8, y: 12),
      AmericanModel(id: 3252, codes: {'30', '33'}, x: 4, y: 12),
      AmericanModel(id: 3253, codes: {'31', '32'}, x: 10, y: 12.5),
      AmericanModel(id: 3254, codes: {'31', '34'}, x: 12, y: 13),
      AmericanModel(id: 3255, codes: {'32', '33'}, x: 6, y: 12.5),
      AmericanModel(id: 3256, codes: {'32', '35'}, x: 8, y: 13),
      AmericanModel(id: 3257, codes: {'33', '36'}, x: 4, y: 13),
      AmericanModel(id: 3258, codes: {'34', '35'}, x: 10, y: 13.5),
      AmericanModel(id: 3259, codes: {'35', '36'}, x: 6, y: 13.5),

      ///街注
      AmericanModel(id: 3301, codes: {'1', '2', '3'}, x: 2, y: 2.5),
      AmericanModel(id: 3302, codes: {'4', '5', '6'}, x: 2, y: 3.5),
      AmericanModel(id: 3303, codes: {'7', '8', '9'}, x: 2, y: 4.5),
      AmericanModel(id: 3304, codes: {'10', '11', '12'}, x: 2, y: 5.5),
      AmericanModel(id: 3305, codes: {'13', '14', '15'}, x: 2, y: 6.5),
      AmericanModel(id: 3306, codes: {'16', '17', '18'}, x: 2, y: 7.5),
      AmericanModel(id: 3307, codes: {'19', '20', '21'}, x: 2, y: 8.5),
      AmericanModel(id: 3308, codes: {'22', '23', '24'}, x: 2, y: 9.5),
      AmericanModel(id: 3309, codes: {'25', '26', '27'}, x: 2, y: 10.5),
      AmericanModel(id: 3310, codes: {'28', '29', '30'}, x: 2, y: 11.5),
      AmericanModel(id: 3311, codes: {'31', '32', '33'}, x: 2, y: 12.5),
      AmericanModel(id: 3312, codes: {'34', '35', '36'}, x: 2, y: 13.5),

      ///三数
      AmericanModel(id: 3400, codes: {'0', '1', '2'}, x: 10, y: 2),
      AmericanModel(id: 3401, codes: {'0', '2', '3'}, x: 6, y: 2),

      ///四号
      AmericanModel(id: 3402, codes: {'0', '1', '2', '3'}, x: 2, y: 2),

      ///角注
      AmericanModel(id: 3500, codes: {'1', '2', '3', '4'}, x: 10, y: 3),
      AmericanModel(id: 3501, codes: {'2', '3', '5', '6'}, x: 6, y: 3),
      AmericanModel(id: 3502, codes: {'4', '5', '7', '8'}, x: 10, y: 4),
      AmericanModel(id: 3503, codes: {'5', '6', '8', '9'}, x: 6, y: 4),
      AmericanModel(id: 3504, codes: {'7', '8', '10', '11'}, x: 10, y: 5),
      AmericanModel(id: 3505, codes: {'8', '9', '11', '12'}, x: 6, y: 5),
      AmericanModel(id: 3506, codes: {'10', '11', '13', '14'}, x: 10, y: 6),
      AmericanModel(id: 3507, codes: {'11', '12', '14', '15'}, x: 6, y: 6),
      AmericanModel(id: 3508, codes: {'13', '14', '16', '17'}, x: 10, y: 7),
      AmericanModel(id: 3509, codes: {'14', '15', '17', '18'}, x: 6, y: 7),
      AmericanModel(id: 3510, codes: {'16', '17', '19', '20'}, x: 10, y: 8),
      AmericanModel(id: 3511, codes: {'17', '18', '20', '21'}, x: 6, y: 8),
      AmericanModel(id: 3512, codes: {'19', '20', '22', '23'}, x: 10, y: 9),
      AmericanModel(id: 3513, codes: {'20', '21', '23', '24'}, x: 6, y: 9),
      AmericanModel(id: 3514, codes: {'22', '23', '25', '26'}, x: 10, y: 10),
      AmericanModel(id: 3515, codes: {'23', '24', '26', '27'}, x: 6, y: 10),
      AmericanModel(id: 3516, codes: {'25', '26', '28', '29'}, x: 10, y: 11),
      AmericanModel(id: 3517, codes: {'26', '27', '29', '30'}, x: 6, y: 11),
      AmericanModel(id: 3518, codes: {'28', '29', '31', '32'}, x: 10, y: 12),
      AmericanModel(id: 3519, codes: {'29', '30', '32', '33'}, x: 6, y: 12),
      AmericanModel(id: 3520, codes: {'31', '32', '34', '35'}, x: 10, y: 13),
      AmericanModel(id: 3521, codes: {'32', '33', '35', '36'}, x: 6, y: 13),

      /// 线注

      AmericanModel(
          id: 3600, codes: {'1', '2', '3', '4', '5', '6'}, x: 2, y: 3),
      AmericanModel(
          id: 3601, codes: {'4', '5', '6', '7', '8', '9'}, x: 2, y: 4),
      AmericanModel(
          id: 3602, codes: {'7', '8', '9', '10', '11', '12'}, x: 2, y: 5),
      AmericanModel(
          id: 3603, codes: {'10', '11', '12', '13', '14', '15'}, x: 2, y: 6),
      AmericanModel(
          id: 3604, codes: {'13', '14', '15', '16', '17', '18'}, x: 2, y: 7),
      AmericanModel(
          id: 3605, codes: {'16', '17', '18', '19', '20', '21'}, x: 2, y: 8),
      AmericanModel(
          id: 3606, codes: {'19', '20', '21', '22', '23', '24'}, x: 2, y: 9),
      AmericanModel(
          id: 3607, codes: {'22', '23', '24', '25', '26', '27'}, x: 2, y: 10),
      AmericanModel(
          id: 3609, codes: {'25', '26', '27', '28', '29', '30'}, x: 2, y: 11),
      AmericanModel(
          id: 3610, codes: {'28', '29', '30', '31', '32', '33'}, x: 2, y: 12),
      AmericanModel(
          id: 3611, codes: {'31', '32', '33', '34', '35', '36'}, x: 2, y: 13),

      ///列注
      AmericanModel(
          id: 3702,
          codes: {
            '1',
            '4',
            '7',
            '10',
            '13',
            '16',
            '19',
            '22',
            '25',
            '28',
            '31',
            '34',
            '第三列'
          },
          x: 12,
          y: 14.5),
      AmericanModel(
          id: 3701,
          codes: {
            '2',
            '5',
            '8',
            '11',
            '14',
            '17',
            '20',
            '23',
            '26',
            '29',
            '32',
            '35',
            '第二列'
          },
          x: 8,
          y: 14.5),
      AmericanModel(
          id: 3700,
          codes: {
            '3',
            '6',
            '9',
            '12',
            '15',
            '18',
            '21',
            '24',
            '27',
            '30',
            '33',
            '36',
            '第一列'
          },
          x: 4,
          y: 14.5),

      ///打
      AmericanModel(
          id: 3703,
          codes: {
            '1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
            '8',
            '9',
            '10',
            '11',
            '12',
            '第一打'
          },
          x: 1.5,
          y: 4),
      AmericanModel(
          id: 3704,
          codes: {
            '13',
            '14',
            '15',
            '16',
            '17',
            '18',
            '19',
            '20',
            '21',
            '22',
            '23',
            '24',
            '第二打'
          },
          x: 1.5,
          y: 8),
      AmericanModel(
          id: 3705,
          codes: {
            '25',
            '26',
            '27',
            '28',
            '29',
            '30',
            '31',
            '32',
            '33',
            '34',
            '35',
            '36',
            '第三打'
          },
          x: 1.5,
          y: 12),

      ///红
      AmericanModel(
          id: 3706,
          codes: {
            '1',
            '3',
            '5',
            '7',
            '9',
            '12',
            '14',
            '16',
            '18',
            '19',
            '21',
            '23',
            '25',
            '27',
            '30',
            '32',
            '34',
            '36',
            '红'
          },
          x: 0.5,
          y: 7),

      ///黑
      AmericanModel(
          id: 3707,
          codes: {
            '2',
            '4',
            '6',
            '8',
            '10',
            '11',
            '13',
            '15',
            '17',
            '20',
            '22',
            '24',
            '26',
            '28',
            '29',
            '31',
            '33',
            '35',
            '黑'
          },
          x: 0.5,
          y: 9),

      ///单
      AmericanModel(
          id: 3708,
          codes: {
            '1',
            '3',
            '5',
            '7',
            '9',
            '11',
            '13',
            '15',
            '17',
            '19',
            '21',
            '23',
            '25',
            '27',
            '29',
            '31',
            '33',
            '35',
            '单'
          },
          x: 0.5,
          y: 11),

      ///双
      AmericanModel(
          id: 3709,
          codes: {
            '2',
            '4',
            '6',
            '8',
            '10',
            '12',
            '14',
            '16',
            '18',
            '20',
            '22',
            '24',
            '26',
            '28',
            '30',
            '32',
            '34',
            '36',
            '双'
          },
          x: 0.5,
          y: 5),

      ///小
      AmericanModel(
          id: 3710,
          codes: {
            '1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
            '8',
            '9',
            '10',
            '11',
            '12',
            '13',
            '14',
            '15',
            '16',
            '17',
            '18',
            '小'
          },
          x: 0.5,
          y: 3),

      ///大
      AmericanModel(
          id: 3711,
          codes: {
            '19',
            '20',
            '21',
            '22',
            '23',
            '24',
            '25',
            '26',
            '27',
            '28',
            '29',
            '30',
            '31',
            '32',
            '33',
            '34',
            '35',
            '36',
            '大'
          },
          x: 0.5,
          y: 13),
    ];
  }

  ///街注
  static List<int> streetNotes() => [
        3301,
        3302,
        3303,
        3304,
        3305,
        3306,
        3307,
        3308,
        3309,
        3310,
        3311,
        3312,
      ];

  ///线注
  static List<int> lineBets() => [
        3600,
        3601,
        3602,
        3603,
        3604,
        3605,
        3606,
        3607,
        3609,
        3610,
        3611,
      ];

  ///角注 2\3\5\6 列
  static List<int> r1Js() => [
        3501,
        3503,
        3505,
        3507,
        3509,
        3511,
        3513,
        3515,
        3517,
        3519,
        3521,
      ];

  ///角注 1\2\3\4 列
  static List<int> r2Js() => [
        3500,
        3502,
        3504,
        3506,
        3508,
        3510,
        3512,
        3514,
        3516,
        3518,
        3520,
      ];

  ///分注0~3~36
  static List<int> r1Fs() => [
        3207,
        3212,
        3217,
        3222,
        3227,
        3232,
        3237,
        3242,
        3247,
        3252,
        3257,
        3202,
      ];

  ///分注3～2、5～6
  static List<int> r2Fs() => [
        3205,
        3210,
        3215,
        3220,
        3225,
        3230,
        3235,
        3240,
        3245,
        3250,
        3255,
        3259,
      ];

  ///分注 0~2~35
  static List<int> r3Fs() => [
        3206,
        3211,
        3216,
        3221,
        3226,
        3231,
        3236,
        3241,
        3246,
        3251,
        3256,
        3201,
      ];

  ///分注1～2、5～4
  static List<int> r4Fs() => [
        3203,
        3208,
        3213,
        3218,
        3223,
        3228,
        3233,
        3238,
        3243,
        3248,
        3253,
        3258,
      ];

  ///分注 0~1~34
  static List<int> r5Fs() => [
        3204,
        3209,
        3214,
        3219,
        3224,
        3229,
        3234,
        3239,
        3244,
        3249,
        3254,
        3200,
      ];
}
