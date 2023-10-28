import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryGalleryScreenState();
}

class _GalleryGalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(crossAxisCount: 4,
        children: List.generate( 100, (index) {
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                ),
              ),
              child: const Center(
                child: InkWell(
                  onTap: () {},
                  child: Ink.Image(
                    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                ),
              ),
            );
          }),
      )
    );
  }
}
