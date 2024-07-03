import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/img/1.jpg',
      'assets/img/2.jpg',
      'assets/img/3.jpeg',
      'assets/img/4.jpg',
      'assets/img/5.jpg',
      'assets/img/6.jpeg',
      'assets/img/7.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: imagePaths.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(
            height: double.infinity,
            scrollDirection: Axis.vertical,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            viewportFraction: 1.0,
          ),
        ),
      ),
    );
  }
}
