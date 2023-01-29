class Option {

  Option(this.text, this.value);

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(json['value'] as String, json['code'] as String);
  }
  final String text;
  final String value;
}
