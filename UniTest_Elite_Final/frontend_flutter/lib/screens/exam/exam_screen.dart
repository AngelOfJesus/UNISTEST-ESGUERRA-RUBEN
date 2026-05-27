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
      'question':
          '¿Qué arquitectura es más adecuada para sistemas distribuidos escalables?',
      'image': 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3',
      'options': ['Microservicios', 'Monolito', 'MVC', 'Cliente-servidor']
    },
    {
      'question': '¿Qué estructura optimiza búsquedas binarias?',
      'image': 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4',
      'options': ['Array ordenado', 'Pila', 'Cola', 'Lista enlazada']
    },
    {
      'question': '¿Qué diagrama UML representa interacción temporal?',
      'image': 'https://images.unsplash.com/photo-1555949963-aa79dcee981c',
      'options': ['Secuencia', 'Clases', 'Objetos', 'Paquetes']
    },
    {
      'question': '¿Qué consulta SQL elimina duplicados?',
      'image': 'https://images.unsplash.com/photo-1544383835-bda2bc66a55d',
      'options': ['DISTINCT', 'GROUP BY', 'ORDER BY', 'DELETE']
    },
    {
      'question': '¿Qué patrón desacopla eventos?',
      'image': 'https://images.unsplash.com/photo-1516321497487-e288fb19713f',
      'options': ['Observer', 'Factory', 'Adapter', 'Singleton']
    },
    {
      'question': '¿Qué metodología usa iteraciones rápidas?',
      'image': 'https://images.unsplash.com/photo-1522071820081-009f0129c71c',
      'options': ['Scrum', 'Cascada', 'RUP', 'XP']
    },
    {
      'question': '¿Qué principio SOLID evita dependencias rígidas?',
      'image': 'https://images.unsplash.com/photo-1516116216624-53e697fedbea',
      'options': [
        'Dependency Inversion',
        'Open/Closed',
        'Single Responsibility',
        'Liskov'
      ]
    },
    {
      'question': '¿Qué protocolo usa cifrado HTTPS?',
      'image': 'https://images.unsplash.com/photo-1563013544-824ae1b704d3',
      'options': ['TLS/SSL', 'FTP', 'SMTP', 'SSH']
    },
    {
      'question': '¿Qué algoritmo tiene complejidad O(log n)?',
      'image': 'https://images.unsplash.com/photo-1516321165247-4aa89a48be28',
      'options': [
        'Búsqueda binaria',
        'Bubble sort',
        'Recorrido lineal',
        'Inserción'
      ]
    },
    {
      'question': '¿Qué componente maneja rutas en Flutter?',
      'image': 'https://images.unsplash.com/photo-1555066931-4365d14bab8c',
      'options': ['Navigator', 'Scaffold', 'Container', 'FutureBuilder']
    },
    {
      'question': '¿Qué tipo de prueba valida módulos individuales?',
      'image': 'https://images.unsplash.com/photo-1516321310764-8d4f1c2b0e0b',
      'options': ['Unitarias', 'Integración', 'Aceptación', 'Estrés']
    },
    {
      'question': '¿Qué base de datos es NoSQL?',
      'image': 'https://images.unsplash.com/photo-1451187580459-43490279c0fa',
      'options': ['MongoDB', 'PostgreSQL', 'MySQL', 'Oracle']
    },
    {
      'question': '¿Qué técnica reduce redundancia en bases de datos?',
      'image': 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
      'options': ['Normalización', 'Replicación', 'Indexación', 'Hashing']
    },
    {
      'question': '¿Qué lenguaje usa Flutter?',
      'image': 'https://images.unsplash.com/photo-1517180102446-f3ece451e9d8',
      'options': ['Dart', 'Kotlin', 'Swift', 'Python']
    },
    {
      'question': '¿Qué HTTP method actualiza recursos?',
      'image': 'https://images.unsplash.com/photo-1518770660439-4636190af475',
      'options': ['PUT', 'GET', 'DELETE', 'OPTIONS']
    },
    {
      'question': '¿Qué estructura sigue LIFO?',
      'image': 'https://images.unsplash.com/photo-1516321497487-e288fb19713f',
      'options': ['Pila', 'Cola', 'Árbol', 'Hash']
    },
    {
      'question': '¿Qué servicio permite contenerización?',
      'image': 'https://images.unsplash.com/photo-1558494949-ef010cbdcc31',
      'options': ['Docker', 'Git', 'Firebase', 'Linux']
    },
    {
      'question': '¿Qué framework pertenece a Python?',
      'image': 'https://images.unsplash.com/photo-1526379095098-d400fd0bf935',
      'options': ['Django', 'Laravel', 'Spring', 'Express']
    },
    {
      'question': '¿Qué principio evita modificar código existente?',
      'image': 'https://images.unsplash.com/photo-1516110833967-214a2a0d3f5b',
      'options': [
        'Open/Closed',
        'Single Responsibility',
        'Interface Segregation',
        'Liskov'
      ]
    },
    {
      'question': '¿Qué herramienta versiona código?',
      'image': 'https://images.unsplash.com/photo-1556075798-4825dfaaf498',
      'options': ['Git', 'Docker', 'Jira', 'Figma']
    },
    {
      'question': '¿Qué arquitectura usa APIs REST?',
      'image': 'https://images.unsplash.com/photo-1555949963-f6a0d0d5d9d8',
      'options': ['Cliente-servidor', 'P2P', 'Mainframe', 'Monolito']
    },
    {
      'question': '¿Qué lenguaje se ejecuta en navegador?',
      'image': 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      'options': ['JavaScript', 'Java', 'C#', 'Go']
    },
    {
      'question': '¿Qué prueba mide rendimiento extremo?',
      'image': 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3',
      'options': ['Estrés', 'Unitaria', 'Caja blanca', 'Aceptación']
    },
    {
      'question': '¿Qué comando descarga dependencias Flutter?',
      'image': 'https://images.unsplash.com/photo-1517180102446-f3ece451e9d8',
      'options': [
        'flutter pub get',
        'flutter clean',
        'flutter build',
        'flutter create'
      ]
    },
    {
      'question': '¿Qué API maneja peticiones HTTP en Flutter?',
      'image': 'https://images.unsplash.com/photo-1516321310764-8d4f1c2b0e0b',
      'options': ['http', 'material', 'dart:ui', 'provider']
    },
    {
      'question': '¿Qué estructura almacena pares clave-valor?',
      'image': 'https://images.unsplash.com/photo-1526379095098-d400fd0bf935',
      'options': ['Map', 'List', 'Queue', 'Stack']
    },
    {
      'question': '¿Qué sistema usa integración continua?',
      'image': 'https://images.unsplash.com/photo-1558494949-ef010cbdcc31',
      'options': ['CI/CD', 'FTP', 'SOAP', 'REST']
    },
    {
      'question': '¿Qué método HTTP obtiene datos?',
      'image': 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
      'options': ['GET', 'POST', 'PATCH', 'DELETE']
    },
    {
      'question': '¿Qué servicio despliega apps serverless?',
      'image': 'https://images.unsplash.com/photo-1451187580459-43490279c0fa',
      'options': ['AWS Lambda', 'Docker', 'Kubernetes', 'Firebase Auth']
    },
    {
      'question': '¿Qué tipo de IA aprende mediante ejemplos?',
      'image': 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
      'options': ['Machine Learning', 'Compilador', 'Árbol binario', 'Firewall']
    },
    {
      'question': '¿Qué algoritmo ordena intercambiando elementos?',
      'image': 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3',
      'options': ['Bubble Sort', 'Merge Sort', 'Quick Sort', 'Heap Sort']
    },
    {
      'question': '¿Qué sistema administra contenedores?',
      'image': 'https://images.unsplash.com/photo-1558494949-ef010cbdcc31',
      'options': ['Kubernetes', 'Git', 'Jira', 'Linux']
    },
    {
      'question': '¿Qué componente Flutter crea layouts flexibles?',
      'image': 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      'options': ['Expanded', 'Scaffold', 'Text', 'AppBar']
    },
    {
      'question': '¿Qué protocolo envía correos?',
      'image': 'https://images.unsplash.com/photo-1516321497487-e288fb19713f',
      'options': ['SMTP', 'FTP', 'HTTP', 'SSH']
    },
    {
      'question': '¿Qué lenguaje compila JVM?',
      'image': 'https://images.unsplash.com/photo-1517180102446-f3ece451e9d8',
      'options': ['Java', 'Python', 'PHP', 'Go']
    },
    {
      'question': '¿Qué propiedad CSS usa Flexbox?',
      'image': 'https://images.unsplash.com/photo-1498050108023-c5249f4df085',
      'options': [
        'display:flex',
        'position:absolute',
        'float:left',
        'grid-area'
      ]
    },
    {
      'question': '¿Qué framework usa componentes reactivos?',
      'image': 'https://images.unsplash.com/photo-1555066931-4365d14bab8c',
      'options': ['React', 'Laravel', 'Spring', 'Django']
    },
    {
      'question': '¿Qué algoritmo usa prioridad?',
      'image': 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3',
      'options': ['Dijkstra', 'Bubble Sort', 'DFS', 'BFS']
    },
    {
      'question': '¿Qué tipo de relación SQL conecta tablas?',
      'image': 'https://images.unsplash.com/photo-1544383835-bda2bc66a55d',
      'options': ['JOIN', 'DROP', 'INSERT', 'UPDATE']
    },
    {
      'question': '¿Qué sistema autentica usuarios?',
      'image': 'https://images.unsplash.com/photo-1563013544-824ae1b704d3',
      'options': ['OAuth', 'REST', 'FTP', 'SOAP']
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
                          0: 'Microservicios',
                          1: 'Array ordenado',
                          2: 'Secuencia',
                          3: 'DISTINCT',
                          4: 'Observer',
                          5: 'Scrum',
                          6: 'Dependency Inversion',
                          7: 'TLS/SSL',
                          8: 'Búsqueda binaria',
                          9: 'Navigator',
                          10: 'Unitarias',
                          11: 'MongoDB',
                          12: 'Normalización',
                          13: 'Dart',
                          14: 'PUT',
                          15: 'Pila',
                          16: 'Docker',
                          17: 'Django',
                          18: 'Open/Closed',
                          19: 'Git',
                          20: 'Cliente-servidor',
                          21: 'JavaScript',
                          22: 'Estrés',
                          23: 'flutter pub get',
                          24: 'http',
                          25: 'Map',
                          26: 'CI/CD',
                          27: 'GET',
                          28: 'AWS Lambda',
                          29: 'Machine Learning',
                          30: 'Bubble Sort',
                          31: 'Kubernetes',
                          32: 'Expanded',
                          33: 'SMTP',
                          34: 'Java',
                          35: 'display:flex',
                          36: 'React',
                          37: 'Dijkstra',
                          38: 'JOIN',
                          39: 'OAuth',
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
