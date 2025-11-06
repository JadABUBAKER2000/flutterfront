import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/input_field.dart';
import '../../widgets/rounded_button.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController firstC;
  late TextEditingController lastC;
  late TextEditingController emailC;
  bool editing = false;

  @override
  void initState() {
    super.initState();
    final auth = Provider.of<AuthProvider>(context, listen: false);
    firstC = TextEditingController(text: auth.user?.firstName ?? '');
    lastC = TextEditingController(text: auth.user?.lastName ?? '');
    emailC = TextEditingController(text: auth.user?.email ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    if (auth.user == null) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/'));
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        actions: [
          IconButton(onPressed: () async {
            await auth.logout();
            Navigator.pushReplacementNamed(context, '/');
          }, icon: Icon(Icons.logout, color: Colors.black))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              SizedBox(height: 8),
              CircleAvatar(radius: 46, backgroundImage: AssetImage('assets/images/placeholder.png')),
              SizedBox(height: 12),
              editing ? Container() : Text('${auth.user!.firstName} ${auth.user!.lastName}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              editing ? Container() : Text(auth.user!.email),
              SizedBox(height: 14),
              Expanded(
                child: Column(
                  children: [
                    InputField(controller: firstC, label: 'First Name / الاسم الأول'),
                    SizedBox(height: 10),
                    InputField(controller: lastC, label: 'Last Name / اسم العائلة'),
                    SizedBox(height: 10),
                    InputField(controller: emailC, label: 'Email / البريد الإلكتروني'),
                  ],
                )
              ),
              Row(
                children: [
                  Expanded(child: OutlinedButton(onPressed: () {
                    setState(() {
                      editing = !editing;
                    });
                  }, child: Text(editing ? 'Cancel / إلغاء' : 'Edit / تعديل'))),
                  SizedBox(width: 12),
                  Expanded(child: RoundedButton(label: 'Save / حفظ', onPressed: () async {
                    final err = await auth.updateProfile(firstC.text.trim(), lastC.text.trim(), emailC.text.trim());
                    if (err != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
                      return;
                    }
                    setState(() { editing = false; });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile updated / تم تحديث الملف الشخصي')));
                  })),
                ],
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
