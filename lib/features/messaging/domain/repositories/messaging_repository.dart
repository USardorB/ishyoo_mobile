import 'dart:io';
import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/failures.dart';
import '../../data/models/chat.dart';
import '../../data/models/chat_file.dart';

abstract class MessagingRepository {
  Future<Either<Failure, List<Chat>>> getChats({required bool isEmployer});
  
  Future<Either<Failure, Chat>> getChatDetail(String id, {required bool isEmployer});
  
  Future<Either<Failure, void>> sendMessage(
    String id,
    Map<String, dynamic> body, {
    required bool isEmployer,
  });
  
  Future<Either<Failure, void>> updateMessage(
    String id,
    String msgId,
    Map<String, dynamic> body, {
    required bool isEmployer,
  });
  
  Future<Either<Failure, void>> deleteMessage(
    String id,
    String msgId, {
    required bool isEmployer,
  });
  
  Future<Either<Failure, List<ChatFile>>> uploadChatFile(
    String id,
    File file, {
    required bool isEmployer,
  });
  
  Future<Either<Failure, void>> readChat(
    String id, {
    required bool isEmployer,
  });
}
