class SessionData {
  int? sessionId;
  String? vaccine;
  String? name;
  int? kuota;
  String? dosis;
  String? date;
  String? startTime;
  String? endTime;

  SessionData(
      {this.sessionId,
      this.vaccine,
      this.name,
      this.kuota,
      this.dosis,
      this.date,
      this.startTime,
      this.endTime});

  SessionData.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    vaccine = json['vaccine'];
    name = json['name'];
    kuota = json['kuota'];
    dosis = json['dosis'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> SessionData =  Map<String, dynamic>();
    SessionData['session_id'] = this.sessionId;
    SessionData['vaccine'] = this.vaccine;
    SessionData['name'] = this.name;
    SessionData['kuota'] = this.kuota;
    SessionData['dosis'] = this.dosis;
    SessionData['date'] = this.date;
    SessionData['start_time'] = this.startTime;
    SessionData['end_time'] = this.endTime;
    return SessionData;
  }
}