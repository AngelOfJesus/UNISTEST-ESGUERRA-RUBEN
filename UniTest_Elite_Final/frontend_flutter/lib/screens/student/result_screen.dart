import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  final int score;
  final int total;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {

    const Color green = Color(0xFF0F8B5F);
    const Color darkBlue = Color(0xFF06142E);

    final percentage =
    ((score / total) * 100).round();

    final approved = percentage >= 70;

    return Scaffold(

      backgroundColor: const Color(0xFFF4F7FB),

      body: Center(

        child: SingleChildScrollView(

          child: Container(

            width: 850,

            margin: const EdgeInsets.all(40),

            padding: const EdgeInsets.all(50),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius:
              BorderRadius.circular(40),

              boxShadow: [
                BoxShadow(
                  color:
                  Colors.black.withOpacity(0.05),

                  blurRadius: 30,
                ),
              ],
            ),

            child: Column(
              children: [

                /// ICON
                Container(
                  width: 140,
                  height: 140,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    gradient: LinearGradient(
                      colors: approved
                          ? [
                        green,
                        const Color(0xFF18C37E),
                      ]
                          : [
                        Colors.red,
                        Colors.orange,
                      ],
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: approved
                            ? green.withOpacity(0.35)
                            : Colors.red.withOpacity(0.30),

                        blurRadius: 30,
                      ),
                    ],
                  ),

                  child: Icon(
                    approved
                        ? Icons.verified
                        : Icons.close,

                    color: Colors.white,
                    size: 70,
                  ),
                ),

                const SizedBox(height: 40),

                /// TITLE
                Text(
                  approved
                      ? '¡Evaluación Aprobada!'
                      : 'Evaluación Reprobada',

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,

                    color: approved
                        ? green
                        : Colors.red,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  approved
                      ? 'Excelente desempeño en la evaluación técnica.'
                      : 'Debes reforzar tus conocimientos y volver a intentarlo.',

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                    height: 1.7,
                  ),
                ),

                const SizedBox(height: 50),

                /// SCORE CARD
                Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(35),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F7FB),

                    borderRadius:
                    BorderRadius.circular(30),
                  ),

                  child: Row(
                    children: [

                      Expanded(
                        child: statCard(
                          'Puntaje',
                          '$score/$total',
                          Icons.quiz,
                          Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 25),

                      Expanded(
                        child: statCard(
                          'Porcentaje',
                          '$percentage%',
                          Icons.analytics,
                          approved
                              ? green
                              : Colors.red,
                        ),
                      ),

                      const SizedBox(width: 25),

                      Expanded(
                        child: statCard(
                          'Estado',
                          approved
                              ? 'Aprobado'
                              : 'Reprobado',

                          approved
                              ? Icons.check_circle
                              : Icons.cancel,

                          approved
                              ? green
                              : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 45),

                /// FEEDBACK
                Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(35),

                  decoration: BoxDecoration(
                    color: approved
                        ? green.withOpacity(0.08)
                        : Colors.red.withOpacity(0.08),

                    borderRadius:
                    BorderRadius.circular(30),
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Row(
                        children: [

                          Icon(
                            Icons.school,

                            color: approved
                                ? green
                                : Colors.red,

                            size: 30,
                          ),

                          const SizedBox(width: 12),

                          Text(
                            'Retroalimentación',

                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,

                              color: approved
                                  ? green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      feedbackItem(
                        approved
                            ? 'Demostraste sólidos conocimientos técnicos.'
                            : 'Debes reforzar conceptos de arquitectura y lógica.',
                      ),

                      feedbackItem(
                        approved
                            ? 'Tu desempeño estuvo por encima del promedio.'
                            : 'Tu resultado estuvo por debajo del mínimo requerido.',
                      ),

                      feedbackItem(
                        approved
                            ? 'El administrador podrá revisar tus resultados.'
                            : 'Consulta material de apoyo antes de una nueva evaluación.',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 45),

                /// BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 75,

                  child: ElevatedButton(

                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor: darkBlue,

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(24),
                      ),
                    ),

                    onPressed: () {

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/student-dashboard',
                            (route) => false,
                      );
                    },

                    child: const Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        Icon(
                          Icons.dashboard,
                          color: Colors.white,
                          size: 30,
                        ),

                        SizedBox(width: 14),

                        Text(
                          'Volver al Dashboard',

                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
        BorderRadius.circular(24),
      ),

      child: Column(
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
            value,

            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            title,

            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget feedbackItem(String text) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              text,

              style: const TextStyle(
                fontSize: 17,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}