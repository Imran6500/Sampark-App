class ChatModel {
  String? id;
  String? message;
  String? senderName;
  String? senderId;
  String? receiverId;
  String? timestamp;
  String? readStatus;
  String? imageUrl;
  String? videoUrl;
  String? audioUrl;
  String? documentUrl;
  List<String>? reastions;
  List<dynamic>? replies;

  ChatModel(
      {this.id,
      this.message,
      this.senderName,
      this.senderId,
      this.receiverId,
      this.timestamp,
      this.readStatus,
      this.imageUrl,
      this.videoUrl,
      this.audioUrl,
      this.documentUrl,
      this.reastions,
      this.replies});

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    senderName = json['senderName'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    timestamp = json['timestamp'];
    readStatus = json['readStatus'];
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
    audioUrl = json['audioUrl'];
    documentUrl = json['documentUrl'];
    if (json["reactions"] is List) {
      reastions = json['reastions'] == null
          ? null
          : List<String>.from(json["reactions"]);
    }

    if (json["replies"] is List) {
      replies = json['replies'] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['senderName'] = senderName;
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    data['timestamp'] = timestamp;
    data['readStatus'] = readStatus;
    data['imageUrl'] = imageUrl;
    data['videoUrl'] = videoUrl;
    data['audioUrl'] = audioUrl;
    data['documentUrl'] = documentUrl;
    if (reastions != null) {
      data['reastions'] = reastions;
    }
    if (replies != null) {
      data['replies'] = replies;
    }
    return data;
  }
}
