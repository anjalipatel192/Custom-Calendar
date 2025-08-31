class CalenderDays {
  int? date;
  String? day;
  int? month;

  CalenderDays({this.date, this.day, this.month});

  CalenderDays.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['day'] = this.day;
    data['month'] = this.month;
    return data;
  }
}
