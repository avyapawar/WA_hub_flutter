class ConversationResponse {
  final int statusCode;
  final String message;
  final ConversationData data;

  ConversationResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ConversationResponse.fromJson(Map<String, dynamic> json) {
    return ConversationResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      data: ConversationData.fromJson(json['data']),
    );
  }
}

class ConversationData {
  final List<Conversation> paginatedData;
  final int totalPages;
  final int totalCount;

  ConversationData({
    required this.paginatedData,
    required this.totalPages,
    required this.totalCount,
  });

  factory ConversationData.fromJson(Map<String, dynamic> json) {
    final List<dynamic> paginatedDataJson = json['paginatedData'];
    final List<Conversation> paginatedData =
        paginatedDataJson.map((e) => Conversation.fromJson(e)).toList();

    return ConversationData(
      paginatedData: paginatedData,
      totalPages: json['totalPages'],
      totalCount: json['totalCount'],
    );
  }
}

class Conversation {
  final String id;
  final String phoneNumber;
  final String businessPhoneId;
  final Profile profile;
  final int unreadCount;
  final List<String> tags;
  final String userId;
  final String tenantId;
  final String status;
  final int lastReadTimestamp;
  final int createdTimestamp;
  final int updatedTimestamp;

  Conversation({
    required this.id,
    required this.phoneNumber,
    required this.businessPhoneId,
    required this.profile,
    required this.unreadCount,
    required this.tags,
    required this.userId,
    required this.tenantId,
    required this.status,
    required this.lastReadTimestamp,
    required this.createdTimestamp,
    required this.updatedTimestamp,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['_id'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      businessPhoneId: json['business_phone_id'] ?? '',
      profile: Profile.fromJson(json['profile']),
      unreadCount: json['unread_count'] ?? '',
      tags: List<String>.from(json['tags']),
      userId: json['user_id'] ?? '',
      tenantId: json['tenant_id'] ?? '',
      status: json['status'] ?? '',
      lastReadTimestamp: json['last_read_timestamp'] ?? '',
      createdTimestamp: json['created_timestamp'] ?? '',
      updatedTimestamp: json['updated_timestamp'] ?? '',
    );
  }
}

class Profile {
  final String name;
  final String email;
  final String color;

  Profile({
    required this.name,
    required this.email,
    required this.color,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'] ?? '',
      email: json['email']?? '',
      color: json['color'] ?? '',
    );
  }
}