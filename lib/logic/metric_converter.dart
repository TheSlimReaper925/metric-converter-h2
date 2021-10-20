class MetricConverter {
  double convert(double number, String? from, String? to) {
    var metrics = {
      "cm": 1,
      "m": 100,
      'km': 100000,
    };
    var result;
    if (from == to) {
      result = number;
    } else {
      result = number * (metrics[from]! / metrics[to]!);
    }
    return result;
  }
}
