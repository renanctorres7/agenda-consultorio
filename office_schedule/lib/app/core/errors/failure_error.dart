import 'package:equatable/equatable.dart';

import '../debug_print_color/debug_print_color.dart';

abstract class FailureError extends Equatable {}

class DomainError extends FailureError {
  @override
  List<Object?> get props => [];

  DomainError([String? error]) {
    debugPrintError('CacheError -  ${error ?? ''}');
  }
}

class NullError extends FailureError {
  @override
  List<Object?> get props => [];

  NullError([String? error]) {
    debugPrintError('NullError -  ${error ?? ''}');
  }
}

class DataSourceError extends FailureError {
  @override
  List<Object?> get props => [];

  DataSourceError([String? error]) {
    debugPrintError('DataSourceError - $error');
  }
}

class ServiceError extends FailureError {
  @override
  List<Object?> get props => [];

  ServiceError([String? error, int? statusCode]) {
    debugPrintError(
        'ServerError - erro: ${error ?? ''} statusCode: ${statusCode ?? ''}');
  }
}
