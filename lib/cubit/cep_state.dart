import 'package:api_cep/models/cep.model.dart';

abstract class CepState {}

class InitialCepState extends CepState {}

class LoadingCepState extends CepState {}

class SuccessCepState extends CepState {
  final CepModel cepModel;
  SuccessCepState(this.cepModel);
}

class ErrorCepState extends CepState {
  final String message;
  ErrorCepState(this.message);
}
