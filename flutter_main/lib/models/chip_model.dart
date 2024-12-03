class ChipModel {
  int? id;
  String? icon;
  int? parValue; // 值
  int? type = 0; // 0 固定筹码  1 自定义筹码
  bool? selected;

  ChipModel({
    this.id,
    this.icon,
    this.parValue,
    this.type,
    this.selected,
  });


  ChipModel.fromJson(dynamic json) {
    id = json['id'];
    icon = json['icon'];
    parValue = json['parValue'];
    type = json['type'];
    selected = json['selected'];
  }
}

class ChipModelListEvent{
  ChipModelListEvent({this.defaultChipList,this.selfEditChipList});
  List<ChipModel>? defaultChipList;
  List<ChipModel>? selfEditChipList;
}
