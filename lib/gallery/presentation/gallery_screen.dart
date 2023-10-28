import 'dart:html';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryGalleryScreenState();
}

class _GalleryGalleryScreenState extends State<GalleryScreen> {

  late final List<AssetPathEntity> paths;
  bool _isLoading = true;

  @override
  void initState () {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      getPermission();
    });

  }

  void getPermission() async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      paths = await PhotoManager.getAssetPathList();
      _isLoading = false;
      print("got data");
    } else {
      // Limited(iOS) or Rejected, use `==` for more precise judgements.
      // You can call `PhotoManager.openSetting()` to open settings for further steps.
    }  
  }
  

  @override
  Widget build(BuildContext context) {
    if(_isLoading){
      return const Center(
        child: Text("loading"),
      );
    }
    else {
      return Center(
      child: GridView.count(crossAxisCount: 4,
        children: List.generate(100, (index) {
          return Center(
            child: Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.white,
    width: 2.0,
    ),
    ),
    child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
    width: 110.0, height: 110.0),
    )
          );
        }),
    ),
    );
    }
  }

  List<Widget> _buildListPhotos() {
    return paths.map((p) =>
        Material(
        child: InkWell(
        onTap: (){
      print("hello");
    },
    child: Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.white,
    width: 2.0,
    ),
    ),
    child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
    width: 110.0, height: 110.0),
    ),
    ),
    ),
    ).toList();
  }

  }



