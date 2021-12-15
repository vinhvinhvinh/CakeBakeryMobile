
import 'package:flutter/material.dart';


  
class NavigationBar extends StatefulWidget {  
  NavigationBar ({Key? key}) : super(key: key);  
  
  @override  
  NavigationBarState createState() => NavigationBarState();  
}  
  
class NavigationBarState extends State<NavigationBar> {  
  int _selectedIndex = 0;  
  static const List<Widget> _widgetOptions = <Widget>[  
    Text('Home', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    Text('Cart', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    Text('Favourite', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    Text('Personal', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
  ];  
  
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(   
      bottomNavigationBar: BottomNavigationBar(  
        items: const <BottomNavigationBarItem>[  
          BottomNavigationBarItem(  
            icon: Icon(Icons.home),  
            label:"Home",
            backgroundColor: Colors.green  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.shopping_cart),  
            label:"Cart",
            backgroundColor: Colors.yellow  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.person),  
            label:"Favourite",
            backgroundColor: Colors.blue,  
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.person),  
            label:"Personal",
            backgroundColor: Colors.blue,  
          ),  
        ],  
        // type: BottomNavigationBarType.shifting,  
        currentIndex: _selectedIndex,  
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xFF43cea2).withOpacity(0.9),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,  
        elevation: 5  
      ),  
    );  
  }  
}  