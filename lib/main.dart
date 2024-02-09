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
                leftIconImage: "assets/images/arrow_left.png",
                appBarTitle: 'Details',
                rightIconImage: 'assets/images/heart.png')
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
                SizeSection(),
                SizedBox(
                  height: 10,
                ),
                // PriceSection(price: 4.53)
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const PriceSection(price: 4.53),
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
              Text(
                content,
                style: const TextStyle(
                  color: Color(0xFFa4a4a4),
                  fontSize: 14,
                  fontFamily: 'Sora',
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
            const Icon(Icons.star, color: Color(0xFFfbbe22)),
            Text(' $rating ',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
                )),
            Text('($numberOfRaters)',
                style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'Sora',
                    color: Color(0xFFA4A4A4))),
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
        width: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFf9f9f9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(imageURL),
      ),
    );
  }
}

class DecsriptionSection extends StatelessWidget {
  const DecsriptionSection(
      {super.key, required this.description, required this.maxLength});

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
                    fontSize: 20,
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
                          text: description.length > maxLength
                              ? '${description.substring(0, maxLength)}...'
                              : description,
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w300,
                            color: Color(0xFFA4A4A4),
                          ),
                        ),
                        if (description.length > maxLength)
                          const TextSpan(
                            text: ' Read More',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFC67C4E),
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

class SizeSection extends StatefulWidget {
  const SizeSection({super.key});

  @override
  _SizeSectionState createState() => _SizeSectionState();
}

class _SizeSectionState extends State<SizeSection> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Size',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Sora',
                ),
              ),
            ),
          ],
        ),
        // const SizedBox(height: 0),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizeChip(
                size: 'S',
                isSelected: selectedSize == 'S',
                onPressed: () {
                  setState(() {
                    selectedSize = 'S';
                  });
                },
              ),
              const SizedBox(width: 10),
              SizeChip(
                size: 'M',
                isSelected: selectedSize == 'M',
                onPressed: () {
                  setState(() {
                    selectedSize = 'M';
                  });
                },
              ),
              const SizedBox(width: 10),
              SizeChip(
                size: 'L',
                isSelected: selectedSize == 'L',
                onPressed: () {
                  setState(() {
                    selectedSize = 'L';
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SizeChip extends StatelessWidget {
  const SizeChip({
    Key? key,
    required this.size,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String size;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected ? const Color(0xFFC67C4E) : Colors.grey;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: isSelected
            ? const Color(0xFFFFF5EE)
            : Colors.white,
        onPrimary: isSelected
            ? const Color.fromARGB(255, 173, 89, 56)
            : Colors.black, // Change text color based on selection
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: Text(
        size,
        style: const TextStyle(
          fontFamily: 'Sora',
          fontSize: 18,
        ),
      ),
    );
  }
}

class PriceSection extends StatelessWidget {
  const PriceSection({super.key, required this.price});
  final double price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment
                .start,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                    fontFamily: 'Sora', color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('\$$price',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Sora',
                      color: Color(0xFFC67C4E))),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFFC67C4E), // Change text color
              padding: const EdgeInsets.symmetric(
                  vertical: 30, horizontal: 80),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Buy Now',
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
