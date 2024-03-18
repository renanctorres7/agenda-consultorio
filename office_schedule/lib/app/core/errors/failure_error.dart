import 'package:equatable/equatable.dart';

import '../debug_print_color/debug_print_color.dart';

abstract class FailureError extends Equatable {
  final String? message;

  const FailureError(this.message);
}

class DomainError extends FailureError {
  @override
  List<Object?> get props => [
        message,
      ];

  DomainError(super.message) {
    debugPrintError('CacheError -  ${message ?? ''}');
  }
}

class NullError extends FailureError {
  @override
  List<Object?> get props => [
        message,
      ];

  NullError([super.message]) {
    debugPrintError('NullError -  ${message ?? ''}');
  }
}

class DataSourceError extends FailureError {
  @override
  List<Object?> get props => [
        message,
      ];

  DataSourceError([super.message]) {
    debugPrintError('DataSourceError - $message');
  }
}

class ServiceError extends FailureError {
  @override
  List<Object?> get props => [
        message,
      ];

  ServiceError(super.message, int? statusCode) {
    debugPrintError(
        'ServerError - erro: ${message ?? ''} statusCode: ${statusCode ?? ''}');
  }
}
