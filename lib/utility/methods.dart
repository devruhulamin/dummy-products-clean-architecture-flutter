double tryParseDouble(dynamic value, [double defaultValue = 0.0]) {
  if (value == null) return defaultValue;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? defaultValue;
  return defaultValue;
}

int tryParseInt(dynamic value, [int defaultValue = 0]) {
  if (value == null) return defaultValue;
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) return int.tryParse(value) ?? defaultValue;
  return defaultValue;
}

DateTime tryParseDateTime(dynamic value, [DateTime? defaultValue]) {
  if (value == null) return defaultValue ?? DateTime(1970);
  if (value is DateTime) return value;
  if (value is String) {
    return DateTime.tryParse(value) ?? (defaultValue ?? DateTime(1970));
  }
  return defaultValue ?? DateTime(1970);
}
