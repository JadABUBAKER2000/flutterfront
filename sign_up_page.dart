import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/input_field.dart';
import '../../widgets/rounded_button.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstC = TextEditingController();
  final lastC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, leading: BackButton(color: Colors.black)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 12),
              Image.asset('assets/images/logo.png', height: 80),
              SizedBox(height: 8),
              Text('Sign Up / تسجيل جديد', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 14),
              InputField(controller: firstC, label: 'First Name / الاسم الأول'),
              SizedBox(height: 12),
              InputField(controller: lastC, label: 'Last Name / اسم العائلة'),
              SizedBox(height: 12),
              InputField(controller: emailC, label: 'Email / البريد الإلكتروني'),
              SizedBox(height: 12),
              InputField(controller: passC, label: 'Password / كلمة المرور', obscure: true),
              SizedBox(height: 18),
              RoundedButton(
                label: 'Sign Up / تسجيل',
                loading: auth.loading,
                onPressed: () async {
                  final first = firstC.text.trim();
                  final last = lastC.text.trim();
                  final email = emailC.text.trim();
                  final pass = passC.text;
                  if (first.isEmpty || last.isEmpty || email.isEmpty || pass.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields / الرجاء تعبئة جميع الحقول')));
                    return;
                  }
                  final err = await auth.signUp(first, last, email, pass);
                  if (err != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
                    return;
                  }
                  Navigator.pushReplacementNamed(context, '/products');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
