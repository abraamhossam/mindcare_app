class BookingModel {
  String? createdAt;
  String? day;
  String? hour;
  String? doctorName;
  String? userName;
  List? members;
  String? id;
  String? month;
  String? reply;

  BookingModel(
      {this.createdAt,
      this.day,
      this.hour,
      this.doctorName,
      this.userName,
      this.members,
      this.id,
      this.month,
      this.reply});
  factory BookingModel.fromjson(dynamic data) {
    return BookingModel(
      createdAt: data['created_at'],
      day: data['day'],
      hour: data['hour'],
      doctorName: data['doctor_name'],
      userName: data['user_name'],
      members: data['members'],
      id: data['id'],
      month: data['month'],
      reply: data['reply'],
    );
  }
}
