import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_mes/api/user_api.dart';
import 'package:flutter_mes/service/user_service.dart';
import 'models/user_model.dart';
import 'production_status.dart';
import 'schedule.dart';
import 'stock_check.dart';
import 'home_page.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 1));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
  User? user;
  String userName = '';
  String userNum = '';

  int _bottomItemIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserApi.getUserApi().then((value) {
        UserService.getUserInfoById(1).then((value) {
          setState(() {
            user = value;

            if (value != null) {
              userName = value.name;
              userNum = value.phone;
            }
          });
        });
    });
  }

  // BottonNabigatorBar의 Index에 따라 페이지 이동
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ProductionStatusScreen(),
    Schedule(),
    StockCheck(),
  ];

  // 콜백함수
  void _onItemTapped(int index) {
    setState(() {
      _bottomItemIndex = index;
    });
  }

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
                child: DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('사원명 : $userName'),
                      Text('사원번호 : $userNum'),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('생산 현장 조회'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ProductionStatusScreen()));
                },
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
      body: Center(
        child: _widgetOptions.elementAt(_bottomItemIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[350],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "생산현황",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "생산일정",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "재고관리",
          ),
        ],
        currentIndex: _bottomItemIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
