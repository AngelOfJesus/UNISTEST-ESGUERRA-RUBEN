import 'package:flutter/material.dart';
import '../exam/exam_screen.dart';

class ExamIntroScreen extends StatelessWidget {
  const ExamIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {

    const Color darkBlue = Color(0xFF06142E);
    const Color green = Color(0xFF0F8B5F);

    return Scaffold(

      backgroundColor: const Color(0xFFF4F7FB),

      body: SingleChildScrollView(

        child: Center(

          child: Padding(
            padding: const EdgeInsets.all(40),

            child: Container(

              constraints: const BoxConstraints(
                maxWidth: 950,
              ),

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
                    offset: const Offset(0, 10),
                  ),
                ],
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [

                  /// ICON
                  Container(
                    width: 120,
                    height: 120,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      gradient: LinearGradient(
                        colors: [
                          green.withOpacity(0.9),
                          const Color(0xFF12B879),
                        ],
                      ),

                      boxShadow: [
                        BoxShadow(
                          color:
                          green.withOpacity(0.35),

                          blurRadius: 25,
                        ),
                      ],
                    ),

                    child: const Icon(
                      Icons.psychology_alt,
                      size: 55,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// TITLE
                  const Text(
                    'Evaluación de Ingeniería de Software',

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: darkBlue,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    'La siguiente evaluación analizará tus habilidades '
                    'en arquitectura de software, bases de datos, '
                    'desarrollo web, algoritmos y estructuras de datos.',

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade700,
                      height: 1.8,
                    ),
                  ),

                  const SizedBox(height: 50),

                  /// CARDS
                  Row(
                    children: [

                      Expanded(
                        child: infoCard(
                          Icons.timer,
                          '60 Minutos',
                          'Tiempo límite',
                          Colors.orange,
                        ),
                      ),

                      const SizedBox(width: 24),

                      Expanded(
                        child: infoCard(
                          Icons.quiz,
                          '40 Preguntas',
                          'Nivel avanzado',
                          Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 24),

                      Expanded(
                        child: infoCard(
                          Icons.workspace_premium,
                          'Profesional',
                          'Evaluación técnica',
                          Colors.green,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),

                  /// INSTRUCTIONS
                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.all(35),

                    decoration: BoxDecoration(
                      color: const Color(0xFFF4F7FB),

                      borderRadius:
                      BorderRadius.circular(30),
                    ),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        const Row(
                          children: [

                            Icon(
                              Icons.rule,
                              color: green,
                              size: 30,
                            ),

                            SizedBox(width: 12),

                            Text(
                              'Instrucciones',

                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: darkBlue,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        instruction(
                          'Lee cuidadosamente cada pregunta antes de responder.',
                        ),

                        instruction(
                          'Solo podrás enviar el examen una vez.',
                        ),

                        instruction(
                          'El temporizador comenzará automáticamente.',
                        ),

                        instruction(
                          'Necesitas mínimo 70% para aprobar.',
                        ),

                        instruction(
                          'No cierres el navegador durante la evaluación.',
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
                        backgroundColor: green,

                        elevation: 0,

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
                            const ExamScreen(),
                          ),
                        );
                      },

                      child: const Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          Icon(
                            Icons.play_arrow_rounded,
                            size: 34,
                            color: Colors.white,
                          ),

                          SizedBox(width: 12),

                          Text(
                            'Iniciar Evaluación',

                            style: TextStyle(
                              fontSize: 24,
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
      ),
    );
  }

  Widget infoCard(
      IconData icon,
      String title,
      String subtitle,
      Color color,
      ) {

    return Container(
      padding: const EdgeInsets.all(28),

      decoration: BoxDecoration(
        color: const Color(0xFFF4F7FB),

        borderRadius:
        BorderRadius.circular(28),
      ),

      child: Column(
        children: [

          CircleAvatar(
            radius: 28,

            backgroundColor:
            color.withOpacity(0.12),

            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            title,

            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            subtitle,

            textAlign: TextAlign.center,

            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget instruction(String text) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Container(
            margin: const EdgeInsets.only(top: 2),

            child: const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 24,
            ),
          ),

          const SizedBox(width: 14),

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