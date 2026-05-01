import 'package:flutter/material.dart';
import 'OutputScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),
        scaffoldBackgroundColor: const Color(0xFFF3F7FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E3A8A),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFD6E4FF)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFF2563EB), width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStatePropertyAll(const Color(0xFF2563EB)),
        ),
        radioTheme: const RadioThemeData(
          fillColor: WidgetStatePropertyAll(Color(0xFF2563EB)),
        ),
        sliderTheme: const SliderThemeData(
          activeTrackColor: Color(0xFF2563EB),
          thumbColor: Color(0xFF1E3A8A),
          overlayColor: Color(0x332563EB),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E3A8A),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      home: const MyFormScreen(),
      routes: {'/output': (context) => const OutputScreen()},
    );
  }
}

class MyFormScreen extends StatefulWidget {
  const MyFormScreen({super.key});

  @override
  State<MyFormScreen> createState() => _MyFormScreenState();
}

class _MyFormScreenState extends State<MyFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _major;
  double _gpa = 0.0;
  String? _yearOfStudy;
  String? _password;
  String? _email;
  bool _rememberMe = false;
  String? _gender;
  String? _country;
  double _age = 18;
  DateTime? _selectedDate;

  final List<String> _countries = [
    'Palestine',
    'Jordan',
    'Eygpt',
    'Syrya',
    'Iraq',
  ];
  final List<String> _genders = ['Male', 'Female'];
  final List<String> _yearsOfStudy = ['1st Year', '2nd Year', '3rd Year', '4th Year'];
  
 

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pushNamed(
        context,
        '/output',
        arguments: {
          'username': _username,
          'major': _major,
          'password': _password,
          'email': _email,
          'rememberMe': _rememberMe,
          'gender': _gender,
          'country': _country,
          'yearOfStudy': _yearOfStudy,
          'age': _age,
          'gpa': _gpa,
          'selectedDate': _selectedDate,
        },
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Form Demo')),
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
              constraints: const BoxConstraints(maxWidth: 680),
              child: Card(
                elevation: 10,
                shadowColor: const Color(0x22000000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Student Registration',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF0F172A),
                              ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Fill in your details to preview the summary screen.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: const Color(0xFF64748B),
                              ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter your username',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Major',
                            hintText: 'ادخل تخصصك',
                          ),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your major'
                              : null,
                          onSaved: (value) => _major = value,
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFD6E4FF)),
                          ),
                          child: CheckboxListTile(
                            title: const Text('Remember me'),
                            value: _rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Gender:',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            ..._genders.map(
                              (gender) => Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Radio<String>(
                                    value: gender.toLowerCase(),
                                    groupValue: _gender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    },
                                  ),
                                  Text(gender),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Country',
                          ),
                          value: _country,
                          items: _countries.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _country = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a country';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _country = value;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Year of Study',
                          ),
                          value: _yearOfStudy,
                          items: _yearsOfStudy.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _yearOfStudy = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a year of study';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _yearOfStudy = value;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFD6E4FF)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'GPA',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Slider(
                                      value: _gpa,
                                      min: 0.0,
                                      max: 4.0,
                                      divisions: 40,
                                      label: _gpa.toStringAsFixed(1),
                                      onChanged: (double value) {
                                        setState(() {
                                          _gpa = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(_gpa.toStringAsFixed(1)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFD6E4FF)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Age',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Slider(
                                      value: _age,
                                      min: 18,
                                      max: 99,
                                      divisions: 81,
                                      label: _age.round().toString(),
                                      onChanged: (double value) {
                                        setState(() {
                                          _age = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(_age.round().toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        InkWell(
                          onTap: () => _selectDate(context),
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'Select Date',
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  _selectedDate == null
                                      ? 'No date selected'
                                      : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                                ),
                                const Icon(Icons.calendar_today),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _submitForm,
                            icon: const Icon(Icons.arrow_forward_rounded),
                            label: const Text('Submit'),
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
      ),
    );
  }
}
