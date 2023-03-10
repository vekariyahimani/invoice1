import 'package:flutter/material.dart';
import 'package:invoice1/modal.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _homePageState();
}

class _homePageState extends State<Page1> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  List<Modal> l1 = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade200,
        appBar: AppBar(
          title: Text("Invoice Bill",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400)),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: txtname,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  hintText: "Product",
                  hintStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black, width: 2)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: txtprice,
                cursorColor: Colors.blue.shade900,
                decoration: InputDecoration(
                  hintText: "Price",
                  hintStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black, width: 2)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Modal d1 = Modal(price: txtprice.text, name: txtname.text);
                  setState(() {
                    l1.add(d1);
                  });
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Text("Add",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ViewTile(l1[index], index);
                    },
                    itemCount: l1.length,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'bill', arguments: l1);
                },
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Text("Generate",
                          style: TextStyle(color: Colors.white, fontSize: 18))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ViewTile(Modal l2, int a1) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue.shade400,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue.shade900),
          boxShadow: [
            BoxShadow(color: Colors.blue.shade500, blurRadius: 2, spreadRadius: 3),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product: ${l2.name}",
                      style: TextStyle(
                          fontSize: 18, color: Colors.black)),
                  SizedBox(height: 5,),
                  Text("Price: ${l2.price}",
                      style: TextStyle(
                          fontSize: 18, color: Colors.black)),
                ],
              ),
              Spacer(),
              InkWell(
                  onTap: () {
                    setState(() {
                      l1.removeAt(a1);
                    });
                  },
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: 25,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
