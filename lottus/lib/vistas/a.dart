import 'package:flutter/material.dart';
import '/servicios/database.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Usuario'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su usuario';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _username = value!;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Contraseña'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su contraseña';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    DatabaseHelper db = DatabaseHelper();
                    bool isAuthenticated =
                        await db.authenticateUser(_username, _password);

                    if (isAuthenticated) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Inicio de sesión exitoso')),
                      );
                      // Navegar a la pantalla principal (HomeScreen)
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeContent()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Usuario o contraseña incorrectos')),
                      );
                    }
                  }
                },
                child: Text('Iniciar Sesión'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Nombre de usuario'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su nombre de usuario';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _username = value!;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Contraseña'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese su contraseña';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    DatabaseHelper db = DatabaseHelper();
                    await db.registerUser(_username, _password);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Usuario registrado con éxito')),
                    );

                    Navigator.pop(context);
                  }
                },
                child: Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
