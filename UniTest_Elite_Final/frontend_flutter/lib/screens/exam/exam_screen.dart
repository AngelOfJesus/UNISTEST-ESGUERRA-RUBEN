import 'dart:async';
import 'package:flutter/material.dart';
import '../student/result_screen.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  int currentQuestion = 0;

  int timeLeft = 3600;

  Timer? timer;

  Map<int, String> selectedAnswers = {};

  final List<Map<String, dynamic>> questions = [
    // ==========================================
    // 1. PRUEBAS PSICOLÓGICAS (Preguntas 1 - 3)
    // ==========================================
    {
      'category': 'Pruebas Psicológicas',
      'question':
          'Durante la entrega final de un proyecto grupal, un integrante informa a última hora que no completó su parte. ¿Cuál es la respuesta psicológicamente más adaptativa y asertiva?',
      'image': 'https://images.unsplash.com/photo-1522071820081-009f0129c71c',
      'options': [
        'Reorganizar de inmediato las tareas prioritarias con el equipo y establecer acuerdos claros sin atacar personalmente al compañero',
        'Excluir al compañero sin dialogar y asumir todo el trabajo restante en silencio',
        'Suspender la entrega del proyecto hasta que el compañero resuelva su parte solo',
        'Exponer el conflicto de forma agresiva antes de buscar una solución práctica'
      ],
      'correctAnswer':
          'Reorganizar de inmediato las tareas prioritarias con el equipo y establecer acuerdos claros sin atacar personalmente al compañero',
    },
    {
      'category': 'Pruebas Psicológicas',
      'question':
          'Si obtienes una calificación inferior a la esperada en una prueba diagnóstica universitaria, ¿qué pensamiento refleja un locus de control interno saludable?',
      'image': 'https://images.unsplash.com/photo-1557672186-269926e526c1',
      'options': [
        'Identificar qué temas específicos fallaron y ajustar mi método de estudio para la siguiente evaluación',
        'Asumir que las pruebas están diseñadas para reprobar y que el esfuerzo propio no influye',
        'Abandonar la asignatura de inmediato pensando que no tengo aptitud para el estudio',
        'Atribuir el resultado únicamente a la mala suerte sin revisar la retroalimentación'
      ],
      'correctAnswer':
          'Identificar qué temas específicos fallaron y ajustar mi método de estudio para la siguiente evaluación',
    },
    {
      'category': 'Pruebas Psicológicas',
      'question':
          'Cuando te enfrentas a un problema académico complejo cuya solución no aparece en el primer intento, ¿qué conducta demuestra alta tolerancia a la frustración?',
      'image': 'https://images.unsplash.com/photo-1533073526757-2c8ca1df9f1c',
      'options': [
        'Dividir el problema en partes más pequeñas, analizar qué falló y probar una hipótesis alternativa',
        'Repetir exactamente el mismo procedimiento fallido esperando un resultado distinto',
        'Renunciar a la tarea en los primeros minutos por considerarla imposible',
        'Culpar a las herramientas de trabajo sin revisar el planteamiento inicial'
      ],
      'correctAnswer':
          'Dividir el problema en partes más pequeñas, analizar qué falló y probar una hipótesis alternativa',
    },

    // ==========================================
    // 2. PSICOANALÍTICA (Preguntas 4 - 6)
    // ==========================================
    {
      'category': 'Psicoanalítica',
      'question':
          'Desde la perspectiva psicoanalítica de los mecanismos de defensa del Yo, ¿cuál de las siguientes situaciones ejemplifica el mecanismo maduro de la sublimación?',
      'image': 'https://images.unsplash.com/photo-1620802421041-cfb402036374',
      'options': [
        'Canalizar un estado de alta tensión emocional hacia la investigación científica, el arte o el estudio disciplinado',
        'Atribuir a los compañeros de clase los propios sentimientos de inseguridad (proyección)',
        'Negar que existe un examen programado para la semana siguiente (negación)',
        'Adoptar conductas infantiles cuando una tarea resulta exigente (regresión)'
      ],
      'correctAnswer':
          'Canalizar un estado de alta tensión emocional hacia la investigación científica, el arte o el estudio disciplinado',
    },
    {
      'category': 'Psicoanalítica',
      'question':
          'En el modelo estructural del aparato psíquico (Ello, Yo y Superyó), ¿qué función cumple el Yo (principio de realidad) frente a una decisión académica exigente?',
      'image': 'https://images.unsplash.com/photo-1557672186-269926e526c1',
      'options': [
        'Mediar de forma consciente y realista entre los impulsos inmediatos y las normas éticas para tomar una decisión responsable',
        'Buscar únicamente la gratificación instantánea evitando cualquier esfuerzo intelectual',
        'Generar culpa paralizante ante cualquier error mínimo sin permitir el aprendizaje',
        'Suprimir toda reflexión consciente y actuar por impulso automático'
      ],
      'correctAnswer':
          'Mediar de forma consciente y realista entre los impulsos inmediatos y las normas éticas para tomar una decisión responsable',
    },
    {
      'category': 'Psicoanalítica',
      'question':
          'En una prueba proyectiva e introspectiva, ¿qué actitud evidencia madurez reflexiva e integración perceptual al analizar una situación ambigua?',
      'image': 'https://images.unsplash.com/photo-1620802421041-cfb402036374',
      'options': [
        'Integrar el contexto global con los detalles específicos, reconociendo emociones propias antes de emitir un juicio',
        'Bloquearse por completo y negarse a analizar la situación por temor al error',
        'Fijarse únicamente en un detalle aislado ignorando por completo el contexto general',
        'Imponer una interpretación rígida sin escuchar otras perspectivas posibles'
      ],
      'correctAnswer':
          'Integrar el contexto global con los detalles específicos, reconociendo emociones propias antes de emitir un juicio',
    },

    // ==========================================
    // 3. PSICOTÉCNICAS (Preguntas 7 - 10)
    // ==========================================
    {
      'category': 'Psicotécnicas',
      'question':
          'Analiza la siguiente sucesión numérica y determina qué número continúa el patrón lógico: 3, 7, 15, 31, 63, ¿?',
      'image': 'https://images.unsplash.com/photo-1648912024151-7bdb206b0547',
      'options': ['127', '95', '125', '128'],
      'correctAnswer': '127',
    },
    {
      'category': 'Psicotécnicas',
      'question':
          'Una flecha apunta hacia el Norte (↑) en el Paso 1. Si gira 90° en sentido horario en cada paso (Paso 2 = Este →, Paso 3 = Sur ↓), ¿en qué dirección apuntará en el Paso 6?',
      'image': 'https://images.unsplash.com/photo-1533073526757-2c8ca1df9f1c',
      'options': ['Este (→)', 'Oeste (←)', 'Norte (↑)', 'Sur (↓)'],
      'correctAnswer': 'Este (→)',
    },
    {
      'category': 'Psicotécnicas',
      'question':
          'Completa la siguiente analogía verbal identificando la relación lógica: ALGORITMO es a PROBLEMA como DIAGNÓSTICO es a:',
      'image': 'https://images.unsplash.com/photo-1648912024151-7bdb206b0547',
      'options': [
        'Enfermedad o condición clínica',
        'Hospital',
        'Medicamento',
        'Ambulancia'
      ],
      'correctAnswer': 'Enfermedad o condición clínica',
    },
    {
      'category': 'Psicotécnicas',
      'question':
          'Premisa 1: Todos los estudiantes de Ingeniería cursan Cálculo. Premisa 2: Todos los que cursan Cálculo utilizan pensamiento lógico. ¿Qué conclusión se deduce necesariamente?',
      'image': 'https://images.unsplash.com/photo-1533073526757-2c8ca1df9f1c',
      'options': [
        'Todos los estudiantes de Ingeniería utilizan pensamiento lógico',
        'Ningún estudiante de otras carreras utiliza pensamiento lógico',
        'Solo quienes estudian Ingeniería cursan Cálculo',
        'Algunas personas que cursan Cálculo no utilizan pensamiento lógico'
      ],
      'correctAnswer':
          'Todos los estudiantes de Ingeniería utilizan pensamiento lógico',
    },

    // ==========================================
    // 4. NIVEL DE ESTRATO (Preguntas 11 - 13)
    // ==========================================
    {
      'category': 'Nivel de Estrato',
      'question':
          'En el sistema de estratificación socioeconómica vigente en Colombia (Ley 142 de 1994 y metodología DANE), ¿cuál es el propósito principal de clasificar las viviendas de Estrato 1 a 6?',
      'image': 'https://images.unsplash.com/photo-1451187580459-43490279c0fa',
      'options': [
        'Cobrar diferencialmente los servicios públicos domiciliarios, otorgando subsidios a los estratos 1, 2 y 3 y recaudando contribuciones en los estratos 5 y 6',
        'Clasificar a los estudiantes según su promedio de notas en el colegio',
        'Definir el número máximo de materias que puede inscribir un estudiante universitario',
        'Asignar el código postal de acuerdo con la edad de los habitantes del hogar'
      ],
      'correctAnswer':
          'Cobrar diferencialmente los servicios públicos domiciliarios, otorgando subsidios a los estratos 1, 2 y 3 y recaudando contribuciones en los estratos 5 y 6',
    },
    {
      'category': 'Nivel de Estrato',
      'question':
          'Dentro de la escala de estratificación socioeconómica (Estratos 1 al 6), ¿qué estrato paga exactamente la tarifa plena (costo de referencia sin subsidio ni sobrecosto de contribución) en los servicios públicos?',
      'image': 'https://images.unsplash.com/photo-1451187580459-43490279c0fa',
      'options': [
        'Estrato 4 (Medio)',
        'Estrato 1 (Bajo-bajo)',
        'Estrato 2 (Bajo)',
        'Estrato 6 (Alto)'
      ],
      'correctAnswer': 'Estrato 4 (Medio)',
    },
    {
      'category': 'Nivel de Estrato',
      'question':
          '¿Qué variables evalúa técnicamente el DANE para determinar el nivel de estrato socioeconómico de un sector residencial?',
      'image': 'https://images.unsplash.com/photo-1522071820081-009f0129c71c',
      'options': [
        'Las características físicas externas de las viviendas, las vías de acceso y el entorno urbano del vecindario',
        'Únicamente el historial académico de los integrantes de la familia',
        'La marca de los dispositivos electrónicos dentro del hogar',
        'La cantidad de libros almacenados en la vivienda'
      ],
      'correctAnswer':
          'Las características físicas externas de las viviendas, las vías de acceso y el entorno urbano del vecindario',
    },

    // ==========================================
    // 5. CIENCIAS EXACTAS: MATEMÁTICAS BÁSICA (Preguntas 14 - 17)
    // ==========================================
    {
      'category': 'Ciencias Exactas: Matemáticas Básica',
      'question':
          'Una licencia de software educativo cuesta \$240.000 COP. Si la universidad otorga un descuento del 25% para estudiantes de primer semestre, ¿cuál es el valor final a pagar?',
      'image': 'https://images.unsplash.com/photo-1509228468518-180dd4864904',
      'options': [
        '\$180.000 COP',
        '\$190.000 COP',
        '\$60.000 COP',
        '\$215.000 COP'
      ],
      'correctAnswer': '\$180.000 COP',
    },
    {
      'category': 'Ciencias Exactas: Matemáticas Básica',
      'question':
          'Resuelve la siguiente ecuación lineal de primer grado y determina el valor exacto de x:  3x + 7 = 28',
      'image': 'https://images.unsplash.com/photo-1509228468518-180dd4864904',
      'options': ['x = 7', 'x = 9', 'x = 11', 'x = 6'],
      'correctAnswer': 'x = 7',
    },
    {
      'category': 'Ciencias Exactas: Matemáticas Básica',
      'question':
          'En un triángulo rectángulo, los dos catetos perpendiculares miden 6 cm y 8 cm. Aplicando el Teorema de Pitágoras (c² = a² + b²), ¿cuánto mide la hipotenusa c?',
      'image': 'https://images.unsplash.com/photo-1509228468518-180dd4864904',
      'options': ['10 cm', '14 cm', '12 cm', '100 cm'],
      'correctAnswer': '10 cm',
    },
    {
      'category': 'Ciencias Exactas: Matemáticas Básica',
      'question':
          'Si un servidor procesa 150 solicitudes académicas en 3 minutos a ritmo constante, ¿cuántas solicitudes procesará en 8 minutos?',
      'image': 'https://images.unsplash.com/photo-1509228468518-180dd4864904',
      'options': [
        '400 solicitudes',
        '350 solicitudes',
        '450 solicitudes',
        '240 solicitudes'
      ],
      'correctAnswer': '400 solicitudes',
    },

    // ==========================================
    // 6. CIENCIAS EXACTAS: FÍSICA BÁSICA (Preguntas 18 - 20)
    // ==========================================
    {
      'category': 'Ciencias Exactas: Física Básica',
      'question':
          'Un tren eléctrico se desplaza en línea recta con velocidad constante y recorre 180 kilómetros en 2 horas. ¿Cuál es su rapidez media en km/h y su equivalente en m/s?',
      'image': 'https://images.unsplash.com/photo-1636466497217-26a8cbeaf0aa',
      'options': [
        '90 km/h (equivalente a 25 m/s)',
        '360 km/h (equivalente a 100 m/s)',
        '60 km/h (equivalente a 16,6 m/s)',
        '90 km/h (equivalente a 90 m/s)'
      ],
      'correctAnswer': '90 km/h (equivalente a 25 m/s)',
    },
    {
      'category': 'Ciencias Exactas: Física Básica',
      'question':
          'Sobre un bloque de masa m = 12 kg en una superficie sin fricción se aplica una fuerza neta horizontal F = 60 N. Según la Segunda Ley de Newton (F = m · a), ¿qué aceleración adquiere?',
      'image': 'https://images.unsplash.com/photo-1636466497217-26a8cbeaf0aa',
      'options': ['5 m/s²', '720 m/s²', '0,2 m/s²', '48 m/s²'],
      'correctAnswer': '5 m/s²',
    },
    {
      'category': 'Ciencias Exactas: Física Básica',
      'question':
          'Una esfera de masa m = 2 kg se sostiene a una altura h = 10 m sobre el suelo (g = 10 m/s²). ¿Cuál es su energía potencial gravitatoria inicial (Ep = m · g · h)?',
      'image': 'https://images.unsplash.com/photo-1636466497217-26a8cbeaf0aa',
      'options': [
        '200 Joules (J)',
        '20 Joules (J)',
        '100 Joules (J)',
        '400 Joules (J)'
      ],
      'correctAnswer': '200 Joules (J)',
    },
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timeLeft > 0) {
          setState(() {
            timeLeft--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    }
  }

  void previousQuestion() {
    if (currentQuestion > 0) {
      setState(() {
        currentQuestion--;
      });
    }
  }

  void selectAnswer(String option) {
    setState(() {
      selectedAnswers[currentQuestion] = option;
    });
  }

  void finishExam() {
    timer?.cancel();

    int correct = 0;
    for (int i = 0; i < questions.length; i++) {
      final expected =
          questions[i]['correctAnswer'] ?? questions[i]['options'][0];
      if (selectedAnswers[i] == expected) {
        correct++;
      }
    }

    double score = (correct / questions.length) * 5.0;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          score: score,
          totalQuestions: questions.length,
          correctAnswers: correct,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final progress = (currentQuestion + 1) / questions.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text('Evaluación de Conocimientos Básicos'),
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pregunta ${currentQuestion + 1} de ${questions.length}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Módulo: ${question['category'] ?? 'General'} • Avance: ${(progress * 100).toInt()}%',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F172A),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.timer,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              formatTime(timeLeft),
                              style: const TextStyle(
                                color: Colors.white,
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

              const SizedBox(height: 16),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFF2563EB),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      if (question['category'] != null)
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2563EB).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            question['category'],
                            style: const TextStyle(
                              color: Color(0xFF2563EB),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          question['image'],
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 180,
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.image,
                                size: 50,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        question['question'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),

                      const SizedBox(height: 20),

                      ...List.generate(
                        question['options'].length,
                        (index) {
                          String option = question['options'][index];
                          bool isSelected =
                              selectedAnswers[currentQuestion] == option;

                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isSelected
                                    ? const Color(0xFF2563EB)
                                    : Colors.white,
                                foregroundColor: isSelected
                                    ? Colors.white
                                    : const Color(0xFF0F172A),
                                side: BorderSide(
                                  color: isSelected
                                      ? const Color(0xFF2563EB)
                                      : Colors.grey[300]!,
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                  horizontal: 16,
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              onPressed: () => selectAnswer(option),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 14,
                                    backgroundColor: isSelected
                                        ? Colors.white
                                        : Colors.grey[200],
                                    child: Text(
                                      String.fromCharCode(65 + index),
                                      style: TextStyle(
                                        color: isSelected
                                            ? const Color(0xFF2563EB)
                                            : Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      option,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: const Color(0xFF0F172A),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed:
                        currentQuestion > 0 ? previousQuestion : null,
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Anterior'),
                  ),

                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          currentQuestion == questions.length - 1
                              ? Colors.green
                              : const Color(0xFF2563EB),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: currentQuestion == questions.length - 1
                        ? finishExam
                        : nextQuestion,
                    icon: Icon(
                      currentQuestion == questions.length - 1
                          ? Icons.check_circle
                          : Icons.arrow_forward,
                    ),
                    label: Text(
                      currentQuestion == questions.length - 1
                          ? 'Finalizar'
                          : 'Siguiente',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
