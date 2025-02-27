import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String error;

  const Failure({required this.error});
}

class FailureError extends Failure {

const  FailureError({
  required  super.error,
  });

  @override
  List<Object?> get props => [
    error,
  ];
}
