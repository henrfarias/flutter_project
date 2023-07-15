import 'package:crud_flutter/components/action_button.dart';
import 'package:crud_flutter/components/input.dart';
import 'package:crud_flutter/pages/login_page.dart';
import 'package:crud_flutter/validators/email_validator.dart';
import 'package:crud_flutter/validators/name_validator.dart';
import 'package:crud_flutter/validators/password_validator.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 54),
                const Icon(
                  Icons.person_add,
                  size: 100,
                ),
                const SizedBox(height: 54),
                Text(
                  'Crie sua conta:',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      const SizedBox(height: 28),
                      Input(
                        autoFocus: true,
                        controller: nameController,
                        hintText: 'Nome',
                        obscureText: false,
                        validator: (value) => nameValidator(value),
                        keyBoardType: TextInputType.name,
                      ),
                      const SizedBox(height: 24),
                      Input(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                        validator: emailValidator,
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 24),
                      Input(
                        controller: passwordController,
                        hintText: 'Senha',
                        obscureText: true,
                        validator: passwordValidator,
                        keyBoardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 54),
                      ActionButton(title: 'Cadastrar', onTap: handleRegister),
                      const SizedBox(height: 54),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já possui uma conta?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => navigateToLoginPage(context),
                      child: const Text(
                        'Faça login',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleRegister() {
    // Implement registration logic here
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    if (_keyForm.currentState!.validate()) {
      print('REGISTRADO COM SUCESSO');
      nameController.text = '';
      passwordController.text = '';
      emailController.text = '';
      return;
    }
    print('ERRO NO REGISTRO');
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
