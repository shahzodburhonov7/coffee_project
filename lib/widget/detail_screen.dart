import 'package:coffee_app/model/category.dart';
import 'package:coffee_app/widget/background.dart';
import 'package:coffee_app/widget/display_image.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../model/size_option.dart';
import '../model/size_option_item.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int selectedSize = 2;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: myAppBar(context),
      body: Stack(
        children: [
          Background(),
          Positioned(
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Hero(
                    tag: widget.product.name,
                    child: SizedBox(
                      width: size.width * 0.81,
                      height: size.height * 0.5,
                      child: DisplayImage(
                        product: widget.product,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width / 1.5,
                        child: Text(
                          widget.product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "\$${widget.product.price}0",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                color: firstColor),
                          ),
                          Text(
                            "Best Sale",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black45),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "Size Option",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(sizeOptions.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = index;
                                });
                              },
                              child: SizeOptionItem(
                                index: index,
                                selected: selectedSize == index ? true : false,
                                sizeOption: sizeOptions[index],
                              ),
                            );
                          }))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity--;
                                  }
                                });
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: secondColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            quantity.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: secondColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: secondColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Add to Order",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
      title: Text(
        "Details",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        Center(
          child: Stack(
            children: [
              Icon(
                Icons.shopping_cart,
                color: Colors.amber,
              ),
              Positioned(
                  right: 3,
                  top: 0,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: firstColor,
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}
