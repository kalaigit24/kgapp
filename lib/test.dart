import 'package:flutter/material.dart';

class Testpage extends StatefulWidget {
  const Testpage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TestpageState createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  final List<String> photoPaths = [
    'img/apple.jpg',
    'img/Avocado-fruits.webp',
    'img/Fresh-Green-Grapes.jpg',
    'img/fresh-mango-fruits.jpg',
  ];

  String selectedFruit = ''; // Track the selected fruit
  String selectedGif = ''; // Track the selected GIF

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF026279),
        centerTitle: true,
        title: const Text('Test'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/bg_image.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Material(
                    elevation:
                        5, // Set the elevation value to control the shadow effect
                    borderRadius: BorderRadius.circular(
                        8), // Optional: Set border radius for rounded corners
                    child: Container(
                      padding: EdgeInsets.all(20), // Add padding if needed
                      decoration: BoxDecoration(
                        color: Colors.white, // Set background color to white
                        border: Border.all(
                          color: Colors.black, // Set border color to black
                          width: 1, // Set border width
                        ),
                        borderRadius: BorderRadius.circular(
                            8), // Optional: Set border radius for rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Text(
                        '1. Choose the correct picture for apple from the pictures below:', // Add a title
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                // Display photos in a column
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 40.0), // Adjust the left padding as needed
                  child: Wrap(
                    alignment: WrapAlignment.center, // Center the images
                    children: [
                      for (var i = 0; i < photoPaths.length; i++)
                        if (i < photoPaths.length)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedFruit = photoPaths[i];
                                _showGifDialog(); // Show the GIF immediately
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60.0),
                                color: selectedFruit == photoPaths[i]
                                    ? Colors.green // Highlight selected fruit
                                    : Colors.white,
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: ClipOval(
                                child: Image.asset(
                                  photoPaths[i],
                                  width: 110,
                                  height: 110,
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showGifDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String gifAsset = '';
        if (selectedFruit == 'img/apple.jpg') {
          gifAsset = 'img/welldone.gif'; // Replace with your apple GIF asset
        } else {
          gifAsset = 'img/wrong.gif'; // Replace with your banana GIF asset
        }

        return Stack(
          children: [
            // Background with transparency
            Container(
              color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
            ),
            // Centered content
            Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 200, // Adjust width as needed
                      height: 200, // Adjust height as needed
                      child: Image.asset(gifAsset),
                    ),
                    const SizedBox(height: 16.0),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
