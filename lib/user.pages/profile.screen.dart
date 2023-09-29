import 'package:brewsko/router/router.dart';
import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/ProfileScreen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        forceMaterialTransparency: true,
        elevation: 0,
      ),
      body: SizedBox(
        width: size.width,
        child: const Column(
          children: [
            UserBuilder(),
          ],
        ),
      ),
    );
  }
}

class UserBuilder extends StatelessWidget {
  const UserBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return UserDoc(builder: (user) {
      debugPrint('$user');
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserProfileAvatar(
            radius: 20,
            user: user,
            size: 100,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _textBuilder(context, my.email),
              _textBuilder(context, my.uid),
              _textBuilder(context, my.hasPhotoUrl.toString()),
            ],
          )
        ],
      );
    });
  }

  Widget _textBuilder(BuildContext context, String item) {
    return Text(
      item,
      style: TextStyle(
        color: Theme.of(context).shadowColor,
      ),
    );
  }
}
