class TicketDetail {
  int? id;
  String? queue;
  String? name;
  String? nik;
  String? gender;
  String? vaccine;
  String? dosis;
  String? date;
  String? convertDate;
  String? startTime;
  String? endTime;
  String? hospitalName;
  String? status;

  TicketDetail({
    this.id,
    this.queue,
    this.name,
    this.nik,
    this.gender,
    this.vaccine,
    this.dosis,
    this.date,
    this.convertDate,
    this.startTime,
    this.endTime,
    this.hospitalName,
    this.status,
  });

  factory TicketDetail.fromJson(Map<String, dynamic> json) {
    return TicketDetail(
      id: json['booking_id'],
      queue: json['queue'],
      name: json['name'],
      nik: json['nik'],
      gender: json['gender'],
      vaccine: json['vaccine'],
      dosis: json['dosis'],
      date: json['date'],
      convertDate: json['conv_date'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      hospitalName: json['rs_name'],
      status: json['status'],
    );
  }
}

class TicketData {
  List<TicketDetail> tickets = [];
}
