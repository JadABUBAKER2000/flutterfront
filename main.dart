import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'routes.dart';
import 'screens/auth/sign_in.dart';
import 'screens/products_placeholder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(UniBookApp());
}

class UniBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider()..init(),
      child: MaterialApp(
        title: 'unibook',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.white, iconTheme: IconThemeData(color: Colors.black)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              minimumSize: Size(double.infinity, 48),
            ),
          ),
        ),
        initialRoute: '/',
        routes: appRoutes,
      ),
    );
  }
}
