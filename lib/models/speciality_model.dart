class Speciality {
  int? id;
  dynamic name;
  dynamic iconUrl;
  dynamic description;
  dynamic conditions;
  dynamic bgColor1;
  dynamic bgColor2;
  dynamic iconColor;

  Speciality(
      {this.id,
      this.name,
      this.iconUrl,
      this.description,
      this.conditions,
      this.bgColor1,
      this.bgColor2,
      this.iconColor});

  Speciality.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iconUrl = json['icon_url'];
    description = json['description'];
    conditions = json['conditions'];
    bgColor1 = json['bg_color1'];
    bgColor2 = json['bg_color2'];
    iconColor = json['icon_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon_url'] = iconUrl;
    data['description'] = description;
    data['conditions'] = conditions;
    data['bg_color1'] = bgColor1;
    data['bg_color2'] = bgColor2;
    data['icon_color'] = iconColor;
    return data;
  }
}
