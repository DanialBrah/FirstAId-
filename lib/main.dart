import 'package:flutter/material.dart';

class CriticalEmergencyPage extends StatefulWidget {
  const CriticalEmergencyPage({super.key});

  @override
  _CriticalEmergencyPageState createState() => _CriticalEmergencyPageState();
}

class _CriticalEmergencyPageState extends State<CriticalEmergencyPage> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            'First Aid',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            shrinkWrap: true,
            children: <Widget>[
              _buildCircularButton(Icons.local_hospital, 'Ambulance'),
              _buildCircularButton(Icons.phone, 'Call'),
              _buildCircularButton(Icons.mic, 'Speak'),
              _buildCircularButton(Icons.chat_bubble, 'Message'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 26),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, size: 26),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow, size: 26),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 26),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outline, size: 26),
            label: 'Alert',
          ),
        ],
        selectedItemColor: Colors.deepPurple, // Changed to match main.dart
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCircularButton(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.lightBlueAccent, // You can change this if needed
          ),
          padding: const EdgeInsets.all(20),
          child: Icon(icon, size: 48, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold), // Changed text color to black
        ),
      ],
    );
  }
}
