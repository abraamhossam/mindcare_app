class RoomModel {
  String? id;
  String? lastMessageTime;
  List? members;
  String? from;
  String? to;
  String? toType;
  String? fromType;
  String? read;
  String? report;
  String? block;
  RoomModel({
    this.id,
    this.lastMessageTime,
    this.members,
    this.from,
    this.to,
    this.fromType,
    this.toType,
    this.read,
    this.report,
    this.block,
  });
  factory RoomModel.fromjson(dynamic jsonData) {
    return RoomModel(
      id: jsonData['id'],
      lastMessageTime: jsonData['last_message_time'],
      members: jsonData['members'],
      from: jsonData['from'],
      to: jsonData['to'],
      fromType: jsonData['type_from'],
      toType: jsonData['type_to'],
      read: jsonData['read'],
      report: jsonData['report'],
      block: jsonData['block'],
    );
  }
}
