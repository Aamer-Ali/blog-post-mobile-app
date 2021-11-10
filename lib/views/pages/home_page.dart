import 'package:blog_post/views/pages/post_list_page.dart';
import 'package:blog_post/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [PostListPage(), ProfilePage()];
  final _pageController = PageController();
  var _appBarElevation = 5.0;
  var _appBarTitle = "Blog-posts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        elevation: _appBarElevation,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.blog), label: "Posts"),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.users), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[900],
        onTap: (index) {
          setState(() {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut);
            if (index == 0) {
              // _appBarElevation = 5.0;
              _appBarTitle = "Blog-posts";
            } else {
              // _appBarElevation = 5.0;
              _appBarTitle = "Profile";
            }
          });
        },
      ),
      body: SafeArea(
          child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: const [PostListPage(), ProfilePage()],
      )
          // child: Center(
          //   child: _widgetOptions.elementAt(_selectedIndex),
          // ),
          ),
    );
  }
}
