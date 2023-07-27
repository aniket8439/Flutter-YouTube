import 'package:flutter/material.dart';
import '/pages/home.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: const [
        Icon(Icons.search),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.cast),
        SizedBox(
          width: 10,
        ),
        Icon(Icons.notifications),
        SizedBox(
          width: 30,
        )
      ],
      title: SizedBox(
          height: 90,
          child: Image.network(
              "https://cdn.iconscout.com/icon/free/png-256/free-youtube-86-226404.png")),
    );
  }

  List<BottomNavigationBarItem> _getItems() {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(
          icon: Icon(Icons.subscriptions), label: 'Subscriptions'),
      BottomNavigationBarItem(icon: Icon(Icons.library_add), label: 'Library')
    ];
  }

  List<Widget> _screens() {
    return [Home(), Text("Subscriptions"), Text("Library")];
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _screens()[index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int currentIndex) {
            index = currentIndex;
            setState(() {
              
            });
          },
          currentIndex: index,
          items: _getItems()),
    );
  }
}
