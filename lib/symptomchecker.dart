import 'package:flutter/material.dart';
import 'criticalemergency.dart';

class SymptomCheckerPage extends StatefulWidget {
  const SymptomCheckerPage({super.key});

  @override
  _SymptomCheckerPageState createState() => _SymptomCheckerPageState();
}

class _SymptomCheckerPageState extends State<SymptomCheckerPage> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CriticalEmergencyPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
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
          leading: IconButton(
            icon: const Icon(Icons.notifications, size: 28, color: Colors.white),
            onPressed: () {
              // Handle notification action
            },
          ),
          title: const Text(
            'First Aid',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle, size: 28, color: Colors.white),
              onPressed: () {
                // Handle profile action
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSymptomCard(
              context,
              'Molluscum Contagiosum',
              'A viral skin infection that’s very common in children.',
              0.9,
            ),
            const SizedBox(height: 16),
            _buildSymptomCard(
              context,
              'Headache',
              'Pain or discomfort in the head or scalp, often caused by stress or dehydration.',
              0.8,
            ),
            const SizedBox(height: 16),
            _buildSymptomCard(
              context,
              'Fever',
              'A temporary increase in body temperature, often due to an infection.',
              0.5,
            ),
            const SizedBox(height: 16),
            _buildSymptomCard(
              context,
              'Sore Throat',
              'A painful, dry, or scratchy feeling in the throat, commonly a symptom of a cold.',
              0.7,
            ),
            const SizedBox(height: 16),
            _buildSymptomCard(
              context,
              'Cough',
              'A reflex action to clear the airways, often a symptom of a cold or respiratory infection.',
              0.6,
            ),
            const SizedBox(height: 16),
            _buildSymptomCard(
              context,
              'Runny Nose',
              'Excess nasal drainage, often clear and thin, commonly due to allergies or infections.',
              0.4,
            ),
          ],
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
            icon: Icon(Icons.play_circle, size: 26),
            label: 'Play',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sick, size: 26),
            label: 'Symptom',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error, size: 26),
            label: 'Alert',
          ),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSymptomCard(BuildContext context, String name, String description, double frequencyValue) {
    Color frequencyColor = frequencyValue > 0.6 ? Colors.red : Colors.green;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: frequencyValue,
                            child: Container(
                              decoration: BoxDecoration(
                                color: frequencyColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${(frequencyValue * 100).toStringAsFixed(0)}%',
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            const Icon(
              Icons.sick,
              size: 50,
              color: Colors.blue,
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.add_circle, size: 30, color: Colors.blue),
              onPressed: () {
                // Handle add action
              },
            ),
          ],
        ),
      ),
    );
  }
}
