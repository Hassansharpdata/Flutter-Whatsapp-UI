import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF121212),
      ),
      home: const MyHomePage(title: 'WhatsApp'),
    );
  }
}

// Define a User class to represent each user's data
class User {
  final String name;
  final String email;
  final String imageUrl;

  User({required this.name, required this.email, required this.imageUrl});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Widgets corresponding to each tab
  static List<Widget> _widgetOptions = <Widget>[
    ChatsScreen(), // Chats screen
    StatusScreen(), // Status screen
    CallsScreen(), // Calls screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  // A list of User objects for demonstration purposes
  final List<Map<String, dynamic>> users = [
    {
      'name': 'Albert Smith',
      'message': 'Hey, how are you?',
      'imageUrl':
          'https://img.freepik.com/free-photo/3d-illustration-teenager-with-funny-face-glasses_1142-50955.jpg'
    },
    {
      'name': 'Jessica Brown',
      'message': 'Let’s catch up soon!',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/01/97/30/70/1000_F_197307015_SMr4aoljqzLp8tTzKMQcuFEN7WtqzY0I.jpg'
    },
    {
      'name': 'Michael Scott',
      'message': 'I’ll call you later.',
      'imageUrl': ''
    },
    {
      'name': 'David Warner',
      'message': 'Check this out!',
      'imageUrl': '' // Replace with actual image URL
    },
    {
      'name': 'Tony Stark',
      'message': 'Can you send the files?',
      'imageUrl':
          'https://avatars.mds.yandex.net/i?id=b201363a2b95d849c4d6aa0e7d90ef0e27094a22-12314646-images-thumbs&n=13' // Replace with actual image URL
    },
    {
      'name': 'Bruce Wayne',
      'message': 'That’s awesome!',
      'imageUrl':
          'https://i.pinimg.com/736x/01/e2/c4/01e2c41511cac3742aa0c31725ce533b.jpg'
    },
    {
      'name': 'Diana Prince',
      'message': 'How’s your day going?',
      'imageUrl': ''
    },
    {
      'name': 'Peter Parker',
      'message': 'See you tomorrow!',
      'imageUrl':
          'https://i.pinimg.com/736x/17/7f/01/177f01a49ae1f05443d882b9079421d5.jpg'
    },
    {
      'name': 'Clark Kent',
      'message': 'I’m almost there.',
      'imageUrl':
          'https://i.pinimg.com/736x/dc/0b/d2/dc0bd23e145062dc6846bc320e4fd860.jpg'
    },
    {
      'name': 'Natasha Romanoff',
      'message': 'We need to reschedule.',
      'imageUrl':
          'https://cdna.artstation.com/p/assets/images/images/003/101/006/large/pizza-chen-b-ok.jpg?1469676324'
    },
    {
      'name': 'Wanda Maximoff',
      'message': 'Let’s grab lunch!',
      'imageUrl':
          'https://cdnb.artstation.com/p/assets/images/images/005/515/241/large/ahmx-merheb-boyalone.jpg?1491589953'
    },
    {'name': 'Steve Rogers', 'message': 'What’s up?', 'imageUrl': ''},
    {'name': 'Thor Odinson', 'message': 'I’ll text you back.', 'imageUrl': ''},
    {
      'name': 'Loki Laufeyson',
      'message': 'That was hilarious!',
      'imageUrl': ''
    },
    {'name': 'Scott Lang', 'message': 'Meeting got cancelled!', 'imageUrl': ''},
    {
      'name': 'T \'Challa',
      'message': 'Got the job!',
      'imageUrl':
          'https://avatars.mds.yandex.net/i?id=38a63c18f31f2e757f70ceee73260dcc6c8d9443-4298822-images-thumbs&n=13'
    },
    {'name': 'Nick Fury', 'message': 'Good night!', 'imageUrl': ''},
    {'name': 'Bucky Barnes', 'message': 'Let’s go for a walk.', 'imageUrl': ''},
    {
      'name': 'Bruce Banner',
      'message': 'I’m in a meeting right now.',
      'imageUrl': ''
    },
    {
      'name': 'Stephen Strange',
      'message': 'Call me when you’re free.',
      'imageUrl':
          'https://avatars.mds.yandex.net/i?id=6382130f5913e423283d569ee3c540d761620100ed8cb05e-3974798-images-thumbs&n=13'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        // leading: Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed: () => {}, icon: Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () => {}, icon: Icon(Icons.search)),
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // This opens the drawer when the icon is pressed
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        title: Text(
          widget.title, // Or 'Gradient ListTile' if you prefer
          style: const TextStyle(
            color: Colors.white, // Set title text color to white
            fontSize: 20.0, // Adjust font size if needed
          ),
        ), // title: Text('Gradient ListTile'),
        // title: Text(widget.title),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            label: 'Status',
            icon: Icon(Icons.circle_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
        ],
        currentIndex: _selectedIndex,

        selectedItemColor: Color(0xFF075E54), // WhatsApp green
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      endDrawer: Drawer(
        backgroundColor:
            Colors.grey[900], // Change drawer background color here
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user-dp.jpg'),
              ),
              accountName: Text("Albert"),
              accountEmail: Text("Albert@mail.com"),
              decoration: BoxDecoration(color: Color.fromARGB(255, 27, 41, 53)),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text('Home', style: TextStyle(color: Colors.white)),
              // onTap: null, // Add actual navigation logic here if needed
            ),
          ],
        ),
      ),
    );
  }
}

