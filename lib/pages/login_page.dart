import 'package:crud_flutter/components/action_button.dart';
import 'package:crud_flutter/components/error_toast.dart';
import 'package:crud_flutter/components/input.dart';
import 'package:crud_flutter/interfaces/user.dart';
import 'package:crud_flutter/pages/menu_page.dart';
import 'package:crud_flutter/pages/register_page.dart';
import 'package:crud_flutter/repository/user.repository.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final userRepository = UserRepository();
  void handleSignIn(BuildContext context) async {
    var result = await userRepository.getUser(
        usernameController.text, passwordController.text);
    if (result == null) {
      ErrorToast.showError(context, 'Login inválido.');
      return;
    }
    User user = User(
        id: result.id,
        name: result.name,
        email: result.email,
        password: result.password);
    if (!context.mounted) return;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MenuPage(user: user)));
  }

  void navigateToRegisterPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

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
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 54),
                Text(
                  'Bem vindo! Acesse seu cardápio:',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 28),
                Input(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                  keyBoardType: TextInputType.name,
                ),
                const SizedBox(height: 24),
                Input(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  keyBoardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 54),
                ActionButton(
                    title: 'Entrar', onTap: () => handleSignIn(context)),
                const SizedBox(height: 54),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ainda não é cadastrado?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => navigateToRegisterPage(context),
                      child: const Text(
                        'Registre-se agora',
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
}
