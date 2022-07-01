import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urbangreens/pages/product/product.dart';

class PageBody extends StatefulWidget {
  const PageBody({Key? key}) : super(key: key);

  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  PageController pageController = PageController(viewportFraction: 0.92);
  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Current height is " + MediaQuery.of(context).size.width.toString());
    return Column(
      children: [
        Container(
          height: 320,
          child: PageView.builder(
              controller: pageController,
              itemCount: 4,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 4,
          position: _currPageValue,
          decorator: DotsDecorator(
            color: Colors.grey, // Inactive color
            activeColor: Colors.green,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          // color: Colors.amber,
          margin: EdgeInsets.all(12),
          child: Row(
            children: [
              Text(
                "Popular on urban greens",
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 2, right: 2, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      height: 250,
                      width: 205,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // color: Colors.grey,
                        // image: DecorationImage(
                        //     fit: BoxFit.cover,
                        //     image: AssetImage("images/slide2.jpg"))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child: Image.asset(
                              "images/slide3.jpg",
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProductPage()),
                              );
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text("Money plant marble prince"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              "₹ 749",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 3,
                              ),
                              Icon(Icons.favorite_border_outlined),
                              VerticalDivider(
                                color: Colors.black45,
                                thickness: 2,
                                width: 15,
                              ),
                              Icon(Icons.add_shopping_cart_rounded),
                            ],
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(left: 1),
                        height: 250,
                        width: 205,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          // color: Colors.grey,
                          // image: DecorationImage(
                          //     // fit: BoxFit.cover,
                          //     image: AssetImage("images/slide1.jpg"))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              "images/slide1.jpg",
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text("Money plant marble prince"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text(
                                "₹ 749",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(Icons.favorite_border_outlined),
                                VerticalDivider(
                                  color: Colors.black45,
                                  thickness: 2,
                                  width: 15,
                                ),
                                Icon(Icons.add_shopping_cart_rounded),
                              ],
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductPage()),
                        );
                      },
                    )
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(children: [
      Container(
        height: 220,
        margin: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9287cc),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("images/slide1.jpg"))),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 140,
          margin: EdgeInsets.only(left: 40, right: 40, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 7.0,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0),
                ),
              ]),
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: [
                Text(
                  "Indoor Planters",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 2,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.lightGreen,
                ),
                Text("Urban greens with 100% natural & organic plants"),
                SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductPage()),
                    );
                  },
                  child: Text("Discover Now"),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green)),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
