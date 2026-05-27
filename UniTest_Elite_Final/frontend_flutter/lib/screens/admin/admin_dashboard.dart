import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {

    const Color darkBlue = Color(0xFF06142E);
    const Color green = Color(0xFF0F8B5F);

    final students = [

      {
        'name': 'Carlos Martínez',
        'score': '89%',
        'status': 'Aprobado',
        'color': Colors.green,
      },

      {
        'name': 'Laura Gómez',
        'score': '62%',
        'status': 'Reprobado',
        'color': Colors.red,
      },

      {
        'name': 'Andrés Torres',
        'score': '91%',
        'status': 'Aprobado',
        'color': Colors.green,
      },

      {
        'name': 'María Pérez',
        'score': '74%',
        'status': 'Aprobado',
        'color': Colors.orange,
      },

      {
        'name': 'Sebastián Ruiz',
        'score': '58%',
        'status': 'Reprobado',
        'color': Colors.red,
      },
    ];

    return Scaffold(

      backgroundColor: const Color(0xFFF4F7FB),

      body: Row(
        children: [

          /// SIDEBAR
          Container(
            width: 270,
            color: darkBlue,

            child: Padding(
              padding: const EdgeInsets.all(28),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  const SizedBox(height: 30),

                  Row(
                    children: [

                      CircleAvatar(
                        radius: 24,
                        backgroundColor: green,

                        child: const Icon(
                          Icons.admin_panel_settings,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 15),

                      const Text(
                        'Admin',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  menuItem(Icons.dashboard, 'Dashboard', true),
                  menuItem(Icons.people, 'Estudiantes', false),
                  menuItem(Icons.analytics, 'Analytics', false),
                  menuItem(Icons.assignment, 'Exámenes', false),
                  menuItem(Icons.settings, 'Configuración', false),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color:
                      Colors.white.withOpacity(0.08),

                      borderRadius:
                      BorderRadius.circular(22),
                    ),

                    child: const Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          'Administrador',

                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          'Sistema Activo',

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
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
            child: Padding(
              padding: const EdgeInsets.all(40),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    /// HEADER
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            const Text(
                              'Dashboard Administrativo',

                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              'Monitoreo institucional en tiempo real',

                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),

                        CircleAvatar(
                          radius: 30,
                          backgroundColor: green,

                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    /// KPI ROW
                    Row(
                      children: [

                        Expanded(
                          child: kpiCard(
                            'Estudiantes',
                            '1,240',
                            Icons.people,
                            Colors.blue,
                          ),
                        ),

                        const SizedBox(width: 22),

                        Expanded(
                          child: kpiCard(
                            'Aprobados',
                            '890',
                            Icons.check_circle,
                            Colors.green,
                          ),
                        ),

                        const SizedBox(width: 22),

                        Expanded(
                          child: kpiCard(
                            'Reprobados',
                            '350',
                            Icons.cancel,
                            Colors.red,
                          ),
                        ),

                        const SizedBox(width: 22),

                        Expanded(
                          child: kpiCard(
                            'Promedio',
                            '87%',
                            Icons.analytics,
                            Colors.orange,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    /// TABLE
                    Container(
                      width: double.infinity,

                      padding: const EdgeInsets.all(30),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                        BorderRadius.circular(32),

                        boxShadow: [
                          BoxShadow(
                            color:
                            Colors.black.withOpacity(0.04),

                            blurRadius: 20,
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          const Text(
                            'Resultados de Estudiantes',

                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 30),

                          ...students.map((student) {

                            return Container(
                              margin:
                              const EdgeInsets.only(
                                bottom: 18,
                              ),

                              padding:
                              const EdgeInsets.all(22),

                              decoration: BoxDecoration(
                                color:
                                const Color(0xFFF4F7FB),

                                borderRadius:
                                BorderRadius.circular(22),
                              ),

                              child: Row(
                                children: [

                                  CircleAvatar(
                                    radius: 24,

                                    backgroundColor:
                                    (student['color']
                                    as Color)
                                        .withOpacity(0.12),

                                    child: Icon(
                                      Icons.person,

                                      color:
                                      student['color']
                                      as Color,
                                    ),
                                  ),

                                  const SizedBox(width: 18),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                      children: [

                                        Text(
                                          student['name']
                                          as String,

                                          style:
                                          const TextStyle(
                                            fontWeight:
                                            FontWeight.bold,

                                            fontSize: 18,
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 5,
                                        ),

                                        Text(
                                          student['status']
                                          as String,

                                          style: TextStyle(
                                            color:
                                            Colors.grey
                                                .shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    padding:
                                    const EdgeInsets
                                        .symmetric(
                                      horizontal: 18,
                                      vertical: 10,
                                    ),

                                    decoration:
                                    BoxDecoration(
                                      color:
                                      (student['color']
                                      as Color)
                                          .withOpacity(
                                        0.12,
                                      ),

                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                        16,
                                      ),
                                    ),

                                    child: Text(
                                      student['score']
                                      as String,

                                      style: TextStyle(
                                        color:
                                        student['color']
                                        as Color,

                                        fontWeight:
                                        FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
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
        BorderRadius.circular(18),
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
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  Widget kpiCard(
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
            color:
            Colors.black.withOpacity(0.04),

            blurRadius: 20,
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
            ),
          ),
        ],
      ),
    );
  }
}