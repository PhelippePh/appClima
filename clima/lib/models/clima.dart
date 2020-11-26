class ClimaModel {
  String by;
  bool validKey;
  Results results;
  dynamic executionTime;
  bool fromCache;

  ClimaModel(
      {this.by,
      this.validKey,
      this.results,
      this.executionTime,
      this.fromCache});

  ClimaModel.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    validKey = json['valid_key'];
    results =
        json['results'] != true ? new Results.fromJson(json['results']) : true;
    executionTime = json['execution_time'];
    fromCache = json['from_cache'];
  }
}

class Results {
  int temp;
  int humidity;
  String date;
  String time;
  String conditionCode;
  String description;
  String currently;
  String cid;
  String city;
  String imgId;
  String conditionSlug;
  String cityName;
  List<Forecast> forecast;

  Results(
      {this.temp,
      this.date,
      this.time,
      this.conditionCode,
      this.description,
      this.currently,
      this.cid,
      this.city,
      this.imgId,
      this.conditionSlug,
      this.cityName,
      this.forecast});

  Results.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    date = json['date'];
    time = json['time'];
    conditionCode = json['condition_code'];
    description = json['description'];
    currently = json['currently'];
    cid = json['cid'];
    city = json['city'];
    imgId = json['img_id'];
    conditionSlug = json['condition_slug'];
    cityName = json['city_name'];
    if (json['forecast'] != null) {
      forecast = new List<Forecast>();
      json['forecast'].forEach((v) {
        forecast.add(new Forecast.fromJson(v));
      });
    }
  }
}

class Forecast {
  String date;
  String weekday;
  int max;
  int min;
  String description;
  String condition;

  Forecast(
      {this.date,
      this.weekday,
      this.max,
      this.min,
      this.description,
      this.condition});

  Forecast.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    weekday = json['weekday'];
    max = json['max'];
    min = json['min'];
    description = json['description'];
    condition = json['condition'];
  }
}
