import 'package:cartdesign/background_gradient.dart';
import 'package:cartdesign/datas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(gradient: backgroundGradient()),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.17,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 21, 60, 71),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: size.height * 0.15,
                              width: size.width * 0.23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(images[index])),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  names[index],
                                  style:
                                      GoogleFonts.raleway(color: Colors.white),
                                ),
                                Text(
                                  '₹${price[index]}',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white),
                                ),
                                RatingBar.builder(
                                  itemSize: 13,
                                  initialRating: rate[index],
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      const EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 10,
                                  ),
                                  onRatingUpdate: (rating) {
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color.fromARGB(255, 24, 78, 86),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            quantity[index]++;
                                          });
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 30, 91, 101),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5))),
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${quantity[index]}',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            quantity[index]--;
                                          });
                                        },
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 30, 91, 101),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5))),
                                          child: const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8),
                                            child: Icon(
                                              Icons.minimize,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text('Delivery by ${dates[index]}',style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ],
                        ),
                        const Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    ));
  }
}
