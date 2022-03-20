import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sravel/screens/signin_screen.dart';
import 'package:sravel/screens/signup_screen.dart';
import 'package:sravel/screens/signupin_screen.dart';
import 'package:sravel/utils/constants.dart';
import 'package:sravel/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //비동기 함수 실행 시 필요

  //가로 모드 허용하지 않음.
  SystemChrome.setPreferredOrientations(// --- (3)
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          indicatorColor: kPrimaryColor,
          focusColor: kPrimaryColor,
          highlightColor: kPrimaryColor,
          fontFamily: 'Noto_Sans_KR',
          textTheme: TextTheme(
            titleLarge: TextStyle(
              letterSpacing: -2.84,
              fontWeight: FontWeight.w900,
              fontSize: 50.sp,
              color: Colors.black,
            ),
            titleSmall: TextStyle(
              letterSpacing: -2.84,
              fontWeight: FontWeight.w900,
              fontSize: 25.sp,
              color: Colors.black,
            ),
            headlineLarge: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22.sp,
              color: Colors.black,
            ),
            headlineMedium: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
              color: Colors.black,
            ),
            headlineSmall: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: Colors.black,
            ),
            bodyLarge: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            bodyMedium: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            bodySmall: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w500),
          ),
        ),
        home: const SignUpInPage(),
        getPages: [
          GetPage(name: '/signin', page: () => const SignInPage()),
          GetPage(name: '/signup', page: () => const SignUpPage()),
          GetPage(name: '/signupin', page: () => const SignUpInPage()),
        ],
        // home: const MainPage(title: 'SRAVEL'),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; //맨 처음은 홈으로
  final List<Widget> _widgetOptions = [
    const HomePage(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  // 아이콘이 클릭되었을 때의 이벤트 리스너
  // 클릭된 인덱스로 _selectedIndex에 할당하고 build 함수를 호출한다(setState)
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        centerTitle: false,
        actions: [
          /*-------------profile------------*/
          Padding(
            padding: EdgeInsets.all(20.w),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 30.r,
              child: Padding(
                padding: EdgeInsets.all(3.w),
                child: CircleAvatar(
                  radius: 28.r,
                  backgroundImage: const AssetImage('assets/images/meme.jpeg'),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'HOT',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: '커뮤니티',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '새소식',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
