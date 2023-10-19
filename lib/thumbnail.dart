// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ThumbnailPage extends StatefulWidget {
  const ThumbnailPage({super.key});

  @override
  ThumbnailPages createState() => ThumbnailPages();
}

class ThumbnailPages extends State<ThumbnailPage> {
  final FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;

  Future<void> _speak(String text) async {
    try {
      await flutterTts.setLanguage("en-In");
      if (isPlaying) {
        await flutterTts.stop();
        isPlaying = false;
      } else {
        await flutterTts.speak(text);
        isPlaying = true;
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void _stop() async {
    try {
      await flutterTts.stop();
      isPlaying = false;
    } catch (e) {
      print("Error stopping audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF026279),
        title: const Text('Fruits'),
        actions: [
          TextButton(
            onPressed: () {
              _stop();
              // Handle the "Learn More" button action
            },
            child: const Text(
              'Learn Mode',
              style: TextStyle(
                color: Colors.white, // Set the text color
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'img/bg_image.jpg', // Replace with the path to your background image
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),

          // Content on top of the background image
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16.0), // Add padding to the Row
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Show a dialog with the image in a larger size
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: SizedBox(
                                            width: 35,
                                            height: 35,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: IconButton(
                                                  icon: const Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                  onPressed: () {
                                                    _stop();
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          width: 300,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                              image:
                                                  AssetImage('img/apple.jpg'),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            border: Border.all(
                                              color: Colors
                                                  .white, // You can change the color of the border here
                                              width:
                                                  4.0, // You can adjust the width of the border here
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
                                          'Apple (noun)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        const Text(
                                          'They\'re rich in fiber and antioxidants. Eating them is linked to a lower chance of getting many chronic conditions, including diabetes, heart disease, and cancer. Apples may also promote weight loss and improve gut and brain health.',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                // Handle the action for the Listen button
                                                _speak(
                                                    'Apple (noun) They\'re rich in fiber and antioxidants. Eating them is linked to a lower chance of getting many chronic conditions, including diabetes, heart disease, and cancer. Apples may also promote weight loss and improve gut and brain health.');
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 236, 24, 155),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      isPlaying
                                                          ? Icons
                                                              .pause_circle_outline
                                                          : Icons
                                                              .play_circle_outline,
                                                      color: Colors.white,
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    const Text('Listen',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                // Handle the action for the Run Slideshow button
                                                // Add your logic for running the slideshow here
                                                // Navigator.of(context)
                                                //     .pop();
                                                // // Close the dialog
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 3, 85, 161),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(Icons.movie_creation,
                                                        color: Colors.white),
                                                    SizedBox(width: 8.0),
                                                    Text('Slideshow',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(
                                      0xFF048664), // Set the border color
                                  width: 4.0, // Set the border width
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'img/apple.jpg'), // Replace with your image path
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(
                                  0xFF048664), // Set the background color
                              borderRadius: BorderRadius.circular(
                                  8.0), // Set border radius as needed
                            ),
                            padding: const EdgeInsets.all(
                                8.0), // Add padding to the text
                            child: const Text(
                              'Apple',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                          width: 29), // Add spacing between the images
                      GestureDetector(
                        onTap: () {
                          // Show a dialog with the image in a larger size
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                _stop();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 300,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'img/fresh-mango-fruits.jpg'),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        border: Border.all(
                                          color: Colors
                                              .white, // You can change the color of the border here
                                          width:
                                              4.0, // You can adjust the width of the border here
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 16), // Add spacing
                                    const Text(
                                      'Mango (noun)', // Replace with your heading
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 8), // Add spacing
                                    const Text(
                                      '''Mango is a delicious and juicy fruit that is rich in vitamins, minerals, and antioxidants. It is known for its sweet and tropical flavor and is a favorite in many cuisines around the world.''', // Replace with your content
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 16), // Add spacing
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Listen button
                                            _speak(
                                                'Mango (noun) Mango is a delicious and juicy fruit that is rich in vitamins, minerals, and antioxidants. It is known for its sweet and tropical flavor and is a favorite in many cuisines around the world.');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 236, 24, 155),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  isPlaying
                                                      ? Icons
                                                          .pause_circle_outline
                                                      : Icons
                                                          .play_circle_outline,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 8.0),
                                                const Text('Listen',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Run Slideshow button
                                            // Add your logic for running the slideshow here
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 3, 85, 161),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.movie_creation,
                                                    color: Colors.white),
                                                SizedBox(width: 8.0),
                                                Text('Slideshow',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(
                                      0xFFF0AC13), // Set the border color
                                  width: 4.0, // Set the border width
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'img/fresh-mango-fruits.jpg'), // Replace with your image path
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xFF048664), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    8.0), // Set border radius as needed
                              ),
                              padding: const EdgeInsets.all(
                                  8.0), // Add padding to the text
                              child: const Text(
                                'Mango',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Add spacing between rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Show a dialog with the image in a larger size
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                _stop();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 300,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'img/natural-fresh-orange-fruits-433.jpg'),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        border: Border.all(
                                          color: Colors
                                              .white, // You can change the color of the border here
                                          width:
                                              4.0, // You can adjust the width of the border here
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16), // Add spacing
                                    const Text(
                                      'Orange (noun)', // Replace with your heading
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 8), // Add spacing
                                    const Text(
                                      '''Oranges are a great source of vitamin C, fiber, and antioxidants. They can help boost your immune system, improve skin health, and aid in digestion. Including oranges in your diet can have numerous health benefits.''', // Replace with your content
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 16), // Add spacing
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Listen button
                                            _speak(
                                                'Orange (noun) Oranges are a great source of vitamin C, fiber, and antioxidants. They can help boost your immune system, improve skin health, and aid in digestion. Including oranges in your diet can have numerous health benefits.');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 236, 24, 155),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  isPlaying
                                                      ? Icons
                                                          .pause_circle_outline
                                                      : Icons
                                                          .play_circle_outline,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 8.0),
                                                const Text('Listen',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Run Slideshow button
                                            // Add your logic for running the slideshow here
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 3, 85, 161),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.movie_creation,
                                                    color: Colors.white),
                                                SizedBox(width: 8.0),
                                                Text('Slideshow',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(
                                      0xFF8F0527), // Set the border color
                                  width: 4.0, // Set the border width
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'img/natural-fresh-orange-fruits-433.jpg'), // Replace with your image path
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xFF048664), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    8.0), // Set border radius as needed
                              ),
                              padding: const EdgeInsets.all(
                                  8.0), // Add padding to the text
                              child: const Text(
                                'Orange',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                          width: 29), // Add spacing between the images
                      GestureDetector(
                        onTap: () {
                          // Show a dialog with the image in a larger size
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                _stop();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 300,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'img/Fresh-Green-Grapes.jpg'),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        border: Border.all(
                                          color: Colors
                                              .white, // You can change the color of the border here
                                          width:
                                              4.0, // You can adjust the width of the border here
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16), // Add spacing
                                    const Text(
                                      'Green Grapes (noun)', // Replace with your heading
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 8), // Add spacing
                                    const Text(
                                      '''Green grapes are a delicious and healthy snack. They are rich in vitamins and antioxidants. Regular consumption of green grapes may help improve heart health and provide other health benefits.''', // Replace with your content
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 16), // Add spacing
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Listen button
                                            _speak(
                                                'Green Grapes (noun) Green grapes are a delicious and healthy snack. They are rich in vitamins and antioxidants. Regular consumption of green grapes may help improve heart health and provide other health benefits.');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 236, 24, 155),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  isPlaying
                                                      ? Icons
                                                          .pause_circle_outline
                                                      : Icons
                                                          .play_circle_outline,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 8.0),
                                                const Text('Listen',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Run Slideshow button
                                            // Add your logic for running the slideshow here
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 3, 85, 161),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.movie_creation,
                                                    color: Colors.white),
                                                SizedBox(width: 8.0),
                                                Text('Slideshow',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(
                                      0xFF361E52), // Set the border color
                                  width: 4.0, // Set the border width
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'img/Fresh-Green-Grapes.jpg'), // Replace with your image path
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xFF048664), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    8.0), // Set border radius as needed
                              ),
                              padding: const EdgeInsets.all(
                                  8.0), // Add padding to the text
                              child: const Text(
                                'Green Grapes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Add spacing between rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Show a dialog with the image in a larger size
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                _stop();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 300,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage('img/papaya.jpg'),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        border: Border.all(
                                          color: Colors
                                              .white, // You can change the color of the border here
                                          width:
                                              4.0, // You can adjust the width of the border here
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16), // Add spacing
                                    const Text(
                                      'Papaya (noun)', // Replace with your heading
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 8), // Add spacing
                                    const Text(
                                      '''Papaya is a tropical fruit known for its sweet and vibrant orange flesh. It is rich in vitamins, minerals, and dietary fiber. Papaya can help improve digestion and promote skin health.''', // Replace with your content
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 16), // Add spacing
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Listen button
                                            _speak(
                                                'Papaya (noun) Papaya is a tropical fruit known for its sweet and vibrant orange flesh. It is rich in vitamins, minerals, and dietary fiber. Papaya can help improve digestion and promote skin health.');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 236, 24, 155),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  isPlaying
                                                      ? Icons
                                                          .pause_circle_outline
                                                      : Icons
                                                          .play_circle_outline,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 8.0),
                                                const Text('Listen',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Run Slideshow button
                                            // Add your logic for running the slideshow here
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 3, 85, 161),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.movie_creation,
                                                    color: Colors.white),
                                                SizedBox(width: 8.0),
                                                Text('Slideshow',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(
                                      0xFF1AA3AD), // Set the border color
                                  width: 4.0, // Set the border width
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'img/papaya.jpg'), // Replace with your image path
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xFF048664), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    8.0), // Set border radius as needed
                              ),
                              padding: const EdgeInsets.all(
                                  8.0), // Add padding to the text
                              child: const Text(
                                'Papaya',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                          width: 29), // Add spacing between the images
                      GestureDetector(
                        onTap: () {
                          // Show a dialog with the image in a larger size
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                _stop();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 300,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image:
                                              AssetImage('img/pineapple.webp'),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        border: Border.all(
                                          color: Colors
                                              .white, // You can change the color of the border here
                                          width:
                                              4.0, // You can adjust the width of the border here
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16), // Add spacing
                                    const Text(
                                      'Pineapple (noun)', // Replace with your heading
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 8), // Add spacing
                                    const Text(
                                      '''Pineapple is a tropical fruit known for its sweet and tangy flavor. It is packed with vitamins, minerals, and antioxidants. Pineapple can aid digestion and boost the immune system.''', // Replace with your content
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 16), // Add spacing
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Listen button
                                            _speak(
                                                'Pineapple (noun) Pineapple is a tropical fruit known for its sweet and tangy flavor. It is packed with vitamins, minerals, and antioxidants. Pineapple can aid digestion and boost the immune system.');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 236, 24, 155),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  isPlaying
                                                      ? Icons
                                                          .pause_circle_outline
                                                      : Icons
                                                          .play_circle_outline,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 8.0),
                                                const Text('Listen',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Run Slideshow button
                                            // Add your logic for running the slideshow here
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 3, 85, 161),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.movie_creation,
                                                    color: Colors.white),
                                                SizedBox(width: 8.0),
                                                Text('Slideshow',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(
                                      0xFF1B4C93), // Set the border color
                                  width: 4.0, // Set the border width
                                ),
                                image: const DecorationImage(
                                  //fit: BoxFit.fill,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'img/pineapple.webp'), // Replace with your image path
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xFF048664), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    8.0), // Set border radius as needed
                              ),
                              padding: const EdgeInsets.all(
                                  8.0), // Add padding to the text
                              child: const Text(
                                'Pineapple',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Add spacing between rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Show a dialog with the image in a larger size
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                _stop();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 300,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'img/51ebZJ+DR4L._AC_UF1000,1000_QL80_.jpg'),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        border: Border.all(
                                          color: Colors
                                              .white, // You can change the color of the border here
                                          width:
                                              4.0, // You can adjust the width of the border here
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16), // Add spacing
                                    const Text(
                                      'Banana (noun)', // Replace with your heading
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 8), // Add spacing
                                    const Text(
                                      '''Banana is a tropical fruit known for its natural sweetness. It is a good source of potassium, vitamins, and dietary fiber. Bananas can provide energy and support heart health.''', // Replace with your content
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 16), // Add spacing
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Listen button
                                            _speak(
                                                'Banana (noun) Banana is a tropical fruit known for its natural sweetness. It is a good source of potassium, vitamins, and dietary fiber. Bananas can provide energy and support heart health.');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 236, 24, 155),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  isPlaying
                                                      ? Icons
                                                          .pause_circle_outline
                                                      : Icons
                                                          .play_circle_outline,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 8.0),
                                                const Text('Listen',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Run Slideshow button
                                            // Add your logic for running the slideshow here
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 3, 85, 161),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.movie_creation,
                                                    color: Colors.white),
                                                SizedBox(width: 8.0),
                                                Text('Slideshow',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(
                                      0xFF048664), // Set the border color
                                  width: 4.0, // Set the border width
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'img/51ebZJ+DR4L._AC_UF1000,1000_QL80_.jpg'), // Replace with your image path
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xFF048664), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    8.0), // Set border radius as needed
                              ),
                              padding: const EdgeInsets.all(
                                  8.0), // Add padding to the text
                              child: const Text(
                                'Banana',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                          width: 29), // Add spacing between the images
                      GestureDetector(
                        onTap: () {
                          // Show a dialog with the image in a larger size
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                _stop();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 300,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'img/pomegranate-1-istock-612833996-1.jpg'),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        border: Border.all(
                                          color: Colors
                                              .white, // You can change the color of the border here
                                          width:
                                              4.0, // You can adjust the width of the border here
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16), // Add spacing
                                    const Text(
                                      'Pomegranate (noun)', // Replace with your heading
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 8), // Add spacing
                                    const Text(
                                      '''Pomegranate is a delicious and nutritious fruit known for its juicy seeds. It is rich in antioxidants, vitamins, and minerals. Pomegranate may have various health benefits, including improving heart health and reducing inflammation.''', // Replace with your content
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 16), // Add spacing
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Listen button
                                            _speak(
                                                'Pomegranate (noun) Pomegranate is a delicious and nutritious fruit known for its juicy seeds. It is rich in antioxidants, vitamins, and minerals. Pomegranate may have various health benefits, including improving heart health and reducing inflammation.');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 236, 24, 155),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  isPlaying
                                                      ? Icons
                                                          .pause_circle_outline
                                                      : Icons
                                                          .play_circle_outline,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 8.0),
                                                const Text('Listen',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Run Slideshow button
                                            // Add your logic for running the slideshow here
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 3, 85, 161),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.movie_creation,
                                                    color: Colors.white),
                                                SizedBox(width: 8.0),
                                                Text('Slideshow',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(
                                      0xFFF0AC13), // Set the border color
                                  width: 4.0, // Set the border width
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'img/pomegranate-1-istock-612833996-1.jpg'), // Replace with your image path
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xFF048664), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    8.0), // Set border radius as needed
                              ),
                              padding: const EdgeInsets.all(
                                  8.0), // Add padding to the text
                              child: const Text(
                                'Pomegranate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Add spacing between rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Show a dialog with the image in a larger size
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                _stop();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 300,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'img/30000996_12-fresho-cherry.webp'),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        border: Border.all(
                                          color: Colors
                                              .white, // You can change the color of the border here
                                          width:
                                              4.0, // You can adjust the width of the border here
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16), // Add spacing
                                    const Text(
                                      'Cherry (noun)', // Replace with your heading
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 8), // Add spacing
                                    const Text(
                                      '''Cherries are small, round fruits that come in various colors. They are rich in vitamins, minerals, and antioxidants. Cherries may have benefits for heart health, sleep quality, and reducing muscle soreness.''', // Replace with your content
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 16), // Add spacing
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Listen button
                                            _speak(
                                                'Cherry (noun)   Cherries are small, round fruits that come in various colors. They are rich in vitamins, minerals, and antioxidants. Cherries may have benefits for heart health, sleep quality, and reducing muscle soreness.');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 236, 24, 155),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  isPlaying
                                                      ? Icons
                                                          .pause_circle_outline
                                                      : Icons
                                                          .play_circle_outline,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 8.0),
                                                const Text('Listen',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Run Slideshow button
                                            // Add your logic for running the slideshow here
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 3, 85, 161),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.movie_creation,
                                                    color: Colors.white),
                                                SizedBox(width: 8.0),
                                                Text('Slideshow',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(
                                      0xFF8F0527), // Set the border color
                                  width: 4.0, // Set the border width
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'img/30000996_12-fresho-cherry.webp'), // Replace with your image path
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xFF048664), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    8.0), // Set border radius as needed
                              ),
                              padding: const EdgeInsets.all(
                                  8.0), // Add padding to the text
                              child: const Text(
                                'Cherry',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                          width: 29), // Add spacing between the images
                      GestureDetector(
                        onTap: () {
                          // Show a dialog with the image in a larger size
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                _stop();
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 300,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'img/whole-and-slices-watermelon.webp'),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        border: Border.all(
                                          color: Colors
                                              .white, // You can change the color of the border here
                                          width:
                                              4.0, // You can adjust the width of the border here
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const SizedBox(height: 16), // Add spacing
                                    const Text(
                                      'Watermelon (noun)', // Replace with your heading
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 8), // Add spacing
                                    const Text(
                                      '''Watermelon is a delicious and refreshing fruit that's perfect for staying hydrated during the summer. It's low in calories and contains essential vitamins and minerals. Eating watermelon may also have various health benefits.''', // Replace with your content
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 16), // Add spacing
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Listen button
                                            _speak(
                                                'Watermelon (noun)  Watermelon is a delicious and refreshing fruit that\'s perfect for staying hydrated during the summer. It\'s low in calories and contains essential vitamins and minerals. Eating watermelon may also have various health benefits.');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 236, 24, 155),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  isPlaying
                                                      ? Icons
                                                          .pause_circle_outline
                                                      : Icons
                                                          .play_circle_outline,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 8.0),
                                                const Text('Listen',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle the action for the Run Slideshow button
                                            // Add your logic for running the slideshow here
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 3, 85, 161),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.movie_creation,
                                                    color: Colors.white),
                                                SizedBox(width: 8.0),
                                                Text('Slideshow',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Close icon
                                  ],
                                ),
                                actions: [], // Leave this empty to hide the default action buttons
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(
                                      0xFF361E52), // Set the border color
                                  width: 4.0, // Set the border width
                                ),
                                image: const DecorationImage(
                                  //fit: BoxFit.fill,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'img/whole-and-slices-watermelon.webp'), // Replace with your image path
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xFF048664), // Set the background color
                                borderRadius: BorderRadius.circular(
                                    8.0), // Set border radius as needed
                              ),
                              padding: const EdgeInsets.all(
                                  8.0), // Add padding to the text
                              child: const Text(
                                'Watermelon',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Add more rows as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
