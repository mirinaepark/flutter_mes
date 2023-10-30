import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/splash_img.png',
            ),
            const Text(
              'loading...',
              style: TextStyle(color: Colors.white),
            ),
            const Text(
              'Copyright mrnstudio',
              style: TextStyle(color: Colors.white),
            ),
          ],

        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value){
      Navigator.pushReplacementNamed(context, '/home');
    });

  }
}



