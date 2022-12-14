class TicketData {
  int? bookingId;
  String? queue;
  String? name;
  String? nik;
  String? gender;
  String? vaccine;
  String? dosis;
  String? date;
  String? startTime;
  String? endTime;
  String? rsName;
  String? status;

  TicketData(
      {this.bookingId,
      this.queue,
      this.name,
      this.nik,
      this.gender,
      this.vaccine,
      this.dosis,
      this.date,
      this.startTime,
      this.endTime,
      this.rsName,
      this.status});

  TicketData.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    queue = json['queue'];
    name = json['name'];
    nik = json['nik'];
    gender = json['gender'];
    vaccine = json['vaccine'];
    dosis = json['dosis'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    rsName = json['rs_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['queue'] = this.queue;
    data['name'] = this.name;
    data['nik'] = this.nik;
    data['gender'] = this.gender;
    data['vaccine'] = this.vaccine;
    data['dosis'] = this.dosis;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['rs_name'] = this.rsName;
    data['status'] = this.status;
    return data;
  }
}
