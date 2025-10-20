import 'package:flutter/material.dart';
import 'lang.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return ValueListenableBuilder<bool>(
      valueListenable: isArabic,
      builder: (context, arabic, _) {
        final title = arabic ? 'تسجيل الدخول' : 'Sign in to your account';
        final subtitle = arabic ? 'أو أنشئ حسابًا جديدًا' : 'Or create a new account';
        final emailLabel = arabic ? 'البريد الإلكتروني' : 'Email address';
        final passLabel = arabic ? 'كلمة المرور' : 'Password';
        final remember = arabic ? 'تذكرني' : 'Remember me';
        final signIn = arabic ? 'تسجيل الدخول' : 'Sign in';

        return Scaffold(
          appBar: AppBar(title: Text(arabic ? 'يونيبوك' : 'UniBook')),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.menu_book, size: 64),
                  const SizedBox(height: 16),
                  Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/signup'),
                    child: Text(subtitle, style: const TextStyle(color: Colors.blue)),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: emailLabel,
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: passLabel,
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (_) {}),
                      Text(remember),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(signIn),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
