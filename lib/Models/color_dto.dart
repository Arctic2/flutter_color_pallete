class ColorsData {
  List<ColorDto> colors = [];

  ColorsData.fromJson(Map<String, dynamic> json) {
    if (json['colors'] != null) {
      json['colors'].forEach((v) {
        if (v['value'] != null) colors.add(ColorDto.fromJson(v));
      });
    }
  }
}

class ColorDto {
  String name;
  String hex;

  ColorDto(this.name, this.hex);

  ColorDto.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        hex = json['value'];
}
