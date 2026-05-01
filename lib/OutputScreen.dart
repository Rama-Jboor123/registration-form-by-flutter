import 'package:flutter/material.dart';

class OutputScreen extends StatelessWidget {
  const OutputScreen({super.key});

  Widget _infoTile(String label, String value, {IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFD6E4FF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF1E3A8A), size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final String? username = args?['username'];
    final String? major = args?['major'];
    final double? gpa = args?['gpa'];
    final String? yearOfStudy = args?['yearOfStudy'];
    final String? password = args?['password'];
    final String? email = args?['email'];
    final bool? rememberMe = args?['rememberMe'];
    final String? gender = args?['gender'];
    final String? country = args?['country'];
    final double? age = args?['age'];
    final DateTime? selectedDate = args?['selectedDate'];
    return Scaffold(
      appBar: AppBar(title: const Text('Form Output')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFEAF1FF), Color(0xFFF8FAFF)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Card(
                elevation: 10,
                shadowColor: const Color(0x22000000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Registration Summary',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Review the submitted details below.',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      _infoTile(
                        'Username',
                        username ?? 'Not entered',
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 12),
                      _infoTile(
                        'Major',
                        major ?? 'Not entered',
                        icon: Icons.school,
                      ),
                      const SizedBox(height: 12),
                      _infoTile(
                        'Email',
                        email ?? 'Not entered',
                        icon: Icons.email,
                      ),
                      const SizedBox(height: 12),
                      _infoTile(
                        'Password',
                        password ?? 'Not entered',
                        icon: Icons.lock,
                      ),
                      const SizedBox(height: 12),
                      _infoTile(
                        'Remember Me',
                        rememberMe == true ? 'Enabled' : 'Disabled',
                        icon: Icons.check_circle,
                      ),
                      const SizedBox(height: 12),
                      _infoTile(
                        'Gender',
                        gender ?? 'Not selected',
                        icon: Icons.wc,
                      ),
                      const SizedBox(height: 12),
                      _infoTile(
                        'Country',
                        country ?? 'Not selected',
                        icon: Icons.public,
                      ),
                      const SizedBox(height: 12),
                      _infoTile(
                        'Year of Study',
                        yearOfStudy ?? 'Not selected',
                        icon: Icons.date_range,
                      ),
                      const SizedBox(height: 12),
                      _infoTile(
                        'GPA',
                        gpa?.toStringAsFixed(2) ?? 'Not entered',
                        icon: Icons.star,
                      ),
                      const SizedBox(height: 12),
                      _infoTile(
                        'Age',
                        age?.round().toString() ?? 'Not entered',
                        icon: Icons.cake,
                      ),
                      const SizedBox(height: 12),
                      _infoTile(
                        'Selected Date',
                        selectedDate?.toLocal().toString().split(' ')[0] ??
                            'Not selected',
                        icon: Icons.calendar_today,
                      ),
                      const SizedBox(height: 24.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_rounded),
                          label: const Text('Go Back'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
