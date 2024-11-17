class CoronaModel {
  CoronaModel(
      {required this.name,
      required this.id,
      this.colorType = 0,
      this.borderRadius = 0,
      this.flex = 1,
      this.isSelect = false});

  String name;

  ///0:其他,1:红色、2:黑色、
  int colorType = 0;

  bool isSelect = false;

  ///切脚 0:无， 1:topLeft ，2:topRight ，3:bottomLeft，4:BottomRight
  int borderRadius = 0;
  int flex = 1;

  int id;

  ///二维数组，0第一行，1～5 纵向顺序排列
  static List<List<CoronaModel>> coronaList() {
    return [
      [
        CoronaModel(name: '0', id: 3100, flex: 6),
      ],
      [
        CoronaModel(name: '小', id: 3710, flex: 2, borderRadius: 1),
        CoronaModel(name: '双', id: 3709, flex: 2),
        CoronaModel(name: '红', id: 3706, flex: 2),
        CoronaModel(name: '黑', id: 3707, flex: 2),
        CoronaModel(name: '单', id: 3708, flex: 2),
        CoronaModel(name: '大', id: 3711, flex: 2, borderRadius: 3),
      ],
      [
        CoronaModel(name: '第\n一\n打', id: 3703, flex: 4),
        CoronaModel(name: '第\n二\n打', id: 3704, flex: 4),
        CoronaModel(name: '第\n三\n打', id: 3705, flex: 4),
      ],
      [
        CoronaModel(name: '3', id: 3103, colorType: 1),
        CoronaModel(name: '6', id: 3106, colorType: 2),
        CoronaModel(name: '9', id: 3109, colorType: 1),
        CoronaModel(name: '12', id: 3112, colorType: 1),
        CoronaModel(name: '15', id: 3115, colorType: 2),
        CoronaModel(name: '18', id: 3118, colorType: 1),
        CoronaModel(name: '21', id: 3121, colorType: 1),
        CoronaModel(name: '24', id: 3124, colorType: 2),
        CoronaModel(name: '27', id: 3127, colorType: 1),
        CoronaModel(name: '30', id: 3130, colorType: 1),
        CoronaModel(name: '33', id: 3133, colorType: 2),
        CoronaModel(name: '36', id: 3136, colorType: 1),
        CoronaModel(name: '第一列', id: 3700, borderRadius: 3),
      ],
      [
        CoronaModel(name: '2', id: 3102, colorType: 2),
        CoronaModel(name: '5', id: 3105, colorType: 1),
        CoronaModel(name: '8', id: 3108, colorType: 2),
        CoronaModel(name: '11', id: 3111, colorType: 2),
        CoronaModel(name: '14', id: 3114, colorType: 1),
        CoronaModel(name: '17', id: 3117, colorType: 2),
        CoronaModel(name: '20', id: 3120, colorType: 2),
        CoronaModel(name: '23', id: 3123, colorType: 1),
        CoronaModel(name: '26', id: 3126, colorType: 2),
        CoronaModel(name: '29', id: 3129, colorType: 2),
        CoronaModel(name: '32', id: 3132, colorType: 1),
        CoronaModel(name: '35', id: 3135, colorType: 2),
        CoronaModel(name: '第二列', id: 3701),
      ],
      [
        CoronaModel(name: '1', id: 3101, colorType: 1),
        CoronaModel(name: '4', id: 3104, colorType: 2),
        CoronaModel(name: '7', id: 3107, colorType: 1),
        CoronaModel(name: '10', id: 3110, colorType: 2),
        CoronaModel(name: '13', id: 3113, colorType: 2),
        CoronaModel(name: '16', id: 3116, colorType: 1),
        CoronaModel(name: '19', id: 3119, colorType: 1),
        CoronaModel(name: '22', id: 3122, colorType: 2),
        CoronaModel(name: '25', id: 3125, colorType: 1),
        CoronaModel(name: '28', id: 3128, colorType: 2),
        CoronaModel(name: '31', id: 3131, colorType: 2),
        CoronaModel(name: '34', id: 3134, colorType: 1),
        CoronaModel(name: '第三列', id: 3702),
      ]
    ];
  }
}
