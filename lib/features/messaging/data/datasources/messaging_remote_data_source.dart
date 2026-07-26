import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/shared/models/base_result.dart';
import '../models/chat.dart';
import '../models/chat_file.dart';

part 'messaging_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class MessagingRemoteDataSource {
  @factoryMethod
  factory MessagingRemoteDataSource(Dio dio) = _MessagingRemoteDataSource;

  // --- CANDIDATE ENDPOINTS ---

  @GET('/mobile/candidate/chat')
  Future<BaseResult<List<Chat>>> getCandidateChats();

  @GET('/mobile/candidate/chat/{id}')
  Future<BaseResult<Chat>> getCandidateChatDetail(@Path('id') String id);

  @POST('/mobile/candidate/chat/{id}/message')
  Future<BaseResult<dynamic>> sendCandidateMessage(
    @Path('id') String id,
    @Body()
    Map<String, dynamic> body, // e.g. {"content": "Hello", "type": "text"}
  );

  @PUT('/mobile/candidate/chat/{id}/message/{msg_id}')
  Future<BaseResult<dynamic>> updateCandidateMessage(
    @Path('id') String id,
    @Path('msg_id') String msgId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/mobile/candidate/chat/{id}/message/{msg_id}')
  Future<BaseResult<dynamic>> deleteCandidateMessage(
    @Path('id') String id,
    @Path('msg_id') String msgId,
  );

  @POST('/mobile/candidate/chat/{id}/message/file')
  @MultiPart()
  Future<BaseResult<List<ChatFile>>> uploadCandidateChatFile(
    @Path('id') String id,
    @Part(name: 'file') File file,
  );

  @GET('/mobile/candidate/chat/{id}/read-messages')
  Future<BaseResult<dynamic>> readCandidateChat(@Path('id') String id);

  // --- EMPLOYER ENDPOINTS ---

  @GET('/mobile/employer/chat')
  Future<BaseResult<List<Chat>>> getEmployerChats();

  @GET('/mobile/employer/chat/{id}')
  Future<BaseResult<Chat>> getEmployerChatDetail(@Path('id') String id);

  @POST('/mobile/employer/chat/{id}/message')
  Future<BaseResult<dynamic>> sendEmployerMessage(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/mobile/employer/chat/{id}/message/{msg_id}')
  Future<BaseResult<dynamic>> updateEmployerMessage(
    @Path('id') String id,
    @Path('msg_id') String msgId,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/mobile/employer/chat/{id}/message/{msg_id}')
  Future<BaseResult<dynamic>> deleteEmployerMessage(
    @Path('id') String id,
    @Path('msg_id') String msgId,
  );

  @POST('/mobile/employer/chat/{id}/message/file')
  @MultiPart()
  Future<BaseResult<List<ChatFile>>> uploadEmployerChatFile(
    @Path('id') String id,
    @Part(name: 'file') File file,
  );

  @GET('/mobile/employer/chat/{id}/read-messages')
  Future<BaseResult<dynamic>> readEmployerChat(@Path('id') String id);
}
