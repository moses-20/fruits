import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:fruits/models/fruit_model.dart';
import '../colors.dart';

class DetailScreen extends StatefulWidget {
  final FruitModel fruit;
  final int index;

  DetailScreen({this.fruit, this.index});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<Color> colorsDark = <Color>[
    AppColors.dark_yellow,
    AppColors.dark_y,
    AppColors.dark_blue,
    AppColors.dark_pink,
    AppColors.dark_green,
    AppColors.dark_p
  ];

  final List<Color> colorsLight = <Color>[
    AppColors.light_yellow,
    AppColors.light_y,
    AppColors.light_blue,
    AppColors.light_pink,
    AppColors.light_green,
    AppColors.light_p
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorsDark[widget.index],
              colorsLight[widget.index],
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _topBar(),
                  _itemImage(),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(child: _bottomSheet()),
          ],
        ),
      ),
      bottomNavigationBar: _bottomAddToCart(),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.gray,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Icon(
                Icons.navigate_before,
                color: AppColors.black,
              ),
            ),
          ),
          Container(
            child: SvgPicture.asset(
              'assets/images/signs.svg',
              height: 30,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image(
          image: AssetImage(widget.fruit.imgUrl),
          height: 200,
          width: 200,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            SizedBox(width: 8),
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            SizedBox(width: 8),
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: AppColors.gray,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _bottomSheet() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white70, Colors.white],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.5, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: ListView(
        children: <Widget>[
          Text(
            widget.fruit.name,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              letterSpacing: 1.1,
            ),
          ),
          SizedBox(height: 5),
          Text(
            widget.fruit.quantity,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black38,
            ),
          ),
          SizedBox(height: 10),
          _priceCart(),
          SizedBox(height: 10),
          Text(
            'Product Description',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.fruit.description,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceCart() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white70, Colors.white],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.5, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.remove,
            color: AppColors.black,
            size: 20,
          ),
          SizedBox(width: 15),
          Text(
            "5",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 15),
          Icon(
            Icons.add,
            color: AppColors.black,
            size: 20,
          ),
          Text(
            "GHc " + widget.fruit.price,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: "Raleway",
              color: AppColors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomAddToCart() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white70, Colors.white],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.5, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(
                color: colorsDark[widget.index],
                width: 2.0,
              ),
            ),
            child: Icon(
              Icons.favorite,
              color: colorsDark[widget.index],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: colorsDark[widget.index],
            ),
            child: Text(
              "Add to cart",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: "Raleway",
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
