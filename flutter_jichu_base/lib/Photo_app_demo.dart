import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class photo_pickerdemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: photo_pickerdemoPage(),
    );
  }
}

class photo_pickerdemoPage extends StatefulWidget {
  @override
  _photo_pickerdemoPageState createState() => _photo_pickerdemoPageState();
}

class _photo_pickerdemoPageState extends State<photo_pickerdemoPage> {
   List<File> _images = [];
  final picker = ImagePicker();

  Future getImage(bool iscamera) async {
    final pickedFile = await picker.getImage(source:iscamera? ImageSource.camera:ImageSource.gallery);
    Navigator.pop(context);
    setState(() {
      if (pickedFile != null) {
        _images.add(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body:
      Center(
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children:getImages(),
       ),
      //   _image == null
      //       ? Text('No image selected.')
      //       : Image.file(_image),
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectImage,
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  _selectImage() {
    return showModalBottomSheet(context: context, builder: (context)=>Container(
      height: 160,
      child: Column(
        children: [
            _seleMethod('拍照',true),
            _seleMethod('相册',false),
      ],
      ),
    ));
  }

  _seleMethod(String s, bool iscamera) {
      return GestureDetector(
        child: ListTile(
          leading: iscamera?Icon(Icons.camera_alt):Icon(Icons.photo_album),
          title: Text(s),
        ),
        onTap: ()=>getImage(iscamera),
      );

  }

  getImages() {
    return _images.map((file){
        return Stack(
          //设置圆角效果
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(file,width: 120,height: 90,fit: BoxFit.fill,),
            ),
            //删除按钮
            Positioned(
              right: 5,
                top: 5,
                child: GestureDetector(
                  onTap: (){
                    _images.remove(file);
                  },
                  child: ClipOval(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(color: Colors.black54),
                      child: Icon(Icons.close,size: 18,color: Colors.black38,),
                    ),
                  ),
                ))
          ],
    );
    }).toList();
  }
}