import 'package:equatable/equatable.dart';

abstract class Success extends Equatable {}

class SuccessfulResponse extends Success {
  @override
  List<Object?> get props => [];
}
