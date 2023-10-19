import 'package:flutter/material.dart';
import 'package:kg_app/thumbnail.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF026279),
        centerTitle: false,
        title: const Text('List'),
        actions: [
          TextButton(
            onPressed: () {
              // Handle the "Learn More" button action
            },
            child: const Text(
              'Learn Mode',
              style: TextStyle(
                color: Colors.white, // Set the text color
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add your search functionality here
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'img/bg_image.jpg',
            ), // Replace with your image asset path
            fit: BoxFit.cover, // You can customize the fit as needed
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: <Widget>[
            InkWell(
              onTap: () {
                // Add your navigation logic here
                // For example, you can navigate to a new screen using Navigator:
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      // Replace 'YourNewScreen()' with the widget for your new screen
                      return ThumbnailPage();
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color(0xFFffcaca),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // To space items evenly
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              'img/apple1.jpg',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Expanded(
                          // Wrap the Column with Expanded
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fruits',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              // Add more widgets here if needed
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(
                              25.0), // Adjust the padding as needed
                          child: Icon(
                            Icons.arrow_forward, // Add your forward icon here
                            size: 24.0, // Customize the icon size as needed
                            color: Colors
                                .black, // Customize the icon color as needed
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0), // Set the top padding value as needed
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color(0xFFffedc1),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              'img/veg.webp',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vegetables',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            // Add more widgets here if needed
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0), // Set the top padding value as needed
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color(0xFFfeffb8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              'img/doctor.jpg',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jobs',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            // Add more widgets here if needed
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0), // Set the top padding value as needed
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color(0xFFc4ffcb),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              'img/wild_animals.webp',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wild Animals',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            // Add more widgets here if needed
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0), // Set the top padding value as needed
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color(0xFFacddeb),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              'img/birds.jpg',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Birds',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            // Add more widgets here if needed
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0), // Set the top padding value as needed
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color(0xFFffcaca),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              'img/insects.webp',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Insects',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            // Add more widgets here if needed
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0), // Set the top padding value as needed
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color(0xFFffedc1),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              'img/kitchen.jpg',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kitchen Things',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            // Add more widgets here if needed
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0), // Set the top padding value as needed
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color(0xFFfeffb8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              'img/sports.jpg',
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sports',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            // Add more widgets here if needed
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 15.0), // Set the top padding value as needed
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(16.0),
                    color: const Color(0xFFc4ffcb),
                    child: SizedBox(
                      width: double.infinity,
                      height: 80.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                'img/domestic_animal.jpg',
                                width: 100.0,
                                height: 100.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Domestic Animals',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              // Add more widgets here if needed
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
