import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:invoice1/modal.dart';

class bill extends StatefulWidget {
  const bill({Key? key}) : super(key: key);

  @override
  State<bill> createState() => _billState();
}

class _billState extends State<bill> {
  final GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    List<Modal> l1 = ModalRoute.of(context)!.settings.arguments as List<Modal>;
// print(l1);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade200,
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
              captureImage();
            }, icon: Icon(Icons.save)),
          ],
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: RepaintBoundary(
          key: globalKey,
          child: Column(
              children: [
                Text("SHOP RECEIPT",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                Text("SUPERMARKET 123",style: TextStyle(fontSize: 15),),
                Text("PLANET EARTH",style: TextStyle(fontSize: 15),),
                Text("Tel :123-456-7890",style: TextStyle(fontSize: 15),),
                SizedBox(height: 20,),
                Text("RECEIPT :12345",style: TextStyle(fontSize: 13),),
                Text("DATE :12/12/2023",style: TextStyle(fontSize: 13),),
                Text("CASHIER :JOHN DOE",style: TextStyle(fontSize: 13),),
                SizedBox(height: 15,),
                Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return viewTile(l1[index]);
                  },
                    itemCount: l1.length,
                  ),
                ),
                Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("TAXABLE",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text("232323",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("VAT15%",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text("65656",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("TOTAL",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text("8877",style: TextStyle(fontSize: 15,color: Colors.black38,fontWeight: FontWeight.bold,backgroundColor: Colors.blue),),
                    ],
                  ),
                ),
                Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("CASH",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text("8877",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("CHANGE",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text("898",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text("Paid With CASH",style: TextStyle(fontSize: 15,),),
                    ],
                  ),
                ),
                Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
                Text("------------------------------------------------------",style: TextStyle(fontSize: 10,letterSpacing: 3),),
                SizedBox(height: 10,),
                Text("THANK YOU",style: TextStyle(fontSize: 13,letterSpacing: 5,fontWeight: FontWeight.w500),),
                SizedBox(height: 5,),
                Text("HAVE A GOOD DAY",style: TextStyle(fontSize: 13,letterSpacing: 1,fontWeight: FontWeight.w500),),
              ]
          ),
        ),
      ),
    );
  }

  Widget viewTile(Modal l1)
  {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text("${l1.name}",style: TextStyle(fontSize: 15,),),
          Spacer(),
          Text("${l1.price}",style: TextStyle(fontSize: 15),)
        ],
      ),
    );
  }

  void captureImage() async{

    RenderRepaintBoundary? boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;

    final ui.Image? image = await boundary?.toImage();

    final ByteData? byteData = await image!.toByteData(format: ui.ImageByteFormat.png);
    var pngBytes = byteData!.buffer.asUint8List();

    var ImageGallerySaver;
    final result = await ImageGallerySaver.saveImage(pngBytes,name: "My Post.png",quality: 50);
    print(result);

  }

}