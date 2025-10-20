import 'package:flutter/material.dart';
import 'lang.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isArabic,
      builder: (context, arabic, _) {
        final title = arabic ? 'يونيبوك' : 'UniBook';
        final welcome = arabic ? 'مرحبًا بكم في UniBook' : '📚 Welcome to UniBook';
        final subtitle = arabic
            ? 'وجهتك الموثوقة لشراء الكتب الجامعية بسهولة.'
            : 'Your trusted place to buy university books easily.';
        final explore = arabic ? 'استكشف الكتب' : 'Explore Books';
        final aboutTitle = arabic ? 'عن UniBook' : 'About UniBook';
        final aboutText = arabic
            ? 'UniBook هو منصة رقمية لطلاب الجامعات لشراء الكتب الدراسية بسهولة.'
            : 'UniBook is a digital platform made for university students to buy and access academic books easily and affordably.';
        final missionTitle = arabic ? 'مهمتنا' : 'Our Mission';
        final missionText = arabic
            ? 'جعل مصادر التعلم متاحة وبأسعار مناسبة لكل طالب جامعي.'
            : 'To make learning resources more accessible and affordable for every university student.';
        final servicesTitle = arabic ? 'خدماتنا' : 'Our Services';
        final servicesList = arabic
            ? ['مجموعة واسعة من الكتب', 'أسعار تنافسية', 'توصيل سريع وآمن', 'دعم 24/7']
            : ['Wide Range of Books', 'Affordable Prices', 'Fast & Secure Delivery', '24/7 Support'];
        final quickLinks = arabic ? 'روابط سريعة' : 'Quick Links';
        final contactUs = arabic ? 'تواصل معنا' : 'Contact Us';
        final login = arabic ? 'تسجيل الدخول' : 'Login';
        final signup = arabic ? 'إنشاء حساب' : 'Sign Up';
        final langLabel = arabic ? 'EN | الع' : 'EN | AR';

        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: [
              TextButton(
                onPressed: () {
                  isArabic.value = !isArabic.value;
                },
                child: Text(langLabel, style: const TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: Text(login, style: const TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(signup, style: const TextStyle(color: Colors.white)),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(welcome, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                const SizedBox(height: 10),
                Text(subtitle, textAlign: TextAlign.center),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () {}, child: Text(explore)),
                const SizedBox(height: 24),
                Align(alignment: Alignment.centerLeft, child: Text(aboutTitle, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                const SizedBox(height: 8),
                Text(aboutText),
                const SizedBox(height: 18),
                Align(alignment: Alignment.centerLeft, child: Text(missionTitle, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                const SizedBox(height: 8),
                Text(missionText),
                const SizedBox(height: 18),
                Align(alignment: Alignment.centerLeft, child: Text(servicesTitle, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                const SizedBox(height: 8),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: servicesList.map((s) => Text('• \$s'.replaceAll('\\$s', s))).toList()),
                const SizedBox(height: 24),
                Align(alignment: Alignment.centerLeft, child: Text(quickLinks, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                const SizedBox(height: 8),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  InkWell(onTap: () => Navigator.pushNamed(context, '/signin'), child: Text('- ' + (arabic ? 'تسجيل الدخول' : 'Login'))),
                  InkWell(onTap: () => Navigator.pushNamed(context, '/signup'), child: Text('- ' + (arabic ? 'إنشاء حساب' : 'Sign Up'))),
                  Text('- ' + (arabic ? 'حولنا' : 'About')),
                  Text('- ' + (arabic ? 'مركز المساعدة' : 'Help Center')),
                ]),
                const SizedBox(height: 20),
                Align(alignment: Alignment.centerLeft, child: Text(contactUs, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                const SizedBox(height: 8),
                Text('support@unibook.com'),
                Text('+962 7 9999 9999'),
                const SizedBox(height: 40),
                const Text('© 2025 UniBook'),
              ],
            ),
          ),
        );
      },
    );
  }
}
