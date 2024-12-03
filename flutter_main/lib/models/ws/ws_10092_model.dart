class Ws10092Model {
  String? defaultChip;
  String? selectedChip;
  String? selfEditChips;

  Ws10092Model({this.defaultChip, this.selectedChip, this.selfEditChips});

  factory Ws10092Model.fromJson(Map<String, dynamic> json) => Ws10092Model(
        defaultChip: json["defaultChip"],
        selectedChip: json["selectedChip"],
        selfEditChips: json["selfEditChips"],
      );

  Map<String, dynamic> toJson() => {
        "defaultChip": defaultChip,
        "selectedChip": selectedChip,
        "selfEditChips": selfEditChips
      };
}

class Ws10092ModelEvent {
  Ws10092ModelEvent(this.model);
  Ws10092Model model;
}
