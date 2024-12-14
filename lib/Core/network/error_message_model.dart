import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusmessage;
  final bool success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusmessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['status_code'],
      statusmessage: json['status_message'],
      success: json['success'],
    );
  }

  @override
  List<Object> get props => [statusCode, statusmessage, success];

}