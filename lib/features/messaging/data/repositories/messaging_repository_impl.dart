import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/extensions/repository_extension.dart';
import '../../domain/repositories/messaging_repository.dart';
import '../datasources/messaging_remote_data_source.dart';
import '../models/chat.dart';
import '../models/chat_file.dart';

@LazySingleton(as: MessagingRepository)
class MessagingRepositoryImpl implements MessagingRepository {
  final MessagingRemoteDataSource remoteDataSource;

  MessagingRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Chat>>> getChats({required bool isEmployer}) {
    if (isEmployer) {
      return remoteDataSource.getEmployerChats().asEither();
    } else {
      return remoteDataSource.getCandidateChats().asEither();
    }
  }

  @override
  Future<Either<Failure, Chat>> getChatDetail(String id, {required bool isEmployer}) {
    if (isEmployer) {
      return remoteDataSource.getEmployerChatDetail(id).asEither();
    } else {
      return remoteDataSource.getCandidateChatDetail(id).asEither();
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage(
    String id,
    Map<String, dynamic> body, {
    required bool isEmployer,
  }) {
    if (isEmployer) {
      return remoteDataSource.sendEmployerMessage(id, body).asEither();
    } else {
      return remoteDataSource.sendCandidateMessage(id, body).asEither();
    }
  }

  @override
  Future<Either<Failure, void>> updateMessage(
    String id,
    String msgId,
    Map<String, dynamic> body, {
    required bool isEmployer,
  }) {
    if (isEmployer) {
      return remoteDataSource.updateEmployerMessage(id, msgId, body).asEither();
    } else {
      return remoteDataSource.updateCandidateMessage(id, msgId, body).asEither();
    }
  }

  @override
  Future<Either<Failure, void>> deleteMessage(
    String id,
    String msgId, {
    required bool isEmployer,
  }) {
    if (isEmployer) {
      return remoteDataSource.deleteEmployerMessage(id, msgId).asEither();
    } else {
      return remoteDataSource.deleteCandidateMessage(id, msgId).asEither();
    }
  }

  @override
  Future<Either<Failure, List<ChatFile>>> uploadChatFile(
    String id,
    File file, {
    required bool isEmployer,
  }) {
    if (isEmployer) {
      return remoteDataSource.uploadEmployerChatFile(id, file).asEither();
    } else {
      return remoteDataSource.uploadCandidateChatFile(id, file).asEither();
    }
  }

  @override
  Future<Either<Failure, void>> readChat(String id, {required bool isEmployer}) {
    if (isEmployer) {
      return remoteDataSource.readEmployerChat(id).asEither();
    } else {
      return remoteDataSource.readCandidateChat(id).asEither();
    }
  }
}
