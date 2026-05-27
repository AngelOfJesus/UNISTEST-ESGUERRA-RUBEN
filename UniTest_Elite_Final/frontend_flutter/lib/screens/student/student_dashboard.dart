import 'package:flutter/material.dart';

import 'exam_intro_screen.dart';

class StudentDashboard extends StatelessWidget {

  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {

    const Color darkBlue = Color(0xFF06142E);
    const Color green = Color(0xFF0F8B5F);

    return Scaffold(

      backgroundColor: const Color(0xFFF4F7FB),

      body: Row(
        children: [

          /// SIDEBAR
          Container(
            width: 260,

            decoration: const BoxDecoration(
              color: darkBlue,
            ),

            child: Padding(
              padding: const EdgeInsets.all(26),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  const SizedBox(height: 30),

                  const Row(
                    children: [

                      CircleAvatar(
                        radius: 24,
                        backgroundColor: green,

                        child: Icon(
                          Icons.school,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(width: 16),

                      Text(
                        'UniTest',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  menuItem(
                    Icons.dashboard,
                    'Dashboard',
                    true,
                  ),

                  menuItem(
                    Icons.quiz,
                    'Evaluaciones',
                    false,
                  ),

                  menuItem(
                    Icons.analytics,
                    'Resultados',
                    false,
                  ),

                  menuItem(
                    Icons.person,
                    'Perfil',
                    false,
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color:
                      Colors.white.withOpacity(0.08),

                      borderRadius:
                      BorderRadius.circular(24),
                    ),

                    child: const Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          'Estado Académico',

                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          'Activo',

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(

              padding: const EdgeInsets.all(40),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  /// HEADER
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                    children: [

                      const Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          Text(
                            'Dashboard Estudiantil',

                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: darkBlue,
                            ),
                          ),

                          SizedBox(height: 10),

                          Text(
                            'Bienvenido a la plataforma académica',

                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        padding: const EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                          BorderRadius.circular(20),
                        ),

                        child: const Icon(
                          Icons.notifications,
                          size: 30,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  /// STATS
                  Row(
                    children: [

                      Expanded(
                        child: statCard(
                          'Evaluaciones',
                          '40',
                          Icons.quiz,
                          Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 24),

                      Expanded(
                        child: statCard(
                          'Tiempo',
                          '60 min',
                          Icons.timer,
                          Colors.orange,
                        ),
                      ),

                      const SizedBox(width: 24),

                      Expanded(
                        child: statCard(
                          'Nivel',
                          'Profesional',
                          Icons.workspace_premium,
                          Colors.green,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  /// MAIN CARD
                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.all(40),

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          darkBlue,
                          Color(0xFF0B2447),
                        ],
                      ),

                      borderRadius:
                      BorderRadius.circular(36),
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        const Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                          children: [

                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,

                              children: [

                                Text(
                                  'Ingeniería de Software',

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 34,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: 14),

                                Text(
                                  'Evaluación técnica profesional',

                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),

                            CircleAvatar(
                              radius: 38,
                              backgroundColor:
                              Colors.white24,

                              child: Icon(
                                Icons.computer,
                                size: 42,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 45),

                        const Text(
                          'Progreso del examen',

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),

                        const SizedBox(height: 14),

                        ClipRRect(
                          borderRadius:
                          BorderRadius.circular(20),

                          child: const LinearProgressIndicator(
                            value: 0.0,
                            minHeight: 14,

                            backgroundColor:
                            Colors.white24,

                            valueColor:
                            AlwaysStoppedAnimation(
                              green,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'No has iniciado la evaluación.',

                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 45),

                        SizedBox(
                          height: 72,

                          child: ElevatedButton(

                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor: green,

                              padding:
                              const EdgeInsets.symmetric(
                                horizontal: 40,
                              ),

                              shape:
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(24),
                              ),
                            ),

                            onPressed: () {

                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (_) =>
                                  const ExamIntroScreen(),
                                ),
                              );
                            },

                            child: const Row(
                              mainAxisSize:
                              MainAxisSize.min,

                              children: [

                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30,
                                ),

                                SizedBox(width: 12),

                                Text(
                                  'Comenzar Evaluación',

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// INFO
                  Row(
                    children: [

                      Expanded(
                        child: infoBox(
                          'Arquitectura',
                          'Microservicios, APIs, patrones de diseño.',
                          Icons.architecture,
                          Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 24),

                      Expanded(
                        child: infoBox(
                          'Bases de Datos',
                          'MySQL, normalización y consultas SQL.',
                          Icons.storage,
                          Colors.orange,
                        ),
                      ),

                      const SizedBox(width: 24),

                      Expanded(
                        child: infoBox(
                          'Backend',
                          'Django, APIs REST y autenticación.',
                          Icons.code,
                          Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(
      IconData icon,
      String title,
      bool active,
      ) {

    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),

      decoration: BoxDecoration(
        color: active
            ? const Color(0xFF0F8B5F)
            : Colors.transparent,

        borderRadius:
        BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color: Colors.white,
          ),

          const SizedBox(width: 14),

          Text(
            title,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget statCard(
      String title,
      String value,
      IconData icon,
      Color color,
      ) {

    return Container(
      padding: const EdgeInsets.all(28),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(30),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          CircleAvatar(
            radius: 24,

            backgroundColor:
            color.withOpacity(0.12),

            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(height: 22),

          Text(
            value,

            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            title,

            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget infoBox(
      String title,
      String text,
      IconData icon,
      Color color,
      ) {

    return Container(
      padding: const EdgeInsets.all(28),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(28),
      ),

      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          CircleAvatar(
            radius: 24,

            backgroundColor:
            color.withOpacity(0.12),

            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            title,

            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 14),

          Text(
            text,

            style: TextStyle(
              color: Colors.grey.shade700,
              height: 1.7,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}