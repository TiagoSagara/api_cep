import 'package:api_cep/service/cep.service.dart';
import 'package:bloc/bloc.dart';
import 'cep_state.dart';

class CepCubit extends Cubit<CepState> {
  final CepService _service = CepService();

  CepCubit() : super(InitialCepState());

  Future<void> buscarCep(String cep) async {
    emit(LoadingCepState());
    try {
      final cepModel = await _service.fetchCep(cep);
      emit(SuccessCepState(cepModel));
    } catch (e) {
      emit(ErrorCepState("Erro ao buscar CEP: $e"));
    }
  }
}
