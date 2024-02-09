import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: const [
            AppBarSection(
                leftIconImage: "assets/images/arrow_left.jpg",
                appBarTitle: 'Details',
                rightIconImage: 'assets/images/heart.jpg')
          ],
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ImageSection(
                    imageURL: 'assets/images/Rectangle.jpg',
                  ),
                ),
                ImageTitleSection(
                  imageTitle: 'Cappuccino',
                  content: 'with Chocolate',
                ),
                RatingSection(
                  rating: 4.8,
                  numberOfRaters: 230,
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: 10),
                DecsriptionSection(
                      description:
                      'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk. The foam, which tops the beverage, consists of steamed milk that has been aerated to create a thick, creamy texture, giving the drink its signature velvety consistency.',
                      maxLength: 100,
                    ),
                SizedBox(
                      height: 10,
                    ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarSection extends StatelessWidget {
  const AppBarSection(
      {super.key,
      required this.leftIconImage,
      required this.appBarTitle,
      required this.rightIconImage});

  final String leftIconImage;
  final String appBarTitle;
  final String rightIconImage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            leftIconImage,
          ),
          Text(
            appBarTitle,
            style: const TextStyle(
                fontFamily: 'Sora', fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Image.asset(
            rightIconImage,
          ),
        ],
      ),
    ));
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.imageURL});
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset(
        imageURL,
        width: double.infinity,
        fit: BoxFit.cover,
      )
    ]);
  }
}

class ImageTitleSection extends StatelessWidget {
  const ImageTitleSection({
    super.key,
    required this.imageTitle,
    required this.content,
  });

  final String imageTitle;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                imageTitle,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sora',
                ),
                textAlign: TextAlign.left,
              ),
              //  const SizedBox(height: 5),
              Text(
                content,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Century Gothic',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RatingSection extends StatelessWidget {
  const RatingSection(
      {super.key, required this.rating, required this.numberOfRaters});

  final double rating;
  final int numberOfRaters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            const Icon(Icons.star, color: Color.fromARGB(255, 240, 200, 0)),
            Text(' $rating ',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
                )),
            Text('($numberOfRaters)',
                style: const TextStyle(
                    fontSize: 14, fontFamily: 'Sora', color: Colors.grey)),
          ],
        ),
        const Row(
          children: [
            RatingImages(imageURL: 'assets/images/bean.png'),
            RatingImages(imageURL: 'assets/images/milk.png')
          ],
        ),
      ]),
    );
  }
}

class RatingImages extends StatelessWidget {
  const RatingImages({super.key, required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 246, 246, 246),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(imageURL),
      ),
    );
  }
}

class DecsriptionSection extends StatelessWidget {
  const DecsriptionSection({super.key,
    required this.description,
    required this.maxLength});

  final String description;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(children: [
        const Row(
          children: [
            Text('Description',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Sora')),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          // width: 380,
          margin: const EdgeInsets.only(left: 3),
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: description.length > maxLength ? '${description.substring(0, maxLength)}...' : description,
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                          ),
                        ),
                        if (description.length > maxLength)
                          const TextSpan(
                            text: ' Read More',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w300,
                              color: Color.fromARGB(255, 173, 89, 56),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ),
        )
      ]),
    );
  }
}
