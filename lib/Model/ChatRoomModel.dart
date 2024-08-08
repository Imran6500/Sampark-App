class ChatRoomModel {
  String? id;
  Receiver? sender;
  Receiver? receiver;
  List<dynamic>? messages;
  int? unReadMessNo;
  String? lastMessage;
  String? lastMessageTimestamp;
  String? timestamp;

  ChatRoomModel(
      {this.id,
      this.sender,
      this.receiver,
      this.messages,
      this.unReadMessNo,
      this.lastMessage,
      this.lastMessageTimestamp,
      this.timestamp});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] is String) {
      id = json['id'];
    }
    if (json['sender'] is Map) {
      sender = json['sender'];
    }
    if (json['receiver'] is Map) {
      receiver = json['receiver'];
    }
    if (json['unReadMessNo'] is int) {
      unReadMessNo = json['unReadMessNo'];
    }
    if (json['lastMessage'] is String) {
      lastMessage = json['lastMessage'];
    }
    if (json['lastMessageTimestamp'] is String) {
      lastMessageTimestamp = json['lastMessageTimestamp'];
    }
    if (json['timestamp'] is String) {
      timestamp = json['timestamp'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (sender != null) {
      data['sender'] = sender?.toJson();
    }
    if (receiver != null) {
      data['receiver'] = receiver?.toJson();
    }
    if (messages != null) {
      data['messages'] = messages;
    }
    data['unReadMessNo'] = unReadMessNo;
    data['lastMessage'] = lastMessage;
    data['lastMessageTimestamp'] = lastMessageTimestamp;
    data['timestamp'] = timestamp;
    return data;
  }
}

class Sender {
  Sender();

  Sender.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class Receiver {
  Receiver();

  Receiver.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
