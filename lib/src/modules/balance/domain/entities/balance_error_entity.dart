import 'package:nubank_home_reproduction/src/shared/entities/user_message_entity.dart';

class BalanceErrorEntity {
  final bool success;
  final String code;
  final String errorId;
  final int errorCode;
  final String detail;
  final UserMessageEntity userMessage;

  BalanceErrorEntity({
    required this.success,
    required this.code,
    required this.errorId,
    required this.errorCode,
    required this.detail,
    required this.userMessage,
  });
}
