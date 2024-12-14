import '../network/error_message_model.dart';

class ServerException implements Exception {

   late final ErrorMessageModel errorMessageModel;

    ServerException({required this.errorMessageModel});



}