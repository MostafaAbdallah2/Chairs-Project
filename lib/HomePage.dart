import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int press = 0;

  final List images = const [
    {
      "image": "images/chairImg 5.png",
      "name": "Nordic Chair",
      "price": "\$107.88",
    },
    {
      "image": "images/chairImg2 2.png",
      "name": "Luxury Armchair",
      "price": "\$200.01",
    },
    {
      "image": "images/chairImg3 2.png",
      "name": "Modern Lounge Chair",
      "price": "\$400.99",
    },
    {
      "image": "images/218a16e594ba31ceca6c2c86fadbb7e1 1.png",
      "name": "Classic Wooden Chair",
      "price": "\$500.00",
    },
    {
      "image": "images/346c2d5b0c46c65de35ad4d8a066185f 1.png",
      "name": "Ergonomic Chair",
      "price": "\$80.80",
    },
    {
      "image": "images/867451f61a5d62d92eb639f8c835c2b4 1.png",
      "name": "Executive Chair",
      "price": "\$1000",
    },
    // {
    //   "image": "images/da4bddad1f893ebc4facfb8ab176c1b7 1.png",
    //   "name": "Royal Velvet Chair",
    //   "price": "\$3000",
    // },
    // {
    //   "image": "images/Image (1).png",
    //   "name": "Accent Chair",
    //   "price": "\$400.50",
    // },
  ];

  List cartitem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 120,

        leading: Image.asset("images/Logo.png", color: Color(0xffF953B22)),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  // Implement cart functionality here
                },
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
              ),

              if (cartitem.isNotEmpty)
                Positioned(
                  right: 6,
                  top: 4,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cartitem.length.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          //About image
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(1),
            ),
            // padding: EdgeInsets.all(10),
            height: 500,

            width: 400,
            child: PageView(
              children: [
                Image.asset(
                  images[press]["image"],

                  height: 500,
                  width: 400,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          // T E X T  Realistic Chair
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              images[press]["name"],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "JetBrains Mono",
              ),
              textAlign: TextAlign.start,
            ),
          ),
          // T E X T  107.88
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5.0),
            child: Text(
              images[press]["price"],
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: Color(0xffF953B22),
                fontFamily: "JetBrains Mono",
              ),
            ),
          ),

          // T E X T  Color
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 30.0),
            child: Text(
              "Size ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: "JetBrains Mono",
              ),
            ),
          ),
          SizedBox(height: 20),

          //C L A S S I M A G E S
          Center(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10),
                itemBuilder: (context, index) {
                  // Use padding for spacing between items. The previous margin was very large.
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        press = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey.shade300],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(20),

                          border: Border.all(
                            color: index == press
                                ? Colors.deepPurple
                                : Colors.grey.shade400,
                            width: 1,
                          ),
                        ),

                        child: Image.asset(
                          images[index]["image"],
                          width: index == press
                              ? 110
                              : 97, // Slightly larger for the selected image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // T E X T  Add to Cart , Button
          Row(
            children: [
              MaterialButton(
                autofocus: false,

                onPressed: () {
                  setState(() {
                    cartitem.add(images[press]);
                  });
                },
                child: Container(
                  // width: 80,
                  padding: EdgeInsets.all(14),
                  margin: EdgeInsets.symmetric(
                    horizontal: cartitem.isNotEmpty ? 30 : 127,
                    vertical: 30,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple.withOpacity(0.5),
                        Colors.deepPurpleAccent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "Add to Cart",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "JetBrains Mono",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              if (cartitem.isNotEmpty)
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      cartitem.remove(images[press]);
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),

                    // width: 80,
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 10,
                      bottom: 10,
                    ),
                    margin: EdgeInsets.only(left: 50),
                    // margin: EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "Remove",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "JetBrains Mono",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
