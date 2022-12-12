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
    final Map<String, dynamic> SessionData =  <String, dynamic>{};
    SessionData['session_id'] = sessionId;
    SessionData['vaccine'] = vaccine;
    SessionData['name'] = name;
    SessionData['kuota'] = kuota;
    SessionData['dosis'] = dosis;
    SessionData['date'] = date;
    SessionData['start_time'] = startTime;
    SessionData['end_time'] = endTime;
    return SessionData;
  }
}