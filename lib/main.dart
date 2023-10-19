import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kg_app/learn.dart';
import 'package:kg_app/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Check if the "Home" tab is clicked
      if (_selectedIndex == 0) {
        // Navigate to the TestPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      } else if (_selectedIndex == 1) {
        // Navigate to the TestPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ListPage()),
        );
      } else if (_selectedIndex == 2) {
        // Navigate to the TestPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Testpage()),
        );
      }
      ;
    });
  }

  // Define the pages for each tab
  // ignore: unused_field
  final List<Widget> _pages = [
    // Your pages go here
    // Replace with the widgets you want to display for each tab~
    const Placeholder(), // Placeholder for the Home page
    const Placeholder(), // Placeholder for the Favorites page
    const Placeholder(), // Placeholder for the Search page
    const Placeholder(), // Placeholder for the Profile page
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 90.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: 16.0), // Set your desired right padding value
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                _scaffoldKey.currentState!
                    .openEndDrawer(); // Open the end drawer
              },
            ),
          ),
        ],
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'img/app_bar_bg.webp',
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('img/app bar logo.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                const Text(
                  'KG App',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      endDrawer: Padding(
        padding: const EdgeInsets.only(
            bottom: 150.0, right: 10), // Set the desired padding here
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(16.0), // Set the desired border radius here
          child: SizedBox(
            width: 220,
            height: 540,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/drawer bg.jpg'),
                        fit: BoxFit.fill, // Replace with your image path
                        // You can adjust the BoxFit as needed
                      ),
                    ),
                    padding: const EdgeInsets.all(5.0),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(
                              'img/app bar logo2.jpg'), // Set your image here
                          radius: 50.0,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'KG App',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons
                        .home), // Replace Icons.add_box with the desired icon
                    title: const Text('Home'),
                    titleTextStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                      );
                      // Add the functionality you want when this end drawer item is tapped.
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons
                        .book_online_rounded), // Replace Icons.directions_car with the desired icon
                    title: const Text('Learn'),
                    titleTextStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListPage()),
                      );
                      // Add the functionality you want when this end drawer item is tapped.
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons
                        .text_snippet), // Replace Icons.person with the desired icon
                    title: const Text('Test'),
                    titleTextStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Testpage(),
                        ),
                      );
                      // Add the functionality you want when this end drawer item is tapped.
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                        Icons.score_sharp), // Replace with the desired icon
                    title: const Text('Score'),
                    titleTextStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const MapPage(),
                      //   ),
                      // );
                      // Add the functionality you want when this ListTile is tapped.
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                        Icons.person), // Replace with the desired icon
                    title: const Text('About'),
                    titleTextStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const MapPage(),
                      //   ),
                      // );
                      // Add the functionality you want when this ListTile is tapped.
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                        Icons.settings), // Replace with the desired icon
                    title: const Text('Settings'),
                    titleTextStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const MapPage(),
                      //   ),
                      // );
                      // Add the functionality you want when this ListTile is tapped.
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                        Icons.exit_to_app), // Replace with the desired icon
                    title: const Text('Exit'),
                    titleTextStyle:
                        const TextStyle(fontSize: 16, color: Colors.black),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const MapPage(),
                      //   ),
                      // );
                      // Add the functionality you want when this ListTile is tapped.
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // ... Rest of your Scaffold code

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 0.0,
          ),
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'img/hb_1.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'img/hb_2.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'img/hb_3.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'img/hb_4.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                ),
              ),
              Stack(
                children: [
                  // Background Image
                  Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('img/score_board.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                  // Padding with Content
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10, bottom: 15, top: 23),
                    child: SizedBox(
                      width: double.infinity,
                      height: 80.0,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: FlexColumnWidth(
                                1), // Use flex for all columns to make them equal
                            1: FlexColumnWidth(1),
                            2: FlexColumnWidth(1),
                          },
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(
                              decoration: const BoxDecoration(
                                color: Color(0xFFc4ffcb),
                              ),
                              children: [
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    child: const Text(
                                      'Total Test',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    child: const Text(
                                      'Total Score',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: const Text(
                                      'Average',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    child: Text('55'),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    child: const Text(
                                      '80/110',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text('80.5 %'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 0.0,
              ),
              const SizedBox(
                height: 0.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 0, top: 0), // Add margin to the container
                child: Container(
                  width: double.infinity,
                  height: 300.0,
                  decoration: BoxDecoration(
                    // Set the background image here
                    image: const DecorationImage(
                      image: AssetImage(
                          'img/bk.jpg'), // Replace with your image path
                      fit: BoxFit.fill, // You can adjust the fit as needed
                    ),
                    borderRadius:
                        BorderRadius.circular(0.0), // Set the border radius
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.5), // Shadow color
                    //     spreadRadius: 3, // Spread radius
                    //     blurRadius: 5, // Blur radius
                    //     offset:
                    //         const Offset(0, 2), // Offset (horizontal, vertical)
                    //   ),
                    // ],
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(
                        20.0), // Add padding to the container
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 100.0), // Add padding to the button
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const ListPage(),
                                      ),
                                    );
                                    // Handle button 1 press
                                  },
                                  // ignore: sort_child_properties_last
                                  child: const Text(
                                    'Learn',
                                    style: TextStyle(
                                      fontSize: 18, // Set the font size
                                      fontWeight: FontWeight
                                          .bold, // Set font weight to bold
                                      color: Colors
                                          .white, // Set text color to white
                                      // You can add more properties like letterSpacing, fontFamily, etc.
                                    ),
                                  ),
                                  // ignore: sort_child_properties_last

                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(150.0, 50.0),
                                    backgroundColor:
                                        const Color.fromARGB(255, 48, 134, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 40.0,
                                    top: 5), // Add padding to the button
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const Testpage(),
                                      ),
                                    );
                                    // Handle button 2 press
                                    // ignore: sort_child_properties_last
                                  },
                                  // ignore: sort_child_properties_last
                                  child: const Text(
                                    'Test',
                                    style: TextStyle(
                                      fontSize: 18, // Set the font size
                                      fontWeight: FontWeight
                                          .bold, // Set font weight to bold
                                      color: Colors
                                          .white, // Set text color to white
                                      // You can add more properties like letterSpacing, fontFamily, etc.
                                    ),
                                  ),
                                  // ignore: sort_child_properties_last

                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(150.0, 50.0),
                                    backgroundColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_online_rounded),
              label: 'Learn',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet),
              label: 'Test',
              // Set the font size here
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF026279),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          selectedLabelStyle:
              const TextStyle(fontSize: 18.0), // Set the font size here
          unselectedLabelStyle: const TextStyle(fontSize: 14.0),
        ),
      ),
    ));
  }
}
