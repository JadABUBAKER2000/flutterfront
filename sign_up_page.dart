import 'package:flutter/material.dart';
import 'lang.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fullNameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return ValueListenableBuilder<bool>(
      valueListenable: isArabic,
      builder: (context, arabic, _) {
        final title = arabic ? 'إنشاء حساب' : 'Create your account';
        final subtitle = arabic ? 'أو سجّل الدخول لحسابك' : 'Or sign in to your existing account';
        final nameLabel = arabic ? 'الاسم الكامل' : 'Full Name';
        final emailLabel = arabic ? 'البريد الإلكتروني' : 'Email address';
        final phoneLabel = arabic ? 'رقم الهاتف' : 'Phone Number';
        final passLabel = arabic ? 'كلمة المرور' : 'Password';
        final confirmLabel = arabic ? 'تأكيد كلمة المرور' : 'Confirm Password';
        final agreeText = arabic ? 'أوافق على الشروط' : 'I agree to the Terms and Conditions';
        final create = arabic ? 'إنشاء حساب' : 'Create account';

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
                  Text(subtitle, style: const TextStyle(color: Colors.blue)),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: fullNameController,
                    decoration: InputDecoration(
                      labelText: nameLabel,
                      prefixIcon: const Icon(Icons.person_outline),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
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
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: phoneLabel,
                      prefixIcon: const Icon(Icons.phone_outlined),
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
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: confirmLabel,
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (_) {}),
                      Text(agreeText),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(onPressed: () {} , child: Text(create)),
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