// Define your screen widgets here
class ChatsScreen extends StatelessWidget {
  // Add the list of users
  final List<Map<String, dynamic>> users = [
    {
      'name': 'Albert Smith',
      'message': 'Hey, how are you?',
      'imageUrl':
          'https://img.freepik.com/free-photo/3d-illustration-teenager-with-funny-face-glasses_1142-50955.jpg',
      'time': '10:30 AM', // Specific time
    },
    {
      'name': 'Jessica Brown',
      'message': 'Let’s catch up soon!',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/01/97/30/70/1000_F_197307015_SMr4aoljqzLp8tTzKMQcuFEN7WtqzY0I.jpg',
      'time': 'Yesterday', // "Yesterday"
    },
    {
      'name': 'Michael Scott',
      'message': 'I’ll call you later.',
      'imageUrl': '',
      'time': '3:15 PM', // Specific time
    },
    {
      'name': 'David Warner',
      'message': 'Check this out!',
      'imageUrl': '',
      'time': '14 Oct', // Specific date
    },
    {
      'name': 'Tony Stark',
      'message': 'Can you send the files?',
      'imageUrl':
          'https://avatars.mds.yandex.net/i?id=b201363a2b95d849c4d6aa0e7d90ef0e27094a22-12314646-images-thumbs&n=13',
      'time': 'Yesterday',
    },
    {
      'name': 'Bruce Wayne',
      'message': 'That’s awesome!',
      'imageUrl':
          'https://i.pinimg.com/736x/01/e2/c4/01e2c41511cac3742aa0c31725ce533b.jpg',
      'time': '10:00 AM',
    },
    {
      'name': 'Diana Prince',
      'message': 'How’s your day going?',
      'imageUrl': '',
      'time': '12:45 PM',
    },
    {
      'name': 'Peter Parker',
      'message': 'See you tomorrow!',
      'imageUrl':
          'https://i.pinimg.com/736x/17/7f/01/177f01a49ae1f05443d882b9079421d5.jpg',
      'time': '12 Oct', // Date format
    },
    {
      'name': 'Clark Kent',
      'message': 'I’m almost there.',
      'imageUrl':
          'https://i.pinimg.com/736x/dc/0b/d2/dc0bd23e145062dc6846bc320e4fd860.jpg',
      'time': 'Yesterday',
    },
    {
      'name': 'Natasha Romanoff',
      'message': 'We need to reschedule.',
      'imageUrl':
          'https://cdna.artstation.com/p/assets/images/images/003/101/006/large/pizza-chen-b-ok.jpg?1469676324',
      'time': '4:00 PM',
    },
    {
      'name': 'Wanda Maximoff',
      'message': 'Let’s grab lunch!',
      'imageUrl':
          'https://cdnb.artstation.com/p/assets/images/images/005/515/241/large/ahmx-merheb-boyalone.jpg?1491589953',
      'time': 'Yesterday',
    },
    {
      'name': 'Steve Rogers',
      'message': 'What’s up?',
      'imageUrl': '',
      'time': '9:00 AM',
    },
    {
      'name': 'Thor Odinson',
      'message': 'I’ll text you back.',
      'imageUrl': '',
      'time': '13 Oct',
    },
    {
      'name': 'Loki Laufeyson',
      'message': 'That was hilarious!',
      'imageUrl': '',
      'time': '8:20 AM',
    },
    {
      'name': 'Scott Lang',
      'message': 'Meeting got cancelled!',
      'imageUrl': '',
      'time': '11:00 AM',
    },
    {
      'name': 'T\'Challa',
      'message': 'Got the job!',
      'imageUrl':
          'https://avatars.mds.yandex.net/i?id=38a63c18f31f2e757f70ceee73260dcc6c8d9443-4298822-images-thumbs&n=13',
      'time': 'Yesterday',
    },
    {
      'name': 'Nick Fury',
      'message': 'Good night!',
      'imageUrl': '',
      'time': '10:45 PM',
    },
    {
      'name': 'Bucky Barnes',
      'message': 'Let’s go for a walk.',
      'imageUrl': '',
      'time': '14 Oct',
    },
    {
      'name': 'Bruce Banner',
      'message': 'I’m in a meeting right now.',
      'imageUrl': '',
      'time': 'Yesterday',
    },
    {
      'name': 'Stephen Strange',
      'message': 'Call me when you’re free.',
      'imageUrl':
          'https://avatars.mds.yandex.net/i?id=6382130f5913e423283d569ee3c540d761620100ed8cb05e-3974798-images-thumbs&n=13',
      'time': '9:15 AM',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: users.length, // Use the length of the users list
              itemBuilder: (context, index) {
                var user = users[index];
                return Card(
                  color: const Color.fromARGB(255, 23, 39, 39),
                  child: ListTile(
                    leading:
                        user['imageUrl'] != null && user['imageUrl'].isNotEmpty
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(user['imageUrl']),
                              )
                            : CircleAvatar(
                                child: Text(
                                  user['name']
                                      [0], // First letter of the user's name
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 7, 0, 0),
                                  ),
                                ),
                                backgroundColor: const Color.fromARGB(
                                    255, 255, 222, 133), // Set background color
                              ),
                    title: Text(user['name']),
                    subtitle: Text(user['message']),
                    trailing: Text(
                      user['time'], // Display the time here
                      style: const TextStyle(
                        color: Colors.grey, // Customize the time text style
                        fontSize: 12, // Adjust the size to fit better
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class StatusScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {
      'name': 'Albert Smith',
      'message': 'Hey, how are you?',
      'imageUrl':
          'https://img.freepik.com/free-photo/3d-illustration-teenager-with-funny-face-glasses_1142-50955.jpg',
      'time': '10:30 AM', // Specific time
    },
    {
      'name': 'Jessica Brown',
      'message': 'Let’s catch up soon!',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/01/97/30/70/1000_F_197307015_SMr4aoljqzLp8tTzKMQcuFEN7WtqzY0I.jpg',
      'time': 'Yesterday', // "Yesterday"
    },
    {
      'name': 'Michael Scott',
      'message': 'I’ll call you later.',
      'imageUrl': '',
      'time': '3:15 PM', // Specific time
    },
    {
      'name': 'David Warner',
      'message': 'Check this out!',
      'imageUrl': '',
      'time': '14 Oct', // Specific date
    },
    {
      'name': 'Tony Stark',
      'message': 'Can you send the files?',
      'imageUrl':
          'https://avatars.mds.yandex.net/i?id=b201363a2b95d849c4d6aa0e7d90ef0e27094a22-12314646-images-thumbs&n=13',
      'time': 'Yesterday',
    },
    {
      'name': 'Bruce Wayne',
      'message': 'That’s awesome!',
      'imageUrl':
          'https://i.pinimg.com/736x/01/e2/c4/01e2c41511cac3742aa0c31725ce533b.jpg',
      'time': '10:00 AM',
    },
    {
      'name': 'Diana Prince',
      'message': 'How’s your day going?',
      'imageUrl': '',
      'time': '12:45 PM',
    },
    {
      'name': 'Peter Parker',
      'message': 'See you tomorrow!',
      'imageUrl':
          'https://i.pinimg.com/736x/17/7f/01/177f01a49ae1f05443d882b9079421d5.jpg',
      'time': '12 Oct', // Date format
    },
    {
      'name': 'Clark Kent',
      'message': 'I’m almost there.',
      'imageUrl':
          'https://i.pinimg.com/736x/dc/0b/d2/dc0bd23e145062dc6846bc320e4fd860.jpg',
      'time': 'Yesterday',
    },
    {
      'name': 'Natasha Romanoff',
      'message': 'We need to reschedule.',
      'imageUrl':
          'https://cdna.artstation.com/p/assets/images/images/003/101/006/large/pizza-chen-b-ok.jpg?1469676324',
      'time': '4:00 PM',
    },
    {
      'name': 'Wanda Maximoff',
      'message': 'Let’s grab lunch!',
      'imageUrl':
          'https://cdnb.artstation.com/p/assets/images/images/005/515/241/large/ahmx-merheb-boyalone.jpg?1491589953',
      'time': 'Yesterday',
    },
    {
      'name': 'Steve Rogers',
      'message': 'What’s up?',
      'imageUrl': '',
      'time': '9:00 AM',
    },
    {
      'name': 'Thor Odinson',
      'message': 'I’ll text you back.',
      'imageUrl': '',
      'time': '13 Oct',
    },
    {
      'name': 'Loki Laufeyson',
      'message': 'That was hilarious!',
      'imageUrl': '',
      'time': '8:20 AM',
    },
    {
      'name': 'Scott Lang',
      'message': 'Meeting got cancelled!',
      'imageUrl': '',
      'time': '11:00 AM',
    },
    {
      'name': 'T\'Challa',
      'message': 'Got the job!',
      'imageUrl':
          'https://avatars.mds.yandex.net/i?id=38a63c18f31f2e757f70ceee73260dcc6c8d9443-4298822-images-thumbs&n=13',
      'time': 'Yesterday',
    },
    {
      'name': 'Nick Fury',
      'message': 'Good night!',
      'imageUrl': '',
      'time': '10:45 PM',
    },
    {
      'name': 'Bucky Barnes',
      'message': 'Let’s go for a walk.',
      'imageUrl': '',
      'time': '14 Oct',
    },
    {
      'name': 'Bruce Banner',
      'message': 'I’m in a meeting right now.',
      'imageUrl': '',
      'time': 'Yesterday',
    },
    {
      'name': 'Stephen Strange',
      'message': 'Call me when you’re free.',
      'imageUrl':
          'https://avatars.mds.yandex.net/i?id=6382130f5913e423283d569ee3c540d761620100ed8cb05e-3974798-images-thumbs&n=13',
      'time': '9:15 AM',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: ListView.builder(
          itemCount: users.length, // Use the length of the users list
          itemBuilder: (context, index) {
            var user = users[index];
            return Card(
              color: const Color.fromARGB(255, 23, 39, 39),
              child: ListTile(
                leading: user['imageUrl'] != null && user['imageUrl'].isNotEmpty
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(user['imageUrl']),
                      )
                    : CircleAvatar(
                        child: Text(
                          user['name'][0], // First letter of the user's name
                          style: const TextStyle(
                            color: Color.fromARGB(255, 7, 0, 0),
                          ),
                        ),

                        backgroundColor: const Color.fromARGB(
                            255, 255, 222, 133), // Set background color
                      ),
                title: Text(user['name']), // Display the name in the title
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        user['time'],
                        overflow:
                            TextOverflow.ellipsis, // Truncate long messages
                      ),
                    ),
                    // Text(
                    //   user['time'], // Display the time in the subtitle
                    //   style: const TextStyle(
                    //     color: Colors.grey, // Customize the time text style
                    //     fontSize: 12, // Adjust the size to fit better
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CallsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> users = [
    {
      'name': 'Albert Smith',
      'message': 'Hey, how are you?',
      'imageUrl':
          'https://img.freepik.com/free-photo/3d-illustration-teenager-with-funny-face-glasses_1142-50955.jpg',
      'time': 'October 5, 10:30 AM', // Specific time
    },
    {
      'name': 'Jessica Brown',
      'message': 'Let’s catch up soon!',
      'imageUrl':
          'https://as1.ftcdn.net/v2/jpg/01/97/30/70/1000_F_197307015_SMr4aoljqzLp8tTzKMQcuFEN7WtqzY0I.jpg',
      'time': 'Yesterday, 01:30 PM', // "Yesterday"
    },
    {
      'name': 'Michael Scott',
      'message': 'I’ll call you later.',
      'imageUrl': '',
      'time': 'Just Now', // Specific time
    },
    {
      'name': 'David Warner',
      'message': 'Check this out!',
      'imageUrl': '',
      'time': 'Yesterday, 01:30 PM', // Specific date
    },
    {
      'name': 'Tony Stark',
      'message': 'Can you send the files?',
      'imageUrl':
          'https://avatars.mds.yandex.net/i?id=b201363a2b95d849c4d6aa0e7d90ef0e27094a22-12314646-images-thumbs&n=13',
      'time': 'September 20, 10:30 AM',
    },
    {
      'name': 'Bruce Wayne',
      'message': 'That’s awesome!',
      'imageUrl':
          'https://i.pinimg.com/736x/01/e2/c4/01e2c41511cac3742aa0c31725ce533b.jpg',
      'time': 'Yesterday, 10:00 AM',
    },
    {
      'name': 'Diana Prince',
      'message': 'How’s your day going?',
      'imageUrl': '',
      'time': 'Just Now',
    },
    {
      'name': 'Peter Parker',
      'message': 'See you tomorrow!',
      'imageUrl':
          'https://i.pinimg.com/736x/17/7f/01/177f01a49ae1f05443d882b9079421d5.jpg',
      'time': 'Yesterday, 12:00 AM', // Date format
    },
    {
      'name': 'Clark Kent',
      'message': 'I’m almost there.',
      'imageUrl':
          'https://i.pinimg.com/736x/dc/0b/d2/dc0bd23e145062dc6846bc320e4fd860.jpg',
      'time': 'January 01, 03:40 PM',
    },
    {
      'name': 'Natasha Romanoff',
      'message': 'We need to reschedule.',
      'imageUrl':
          'https://cdna.artstation.com/p/assets/images/images/003/101/006/large/pizza-chen-b-ok.jpg?1469676324',
      'time': '2 minutes ago',
    },
    {
      'name': 'Wanda Maximoff',
      'message': 'Let’s grab lunch!',
      'imageUrl':
          'https://cdnb.artstation.com/p/assets/images/images/005/515/241/large/ahmx-merheb-boyalone.jpg?1491589953',
      'time': 'Yesterday',
    },
    {
      'name': 'Steve Rogers',
      'message': 'What’s up?',
      'imageUrl': '',
      'time': 'Yesterday, 10:30 AM',
    },
    {
      'name': 'Thor Odinson',
      'message': 'I’ll text you back.',
      'imageUrl': '',
      'time': '20 minutes ago',
    },
    {
      'name': 'Loki Laufeyson',
      'message': 'That was hilarious!',
      'imageUrl': '',
      'time': 'Just Now',
    },
    {
      'name': 'Scott Lang',
      'message': 'Meeting got cancelled!',
      'imageUrl': '',
      'time': 'Yesterday, 10:30 AM',
    },
    {
      'name': 'T\'Challa',
      'message': 'Got the job!',
      'imageUrl':
          'https://avatars.mds.yandex.net/i?id=38a63c18f31f2e757f70ceee73260dcc6c8d9443-4298822-images-thumbs&n=13',
      'time': 'Yesterday, 05:00 AM',
    },
    {
      'name': 'Nick Fury',
      'message': 'Good night!',
      'imageUrl': '',
      'time': '12 minutes ago',
    },
    {
      'name': 'Bucky Barnes',
      'message': 'Let’s go for a walk.',
      'imageUrl': '',
      'time': 'Just Now',
    },
    {
      'name': 'Bruce Banner',
      'message': 'I’m in a meeting right now.',
      'imageUrl': '',
      'time': 'Yesterday, 10:30 AM',
    },
    {
      'name': 'Stephen Strange',
      'message': 'Call me when you’re free.',
      'imageUrl':
          'https://avatars.mds.yandex.net/i?id=6382130f5913e423283d569ee3c540d761620100ed8cb05e-3974798-images-thumbs&n=13',
      'time': 'April 30,9:15 AM',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
        child: ListView.builder(
          itemCount: users.length, // Use the length of the users list
          itemBuilder: (context, index) {
            var user = users[index];
            return Card(
              color: const Color.fromARGB(255, 23, 39, 39),
              child: ListTile(
                leading: user['imageUrl'] != null && user['imageUrl'].isNotEmpty
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(user['imageUrl']),
                      )
                    : CircleAvatar(
                        child: Text(
                          user['name'][0], // First letter of the user's name
                          style: const TextStyle(
                            color: Color.fromARGB(255, 7, 0, 0),
                          ),
                        ),
                        backgroundColor: const Color.fromARGB(
                            255, 255, 222, 133), // Set background color
                      ),
                title: Text(user['name']), // Display the name in the title
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        user['time'],
                        overflow:
                            TextOverflow.ellipsis, // Truncate long messages
                      ),
                    ),
                  ],
                ),
                trailing: Icon(Icons.call_outlined),
                iconColor: Colors.teal,
              ),
            );
          },
        ),
      ),
    );
  }
}
