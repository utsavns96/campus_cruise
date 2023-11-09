import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void feedbackPage() => runApp(const MaterialApp(
  title: 'Campus Cruise',
  home: FeedbackScreen(),
));

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Campus Cruise',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0x00000000),
        elevation: 0.0,
      ),
      // body: Container(
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/bgimage.png'),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // ),
    );
  }
}

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FeedbackPage> createState() => FeedbackState();
}

class FeedbackState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            'Campus Cruise',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0x00000000),
          elevation: 0.0,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bgimage.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      //padding: const EdgeInsets.only(top: 100),
                      child: const Text(
                        "Feedback",
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 8.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 75),
                      child: const Text(
                        "Rate your most recent ride",
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          letterSpacing: 1.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 50),
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 60,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 50),
                      child: const Text(
                        "Is there something you want to let us know about?",
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                      child: const SizedBox(
                        height: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your feedback here',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          maxLines: null,
                          expands: true,
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 50),
                        width: 300,
                        height: 100,
                        child: FloatingActionButton(
                          onPressed: () {
                            //TO DO: Add login functionality
                            //Navigator.push(context, MaterialPageRoute(builder: (_) => const MenuPage(title: 'Campus Cruise')));
                          },
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          child: const Text('Submit',
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        )),
                  ]),
            ),
          ],
        )
    );
  }
}
