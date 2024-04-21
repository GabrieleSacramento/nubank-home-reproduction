import '../../../../shared/entities/user_message_entity.dart';

class DiscoverMoreErrorEntity {
  final bool success;
  final String code;
  final String errorId;
  final int errorCode;
  final String detail;
  final UserMessageEntity userMessage;

  DiscoverMoreErrorEntity({
    required this.success,
    required this.code,
    required this.errorId,
    required this.errorCode,
    required this.detail,
    required this.userMessage,
  });

  @override
  bool operator ==(covariant DiscoverMoreErrorEntity other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.code == code &&
        other.errorId == errorId &&
        other.errorCode == errorCode &&
        other.detail == detail &&
        other.userMessage == userMessage;
  }

  @override
  int get hashCode {
    return success.hashCode ^
        code.hashCode ^
        errorId.hashCode ^
        errorCode.hashCode ^
        detail.hashCode ^
        userMessage.hashCode;
  }
}
