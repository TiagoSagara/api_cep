import 'package:api_cep/cubit/cep_cubit.dart';
import 'package:api_cep/pages/mostrar_cep/demonstrativo_cep.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PesquisaCepPage extends StatefulWidget {
  const PesquisaCepPage({super.key});

  @override
  State<PesquisaCepPage> createState() => _PesquisaCepPageState();
}

class _PesquisaCepPageState extends State<PesquisaCepPage> {
  late final CepCubit cepCubit;
  final TextEditingController _cepController = TextEditingController();
  final MaskTextInputFormatter _cepFormatado = MaskTextInputFormatter(
    mask: '##.###-###',
  );

  @override
  void initState() {
    super.initState();
    cepCubit = BlocProvider.of<CepCubit>(context);
  }

  @override
  void dispose() {
    _cepController.dispose();
    super.dispose();
  }

  void _handleSearch() {
    final cepSemMascara = _cepFormatado.getUnmaskedText();
    cepCubit.buscarCep(cepSemMascara);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DemonstrativoCep()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 250,
          constraints: const BoxConstraints(maxWidth: 450),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 50),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Insira o seu CEP aqui:',
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: _cepController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  inputFormatters: <TextInputFormatter>[_cepFormatado],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: _handleSearch,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.infinity, 40),
                    textStyle: const TextStyle(color: Colors.blueGrey),
                  ),
                  child: const Text('Pesquisar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
