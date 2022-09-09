class Condition {
  String? text;
  String? icon;
  num? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String?, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

}
