import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 3));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mrn MES'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[400],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[350],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 130,
                child: const DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('사원명 :'),
                      Text('사원번호 :'),
                    ],
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.add),
                title: Text('생산 현장 조회'),
              ),
              const ListTile(
                leading: Icon(Icons.add),
                title: Text('생산 일정 관리'),
              ),
              const ListTile(
                leading: Icon(Icons.add),
                title: Text('생산 현황 조회'),
              ),
              const ListTile(
                leading: Icon(Icons.add),
                title: Text('재고 관리'),
              ),
            ],
          ),
        ),
      ),
      body: DefaultTextStyle.merge(
        style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('미리내'),
              Text('화이팅'),
              Text('너는'),
              Text('할 수 있어'),
            ],
          ),
        ),
      ),
    );
  }
}
