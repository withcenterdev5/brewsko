import 'package:brewsko/bottom.navbar.dart';
import 'package:brewsko/router/router.dart';
import 'package:fireflutter/fireflutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SizedBox(
        width: size.width,
        child: Column(
          children: [
            const UserBuilder(),
            const Spacer(),
            SizedBox(
              height: size.height / 1.6,
              child: const UserContent(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: index),
    );
  }
}

class UserBuilder extends StatelessWidget {
  const UserBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return UserDoc(builder: (user) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserProfileAvatar(
            radius: 20,
            user: user,
            size: 100,
            upload: true,
            // galleryOnly: true,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _textBuilder(context, my.email, true),
              _textBuilder(context, my.uid, false),
              _textBuilder(context, my.hasPhotoUrl.toString(), false),
            ],
          ),
        ],
      );
    });
  }

  Widget _textBuilder(BuildContext context, String item, bool isHighlight) {
    return Text(
      item,
      style: TextStyle(
        color: isHighlight ? Theme.of(context).shadowColor : Theme.of(context).hintColor,
        fontSize: isHighlight ? 24 : 16,
        letterSpacing: -1,
        fontWeight: isHighlight ? FontWeight.w600 : FontWeight.normal,
      ),
      softWrap: true,
    );
  }
}

class UserContent extends StatelessWidget {
  const UserContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        // elevation: 20,
        borderOnForeground: true,
        child: GridView.custom(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            repeatPattern: QuiltedGridRepeatPattern.same,
            pattern: [
              const QuiltedGridTile(1, 1),
              const QuiltedGridTile(1, 1),
              const QuiltedGridTile(1, 1),
              const QuiltedGridTile(1, 1),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => Placeholder(
              strokeWidth: .2,
              child: Center(
                child: Text('$index'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
