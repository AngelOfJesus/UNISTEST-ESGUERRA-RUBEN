import 'package:flutter/material.dart';

import '../../services/api_service.dart';

class RegisterDialog extends StatefulWidget {

  const RegisterDialog({super.key});

  @override
  State<RegisterDialog> createState() =>
      _RegisterDialogState();
}

class _RegisterDialogState
    extends State<RegisterDialog> {

  final fullNameController =
      TextEditingController();

  final idController =
      TextEditingController();

  final emailController =
      TextEditingController();

  final careerController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {

    return Dialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),

      child: Container(

        width: 500,

        padding: const EdgeInsets.all(35),

        child: SingleChildScrollView(

          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              const Text(

                'Registro Estudiantil',

                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              input(
                fullNameController,
                'Nombre completo',
              ),

              const SizedBox(height: 18),

              input(
                idController,
                'Cédula',
              ),

              const SizedBox(height: 18),

              input(
                emailController,
                'Correo',
              ),

              const SizedBox(height: 18),

              input(
                careerController,
                'Carrera',
              ),

              const SizedBox(height: 18),

              input(
                passwordController,
                'Contraseña',
                obscure: true,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 56,

                child: ElevatedButton(

                  style:
                  ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xFF0F8B5F),
                  ),

                  onPressed: () async {

                    setState(() {
                      loading = true;
                    });

                    final response =
                    await ApiService.registerStudent(

                      fullName:
                      fullNameController.text,

                      nationalId:
                      idController.text,

                      email:
                      emailController.text,

                      career:
                      careerController.text,

                      password:
                      passwordController.text,
                    );

                    setState(() {
                      loading = false;
                    });

                    if (response['success'] == true) {

                      Navigator.pop(context);

                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(

                          backgroundColor:
                          Colors.green,

                          content: Text(
                            'Usuario registrado correctamente',
                          ),
                        ),
                      );

                    } else {

                      ScaffoldMessenger.of(context)
                          .showSnackBar(

                        const SnackBar(

                          backgroundColor:
                          Colors.red,

                          content: Text(
                            'Error al registrar',
                          ),
                        ),
                      );
                    }
                  },

                  child: loading

                      ? const CircularProgressIndicator(
                    color: Colors.white,
                  )

                      : const Text(

                    'Registrarse',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget input(

      TextEditingController controller,
      String hint, {

        bool obscure = false,

      }) {

    return TextField(

      controller: controller,

      obscureText: obscure,

      decoration: InputDecoration(

        hintText: hint,

        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(16),
        ),
      ),
    );
  }
}