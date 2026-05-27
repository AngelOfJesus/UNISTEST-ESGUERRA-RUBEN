import 'package:flutter/material.dart';

import '../student/student_dashboard.dart';
import '../admin/admin_dashboard.dart';
import 'register_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> fadeAnimation;

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  final Color primaryColor =
  const Color(0xFF06142E);

  final Color greenColor =
  const Color(0xFF0F8B5F);

  @override
  void initState() {

    super.initState();

    controller = AnimationController(

      vsync: this,

      duration: const Duration(
        milliseconds: 1200,
      ),
    );

    fadeAnimation = CurvedAnimation(

      parent: controller,

      curve: Curves.easeInOut,
    );

    controller.forward();
  }

  @override
  void dispose() {

    controller.dispose();

    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Row(
        children: [

          /// LEFT SIDE
          Expanded(
            flex: 6,

            child: Container(

              decoration: const BoxDecoration(

                gradient: LinearGradient(

                  colors: [

                    Color(0xFF06142E),

                    Color(0xFF0B2247),
                  ],

                  begin: Alignment.topLeft,

                  end: Alignment.bottomRight,
                ),
              ),

              child: Padding(

                padding: const EdgeInsets.all(60),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    const Spacer(),

                    FadeTransition(

                      opacity: fadeAnimation,

                      child: const Text(

                        'UniTest\nEnterprise',

                        style: TextStyle(

                          color: Colors.white,

                          fontSize: 62,

                          fontWeight: FontWeight.bold,

                          height: 1.1,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    FadeTransition(

                      opacity: fadeAnimation,

                      child: const SizedBox(

                        width: 500,

                        child: Text(

                          'Plataforma premium de evaluación universitaria para Ingeniería de Software.',

                          style: TextStyle(

                            color: Colors.white70,

                            fontSize: 20,

                            height: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    Row(
                      children: [

                        buildFeature(
                          Icons.security,
                          'Seguridad',
                        ),

                        const SizedBox(width: 20),

                        buildFeature(
                          Icons.analytics,
                          'Analytics',
                        ),

                        const SizedBox(width: 20),

                        buildFeature(
                          Icons.timer,
                          'Tiempo Real',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// RIGHT SIDE
          Expanded(
            flex: 5,

            child: Container(

              color: const Color(0xFFF4F7FB),

              child: Center(

                child: FadeTransition(

                  opacity: fadeAnimation,

                  child: Container(

                    width: 470,

                    padding: const EdgeInsets.all(45),

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius:
                      BorderRadius.circular(35),

                      boxShadow: [

                        BoxShadow(

                          color:
                          Colors.black.withOpacity(0.06),

                          blurRadius: 30,

                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),

                    child: Column(

                      mainAxisSize: MainAxisSize.min,

                      children: [

                        CircleAvatar(

                          radius: 42,

                          backgroundColor:
                          greenColor,

                          child: const Icon(

                            Icons.school,

                            color: Colors.white,

                            size: 42,
                          ),
                        ),

                        const SizedBox(height: 25),

                        const Text(

                          'Bienvenido',

                          style: TextStyle(

                            fontSize: 38,

                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(

                          'Ingresa a la plataforma institucional',

                          style: TextStyle(

                            color: Colors.grey.shade600,

                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Container(

                          width: double.infinity,

                          padding: const EdgeInsets.all(14),

                          decoration: BoxDecoration(

                            color: Colors.green.shade50,

                            borderRadius:
                            BorderRadius.circular(14),

                            border: Border.all(
                              color: Colors.green.shade200,
                            ),
                          ),

                          child: const Column(

                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(

                                'Cuenta de prueba:',

                                style: TextStyle(

                                  fontWeight: FontWeight.bold,

                                  color: Colors.green,
                                ),
                              ),

                              SizedBox(height: 6),

                              Text(
                                'Correo: parapruebas@gmail.com',
                              ),

                              Text(
                                'Contraseña: pruebas123',
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        buildInput(

                          controller:
                          emailController,

                          hint:
                          'Correo institucional',

                          icon:
                          Icons.email_outlined,
                        ),

                        const SizedBox(height: 22),

                        buildInput(

                          controller:
                          passwordController,

                          hint:
                          'Contraseña',

                          icon:
                          Icons.lock_outline,

                          obscure: true,
                        ),

                        const SizedBox(height: 35),

                        /// LOGIN BUTTON
                        SizedBox(

                          width: double.infinity,

                          height: 58,

                          child: ElevatedButton(

                            style:
                            ElevatedButton.styleFrom(

                              backgroundColor:
                              greenColor,

                              shape:
                              RoundedRectangleBorder(

                                borderRadius:
                                BorderRadius.circular(18),
                              ),
                            ),

                            onPressed: () {

                              final email =
                              emailController.text.trim();

                              final password =
                              passwordController.text.trim();

                              /// LOGIN DEMO
                              if (
                              email ==
                                  "parapruebas@gmail.com" &&

                                  password ==
                                      "pruebas123"
                              ) {

                                Navigator.push(

                                  context,

                                  MaterialPageRoute(
                                    builder: (_) =>
                                    const StudentDashboard(),
                                  ),
                                );

                              } else {

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(

                                  const SnackBar(

                                    backgroundColor: Colors.red,

                                    content: Text(
                                      'Credenciales incorrectas',
                                    ),
                                  ),
                                );
                              }
                            },

                            child: const Text(

                              'Ingresar',

                              style: TextStyle(

                                fontSize: 18,

                                color: Colors.white,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        /// REGISTER BUTTON
                        TextButton(

                          onPressed: () {

                            showDialog(

                              context: context,

                              builder: (_) =>
                              const RegisterDialog(),
                            );
                          },

                          child: const Text(
                            '¿No tienes cuenta? Regístrate',
                          ),
                        ),

                        const SizedBox(height: 18),

                        /// ADMIN BUTTON
                        SizedBox(

                          width: double.infinity,

                          height: 58,

                          child: OutlinedButton(

                            style:
                            OutlinedButton.styleFrom(

                              side: BorderSide(
                                color: primaryColor,
                              ),

                              shape:
                              RoundedRectangleBorder(

                                borderRadius:
                                BorderRadius.circular(18),
                              ),
                            ),

                            onPressed: () {

                              Navigator.push(

                                context,

                                MaterialPageRoute(
                                  builder: (_) =>
                                  const AdminDashboard(),
                                ),
                              );
                            },

                            child: Text(

                              'Administrador',

                              style: TextStyle(

                                color: primaryColor,

                                fontSize: 17,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        Text(

                          'UniTest Enterprise © 2025',

                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInput({

    required TextEditingController controller,

    required String hint,

    required IconData icon,

    bool obscure = false,

  }) {

    return TextField(

      controller: controller,

      obscureText: obscure,

      decoration: InputDecoration(

        hintText: hint,

        prefixIcon: Icon(icon),

        filled: true,

        fillColor: const Color(0xFFF4F7FB),

        border: OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(18),

          borderSide: BorderSide.none,
        ),

        contentPadding:
        const EdgeInsets.symmetric(
          vertical: 22,
        ),
      ),
    );
  }

  Widget buildFeature(
      IconData icon,
      String title,
      ) {

    return Container(

      padding: const EdgeInsets.symmetric(

        horizontal: 20,

        vertical: 14,
      ),

      decoration: BoxDecoration(

        color:
        Colors.white.withOpacity(0.08),

        borderRadius:
        BorderRadius.circular(18),
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color: Colors.white,
          ),

          const SizedBox(width: 10),

          Text(

            title,

            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}