import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ImageSlider extends StatefulWidget {
  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
            child: ListView(
          children: [
            SizedBox(
              height: 280.0,
              width: double.infinity,
              child: Carousel(
                dotSize: 6.0,
                dotSpacing: 15.0,
                dotPosition: DotPosition.bottomCenter,
                images: [
                  Image.asset('assets/images/imageslider/ip1.jpg',
                      fit: BoxFit.fill),
                  Image.asset('assets/images/imageslider/G41o2.png',
                      fit: BoxFit.fill),
                  Image.asset('assets/images/imageslider/TV.jpg',
                      fit: BoxFit.fill),
                  Image.asset('assets/images/imageslider/headphone.jpg',
                      fit: BoxFit.fill),
                  Image.asset('assets/images/imageslider/keyboard.jpg',
                      fit: BoxFit.fill),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
