double moneyFromJson(dynamic value) => (value as num).toDouble() / 100;

String ofdRuRetailPlaceReadValue(Map json, String fieldName) =>
  json['User'] ?? json["Calculation_Place"];
