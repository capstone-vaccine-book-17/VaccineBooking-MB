class SessionData {
  int? sessionId;
  String? vaccine;
  String? name;
  int? kuota;
  String? dosis;
  String? date;
  String? startTime;
  String? endTime;

  BookData? bookData;
  SessionData({
    this.sessionId,
    this.vaccine,
    this.name,
    this.kuota,
    this.dosis,
    this.date,
    this.startTime,
    this.endTime,
    this.bookData,
  });

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
    final Map<String, dynamic> sessionData = <String, dynamic>{};
    sessionData['session_id'] = sessionId;
    sessionData['vaccine'] = vaccine;
    sessionData['name'] = name;
    sessionData['kuota'] = kuota;
    sessionData['dosis'] = dosis;
    sessionData['date'] = date;
    sessionData['start_time'] = startTime;
    sessionData['end_time'] = endTime;
    return sessionData;
  }
}

class BookData {
  String? queue;
  String? name;
  String? nik;
  String? gender;
  String? vaccine;
  String? dosis;
  String? date;
  String? convDate;
  String? startTime;
  String? endTime;
  String? rsName;

  BookData({
    this.queue,
    this.name,
    this.nik,
    this.gender,
    this.vaccine,
    this.dosis,
    this.date,
    this.convDate,
    this.startTime,
    this.endTime,
    this.rsName,
  });
}
