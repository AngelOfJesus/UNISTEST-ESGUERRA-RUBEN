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
    {
      'question': 'En una secuencia numérica, cada término se obtiene multiplicando el anterior por 2 y sumando 1. Si comienza en 2, ¿cuál es el cuarto término?',
      'image': 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3',
      'options': ['19', '21', '23', '25']
    },
    {
      'question': 'Un estudiante observa que una planta crece más con cierta cantidad de luz. ¿Qué debería hacer para comprobar si la luz es la causa?',
      'image': 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4',
      'options': ['Cambiar luz, agua y suelo al mismo tiempo', 'Repetir el experimento controlando las demás variables', 'Medir una sola planta una vez', 'Aceptar la primera observación como prueba']
    },
    {
      'question': 'Completa la analogía: brújula es a orientación como termómetro es a…',
      'image': 'https://images.unsplash.com/photo-1555949963-aa79dcee981c',
      'options': ['Velocidad', 'Presión', 'Temperatura', 'Distancia']
    },
    {
      'question': 'Si todos los prototipos del lote A fueron revisados y algunos dispositivos revisados fallaron, ¿qué conclusión es necesariamente válida?',
      'image': 'https://images.unsplash.com/photo-1544383835-bda2bc66a55d',
      'options': ['Todos los prototipos del lote A fallaron', 'Ningún prototipo del lote A falló', 'No se puede afirmar que un prototipo del lote A haya fallado', 'Todos los dispositivos revisados pertenecen al lote A']
    },
    {
      'question': 'Una máquina produce 6 piezas en 4 minutos. Manteniendo el mismo ritmo, ¿cuántas piezas produce en 20 minutos?',
      'image': 'https://images.unsplash.com/photo-1516321497487-e288fb19713f',
      'options': ['24', '26', '30', '36']
    },
    {
      'question': 'En una fila, Laura está antes que Mateo y Mateo antes que Sara. ¿Cuál afirmación es correcta?',
      'image': 'https://images.unsplash.com/photo-1522071820081-009f0129c71c',
      'options': ['Sara está antes que Laura', 'Mateo está antes que Laura', 'Laura está antes que Sara', 'No se puede establecer el orden']
    },
    {
      'question': 'Un problema tiene cinco posibles soluciones. Después de probar tres, todas fallan por la misma razón. ¿Qué estrategia es más razonable?',
      'image': 'https://images.unsplash.com/photo-1516116216624-53e697fedbea',
      'options': ['Seguir probando al azar', 'Analizar la causa común y descartar enfoques equivalentes', 'Elegir la primera solución', 'Abandonar sin revisar los datos']
    },
    {
      'question': '¿Qué número continúa la serie: 3, 6, 11, 18, 27, …?',
      'image': 'https://images.unsplash.com/photo-1563013544-824ae1b704d3',
      'options': ['34', '36', '38', '40']
    },
    {
      'question': '¿Cuál de las siguientes magnitudes es una magnitud fundamental del Sistema Internacional?',
      'image': 'https://images.unsplash.com/photo-1516321165247-4aa89a48be28',
      'options': ['Fuerza', 'Energía', 'Masa', 'Presión']
    },
    {
      'question': 'En un experimento, se modifica la temperatura y se mide cuánto tarda en disolverse una sustancia. ¿Cuál es la variable independiente?',
      'image': 'https://images.unsplash.com/photo-1555066931-4365d14bab8c',
      'options': ['El tiempo de disolución', 'La temperatura', 'La cantidad disuelta', 'El resultado final']
    },
    {
      'question': '¿Qué instrumento es el más adecuado para medir el diámetro de una pieza pequeña con precisión?',
      'image': 'https://images.unsplash.com/photo-1516321310764-8d4f1c2b0e0b',
      'options': ['Cronómetro', 'Balanza', 'Calibrador o pie de rey', 'Termómetro']
    },
    {
      'question': 'Una sustancia tiene masa de 200 g y ocupa 50 cm³. ¿Cuál es su densidad?',
      'image': 'https://images.unsplash.com/photo-1451187580459-43490279c0fa',
      'options': ['2 g/cm³', '4 g/cm³', '5 g/cm³', '10 g/cm³']
    },
    {
      'question': '¿Qué representa una hipótesis científica?',
      'image': 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
      'options': ['Una opinión imposible de comprobar', 'Una explicación provisional que puede ponerse a prueba', 'Una conclusión que nunca cambia', 'Una observación sin relación con el problema']
    },
    {
      'question': 'Si un objeto está formado por partículas y se calienta, normalmente sus partículas…',
      'image': 'https://images.unsplash.com/photo-1517180102446-f3ece451e9d8',
      'options': ['Dejan de moverse', 'Disminuyen siempre su tamaño', 'Aumentan su energía cinética promedio', 'Se convierten automáticamente en otro elemento']
    },
    {
      'question': '¿Cuál es la unidad de corriente eléctrica en el Sistema Internacional?',
      'image': 'https://images.unsplash.com/photo-1518770660439-4636190af475',
      'options': ['Voltio', 'Ohmio', 'Amperio', 'Vatio']
    },
    {
      'question': 'En una gráfica de distancia contra tiempo, una línea recta con pendiente constante distinta de cero representa…',
      'image': 'https://images.unsplash.com/photo-1516321497487-e288fb19713f',
      'options': ['Movimiento con velocidad constante', 'Reposo', 'Aceleración que aumenta continuamente', 'Cambio aleatorio de dirección']
    },
    {
      'question': '¿Cuánto es el 15 % de 240?',
      'image': 'https://images.unsplash.com/photo-1558494949-ef010cbdcc31',
      'options': ['24', '30', '36', '40']
    },
    {
      'question': 'Resuelve: 3(2x − 1) = 15.',
      'image': 'https://images.unsplash.com/photo-1526379095098-d400fd0bf935',
      'options': ['x = 2', 'x = 3', 'x = 4', 'x = 6']
    },
    {
      'question': 'Una chaqueta cuesta $80.000 y tiene un descuento del 25 %. ¿Cuál es el precio final?',
      'image': 'https://images.unsplash.com/photo-1516110833967-214a2a0d3f5b',
      'options': ['$55.000', '$60.000', '$65.000', '$75.000']
    },
    {
      'question': '¿Cuál es el resultado de 2/3 + 1/6?',
      'image': 'https://images.unsplash.com/photo-1556075798-4825dfaaf498',
      'options': ['1/2', '2/9', '5/6', '1']
    },
    {
      'question': 'Un terreno rectangular mide 12 m de largo y 7 m de ancho. ¿Cuál es su área?',
      'image': 'https://images.unsplash.com/photo-1555949963-f6a0d0d5d9d8',
      'options': ['19 m²', '38 m²', '84 m²', '168 m²']
    },
    {
      'question': 'Si f(x) = 2x² − 3, ¿cuánto vale f(3)?',
      'image': 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      'options': ['9', '12', '15', '18']
    },
    {
      'question': 'Un automóvil recorre 150 km en 2,5 horas a velocidad constante. ¿Cuál es su velocidad promedio?',
      'image': 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3',
      'options': ['50 km/h', '55 km/h', '60 km/h', '75 km/h']
    },
    {
      'question': 'En un grupo hay 18 mujeres y 12 hombres. ¿Qué fracción del grupo corresponde a los hombres?',
      'image': 'https://images.unsplash.com/photo-1517180102446-f3ece451e9d8',
      'options': ['2/5', '3/5', '2/3', '3/2']
    },
    {
      'question': 'Un objeto de 4 kg acelera a 3 m/s². Según la segunda ley de Newton, ¿qué fuerza neta actúa sobre él?',
      'image': 'https://images.unsplash.com/photo-1516321310764-8d4f1c2b0e0b',
      'options': ['7 N', '12 N', '16 N', '24 N']
    },
    {
      'question': 'Se deja caer una pelota desde cierta altura, despreciando la resistencia del aire. Durante la caída, su energía potencial gravitatoria…',
      'image': 'https://images.unsplash.com/photo-1526379095098-d400fd0bf935',
      'options': ['Aumenta', 'Disminuye', 'Permanece siempre igual', 'Se convierte en masa']
    },
    {
      'question': '¿Cuál es la unidad de energía en el Sistema Internacional?',
      'image': 'https://images.unsplash.com/photo-1558494949-ef010cbdcc31',
      'options': ['Newton', 'Pascal', 'Joule', 'Amperio']
    },
    {
      'question': 'Una resistencia de 6 Ω se conecta a una fuente de 12 V. ¿Qué corriente circula por ella?',
      'image': 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
      'options': ['0,5 A', '2 A', '6 A', '72 A']
    },
    {
      'question': '¿Qué sucede con la presión sobre una superficie si se aplica la misma fuerza sobre un área menor?',
      'image': 'https://images.unsplash.com/photo-1451187580459-43490279c0fa',
      'options': ['Disminuye', 'Aumenta', 'No cambia', 'Se vuelve cero']
    },
    {
      'question': 'Un ciclista pasa de 4 m/s a 10 m/s en 3 segundos. ¿Cuál es su aceleración media?',
      'image': 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
      'options': ['2 m/s²', '3 m/s²', '4 m/s²', '6 m/s²']
    },
    {
      'question': '¿Por qué un pasajero tiende a inclinarse hacia adelante cuando un vehículo frena bruscamente?',
      'image': 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3',
      'options': ['Por la inercia', 'Por la gravedad que desaparece', 'Por la fuerza magnética', 'Por la ausencia de masa']
    },
    {
      'question': 'Dos focos idénticos se conectan en paralelo a una batería ideal. Si uno se desconecta, ¿qué ocurre con el otro?',
      'image': 'https://images.unsplash.com/photo-1558494949-ef010cbdcc31',
      'options': ['También se apaga necesariamente', 'Sigue encendido', 'Su resistencia se vuelve infinita', 'La batería deja de funcionar']
    },
    {
      'question': 'Cuando no entiendes un tema complejo, ¿qué conducta favorece más tu aprendizaje?',
      'image': 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      'options': ['Ocultar la dificultad y evitar preguntar', 'Dividirlo en partes, consultar fuentes y practicar', 'Memorizar respuestas sin comprender', 'Concluir que no tienes capacidad']
    },
    {
      'question': 'En un trabajo en equipo, un compañero propone una solución distinta a la tuya y presenta argumentos. ¿Qué respuesta es más constructiva?',
      'image': 'https://images.unsplash.com/photo-1516321497487-e288fb19713f',
      'options': ['Rechazarla porque no fue tu idea', 'Escuchar, comparar evidencias y probar la alternativa si es viable', 'Ignorarlo y continuar solo', 'Cambiar de opinión sin analizar nada']
    },
    {
      'question': 'Después de cometer un error en un cálculo importante, ¿qué acción demuestra responsabilidad?',
      'image': 'https://images.unsplash.com/photo-1517180102446-f3ece451e9d8',
      'options': ['Ocultarlo para evitar críticas', 'Culpar al compañero', 'Informarlo, revisar el procedimiento y corregirlo', 'Entregar el resultado sin verificar']
    },
    {
      'question': 'Ante una tarea difícil que requiere varias horas de concentración, ¿qué estrategia suele ser más efectiva?',
      'image': 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      'options': ['Trabajar sin pausas hasta agotarse', 'Planificar etapas, priorizar y revisar avances', 'Esperar hasta el último momento', 'Hacer varias tareas sin terminar ninguna']
    },
    {
      'question': 'Si recibes una crítica específica sobre tu trabajo, ¿qué actitud refleja apertura al aprendizaje?',
      'image': 'https://images.unsplash.com/photo-1555066931-4365d14bab8c',
      'options': ['Tomarla como un ataque personal', 'Evaluarla con calma y decidir qué mejorar', 'Ignorar cualquier comentario', 'Abandonar la actividad']
    },
    {
      'question': 'Cuando dos fuentes presentan resultados contradictorios, ¿qué deberías hacer primero?',
      'image': 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3',
      'options': ['Elegir la que confirme tu opinión', 'Comparar métodos, datos y confiabilidad de ambas', 'Compartir ambas sin revisar', 'Asumir que las dos son falsas']
    },
    {
      'question': '¿Cuál es la mejor forma de actuar si detectas que tu equipo está tomando una decisión con información insuficiente?',
      'image': 'https://images.unsplash.com/photo-1544383835-bda2bc66a55d',
      'options': ['Guardar silencio para evitar problemas', 'Señalar qué información falta y proponer cómo obtenerla', 'Inventar datos para avanzar', 'Aceptar la decisión sin cuestionarla']
    },
    {
      'question': 'Al enfrentarte a un problema para el que no conoces la fórmula, ¿qué opción refleja mejor una disposición adecuada para estudiar ingeniería?',
      'image': 'https://images.unsplash.com/photo-1563013544-824ae1b704d3',
      'options': ['Rendirse de inmediato', 'Identificar los datos, buscar principios relacionados y construir un procedimiento', 'Escoger cualquier fórmula', 'Esperar siempre a que otra persona lo resuelva']
    }
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

  final Color darkBlue = const Color(0xFF06142E);
  final Color green = const Color(0xFF0F8B5F);

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      body: Row(
        children: [
          /// SIDEBAR
          Container(
            width: 300,
            color: darkBlue,
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  const Text(
                    'UniTest',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// TIMER
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.timer,
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(height: 18),
                        Text(
                          formatTime(timeLeft),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Tiempo restante',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  const Text(
                    'Preguntas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: GridView.builder(
                      itemCount: questions.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (_, index) {
                        final active = currentQuestion == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentQuestion = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: active
                                  ? green
                                  : Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        timer?.cancel();

                        int score = 0;

                        final correctAnswers = {
                          0: '23',
                          1: 'Repetir el experimento controlando las demás variables',
                          2: 'Temperatura',
                          3: 'No se puede afirmar que un prototipo del lote A haya fallado',
                          4: '30',
                          5: 'Laura está antes que Sara',
                          6: 'Analizar la causa común y descartar enfoques equivalentes',
                          7: '38',
                          8: 'Masa',
                          9: 'La temperatura',
                          10: 'Calibrador o pie de rey',
                          11: '4 g/cm³',
                          12: 'Una explicación provisional que puede ponerse a prueba',
                          13: 'Aumentan su energía cinética promedio',
                          14: 'Amperio',
                          15: 'Movimiento con velocidad constante',
                          16: '36',
                          17: 'x = 3',
                          18: '$60.000',
                          19: '5/6',
                          20: '84 m²',
                          21: '15',
                          22: '60 km/h',
                          23: '2/5',
                          24: '12 N',
                          25: 'Disminuye',
                          26: 'Joule',
                          27: '2 A',
                          28: 'Aumenta',
                          29: '2 m/s²',
                          30: 'Por la inercia',
                          31: 'Sigue encendido',
                          32: 'Dividirlo en partes, consultar fuentes y practicar',
                          33: 'Escuchar, comparar evidencias y probar la alternativa si es viable',
                          34: 'Informarlo, revisar el procedimiento y corregirlo',
                          35: 'Planificar etapas, priorizar y revisar avances',
                          36: 'Evaluarla con calma y decidir qué mejorar',
                          37: 'Comparar métodos, datos y confiabilidad de ambas',
                          38: 'Señalar qué información falta y proponer cómo obtenerla',
                          39: 'Identificar los datos, buscar principios relacionados y construir un procedimiento',
                        };

                        selectedAnswers.forEach((key, value) {
                          if (correctAnswers[key] == value) {
                            score++;
                          }
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResultScreen(
                              score: score,
                              total: questions.length,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Enviar Examen',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// CONTENT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pregunta ${currentQuestion + 1}',
                            style: const TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Evaluación de Ingeniería de Software',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(
                          '${currentQuestion + 1}/${questions.length}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: (currentQuestion + 1) / questions.length,
                      minHeight: 12,
                      backgroundColor: Colors.grey.shade300,
                      color: green,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question['question'],
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(height: 35),
                            Container(
                              height: 260,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Image.network(
                                  question['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 35),
                            ...List.generate(
                              question['options'].length,
                              (index) {
                                final option = question['options'][index];

                                final selected =
                                    selectedAnswers[currentQuestion] == option;

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedAnswers[currentQuestion] = option;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 18,
                                    ),
                                    padding: const EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                      color: selected
                                          ? green.withOpacity(0.08)
                                          : const Color(0xFFF4F7FB),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: selected
                                            ? green
                                            : Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: selected
                                              ? green
                                              : Colors.grey.shade300,
                                          child: Text(
                                            String.fromCharCode(
                                              65 + index,
                                            ),
                                            style: TextStyle(
                                              color: selected
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Text(
                                            option,
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 20,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (currentQuestion > 0) {
                                      setState(() {
                                        currentQuestion--;
                                      });
                                    }
                                  },
                                  child: const Text(
                                    'Anterior',
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: green,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 35,
                                      vertical: 20,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (currentQuestion <
                                        questions.length - 1) {
                                      setState(() {
                                        currentQuestion++;
                                      });
                                    }
                                  },
                                  child: const Text(
                                    'Siguiente',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
