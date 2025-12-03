import 'package:dio/dio.dart';
import 'package:api_cep/models/cep.model.dart';

class CepService {
  final Dio _dio = Dio();

  Future<CepModel> fetchCep(String cep) async {
    final cleanCep = cep.replaceAll(RegExp(r'[^0-9]'), '');

    final response = await _dio.get('https://viacep.com.br/ws/$cleanCep/json/');
    return CepModel.fromJson(response.data);
  }
}
