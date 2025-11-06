import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class ProductsPlaceholderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products (placeholder) / المنتجات (تجريبية)', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/profile'), icon: Icon(Icons.person, color: Colors.black))
        ],
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Products area — person 2 will implement this / منطقة المنتجات - سيتم تنفيذها من عضو 2', textAlign: TextAlign.center),
          SizedBox(height: 16),
          ElevatedButton(onPressed: () => auth.logout(), child: Text('Logout / تسجيل خروج')),
        ]),
      ),
    );
  }
}
