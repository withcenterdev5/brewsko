import 'package:brewsko/router/router.dart';
import 'package:brewsko/user.pages/profile.screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const LoginScreen());
}

class LoginScreen extends StatefulWidget {
  static const String routeName = '/';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    UserService.instance.init(adminUid: myUid ?? '');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FireFlutterService.instance.init(
        context: router.routerDelegate.navigatorKey.currentContext!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserReady(
        builder: (user) => user == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          elevatedButtonTheme: ElevatedButtonThemeData(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColorDark,
                              minimumSize: Size(constraints.maxWidth - 40, 40),
                              // maximumSize: Size(constraints.minWidth, 50),
                            ),
                          ),
                        ),
                        child: Card(
                          elevation: 1,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: EmailLoginForm(
                              passwordPadding: const EdgeInsets.only(bottom: 20),
                              register: false,
                              onLogin: () => context.push(ProfileScreen.routeName),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              )
            : const ProfileBody(),
      ),
    );
  }
}
