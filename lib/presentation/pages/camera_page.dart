import 'dart:io';

import 'package:camera/camera.dart';
import 'package:custom_image_picker/custom_image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  List<CameraDescription> cameras;
  CameraController _cameraController ;
  List<dynamic> _galleryPhotos;
  @override
  void initState() {
    initializeCamera();
    getImagesFromGallery();
    super.initState();
  }

  Future<void> initializeCamera()async{
    cameras = await availableCameras();
    _cameraController=CameraController(cameras[0],ResolutionPreset.medium);
    _cameraController.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    });
  }

  Future<void> getImagesFromGallery()async{
    CustomImagePicker.getAllImages.then((value) {
      setState(() {
        _galleryPhotos =value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    if (_cameraController==null || !_cameraController.value.isInitialized){
      return Container(height: 0.0,width: 0.0,);
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: CameraPreview(_cameraController),
          ),
          _cameraButtonWidget(),
          _galleryWidget(),
        ],
      ),
    );
  }

  Widget _cameraButtonWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.flash_on,color: Colors.white,size: 30,),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                border: Border.all(color: Colors.white,width: 2)
              ),
            ),
            Icon(Icons.camera_alt,size: 30,color: Colors.white,)
          ],
        ),
      ),
    );
  }
  Widget _galleryWidget() {
    return Positioned(
      bottom: 100,
      right: 0,
      left: 0,
      child: Container(
        height: 55,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _galleryPhotos.length,
          itemBuilder: (_,index){
            return Container(
              margin: EdgeInsets.only(right: 8),
              height: 55,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(.2)
              ),
              child: Image.file(File(_galleryPhotos[index]),fit: BoxFit.cover,),
            );
          },
        ),
      ),
    );
  }
}


