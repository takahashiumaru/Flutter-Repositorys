String jsonToQueryString(Map<String, dynamic> json) {
  String? queryString;
  final keys = json.keys.toList();
  final values = json.values.toList();
  for (var i = 0; i < keys.length; i++) {
    if (queryString == null) {
      queryString = '?${keys[i]}=${values[i]}';
    } else {
      queryString += '&${keys[i]}=${values[i]}';
    }
  }

  return queryString ?? '';
}
