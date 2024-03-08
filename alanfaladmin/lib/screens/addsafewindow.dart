import 'package:flutter/material.dart';
import 'package:alanfaladmin/db/product.dart';
import 'package:alanfaladmin/db/lockcount.dart';
import 'package:alanfaladmin/db/locktype.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:alanfaladmin/db/safewindow.dart';
import 'dart:io';

class AddSafetyWindow extends StatefulWidget {
  @override
  _AddSafetyWindowState createState() => _AddSafetyWindowState();
}

class _AddSafetyWindowState extends State<AddSafetyWindow> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  SafetyWindowService safetyWindowService = SafetyWindowService();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController windowNameController = TextEditingController();
  TextEditingController quatityController = TextEditingController();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List categories = ['Door', 'Window'];
  List<DropdownMenuItem<String>> categoriesDropDown = <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory;
  String _currentBrand;
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;
  List<String> selectedSizes = <String>[];
  List<String> selectedLocks = <String>[];

  File _image1;
  File _image2;
  File _image3;
//
//
  bool isLoading = false;





  @override
  void initState() {

//    _getCategories();
//    _getBrands();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.2,
        backgroundColor: Colors.black,
        title: Text('Add Safety Window',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.red),
              onPressed: (){}
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
            child: isLoading
                ? CircularProgressIndicator()
                : Column(
              children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: grey.withOpacity(0.5), width: 2.5),
                          onPressed: () {
                            _selectImage(
                                ImagePicker.pickImage(
                                    source: ImageSource.gallery),
                                1);
                          },
                          child: _displayChild1()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: grey.withOpacity(0.5), width: 2.5),
                          onPressed: () {
                            _selectImage(
                                ImagePicker.pickImage(
                                    source: ImageSource.gallery),
                                2);
                          },
                          child: _displayChild2()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                        borderSide: BorderSide(
                            color: grey.withOpacity(0.5), width: 2.5),
                        onPressed: () {
                          _selectImage(
                              ImagePicker.pickImage(
                                  source: ImageSource.gallery),
                              3);
                        },
                        child: _displayChild3(),
                      ),
                    ),
                  ),
                ],
              ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'enter a product name with 10 characters at maximum',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: red, fontSize: 12),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: windowNameController,
                    decoration: InputDecoration(hintText: 'Product name'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'You must enter the product name';
                      } else if (value.length > 10) {
                        return 'Product name cant have more than 10 letters';
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Price',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'You must enter the product name';
                      }
                    },
                  ),
                ),
                FlatButton(
                  color: red,
                  textColor: white,
                  child: Text('add product'),
                  onPressed: () {
                    validateAndUpload();
                  },
                )
              ],
            )

        ),
      ),
    );
  }


  changeSelectedCategory(String selectedCategory) {
    setState(() => _currentCategory = selectedCategory);
  }

  changeSelectedBrand(String selectedBrand) {
    setState(() => _currentCategory = selectedBrand);
  }

  void changeSelectedSize(String size) {
    if(selectedSizes.contains(size)){
      setState(() {
        selectedSizes.remove(size);
      });
    }else{
      setState(() {
        selectedSizes.insert(0, size);
      });
    }
  }
  void changeSelectedLocks(String locktype) {
    if(selectedLocks.contains(locktype)){
      setState(() {
        selectedLocks.remove(locktype);
      });
    }else{
      setState(() {
        selectedLocks.insert(0, locktype);
      });
    }
  }
  void validateAndUpload() async {
    if (formKey.currentState.validate()) {
      setState(() => isLoading = true);
      if (true) {
        if (nameController != null) {
          String imageUrl1;
          String imageUrl2;
          String imageUrl3;

          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture1 =
              "1${DateTime
              .now()
              .millisecondsSinceEpoch
              .toString()}.jpg";
          UploadTask task1 =
          storage.ref().child(picture1).putFile(_image1);
          final String picture2 =
              "2${DateTime
              .now()
              .millisecondsSinceEpoch
              .toString()}.jpg";
          UploadTask task2 =
          storage.ref().child(picture2).putFile(_image2);
          final String picture3 =
              "3${DateTime
              .now()
              .millisecondsSinceEpoch
              .toString()}.jpg";
          UploadTask task3 =
          storage.ref().child(picture3).putFile(_image3);
//
          TaskSnapshot snapshot1 =
          await task1.then((snapshot) => snapshot);
          TaskSnapshot snapshot2 =
          await task2.then((snapshot) => snapshot);

          task3.then((snapshot3) async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();
            imageUrl2 = await snapshot2.ref.getDownloadURL();
            imageUrl3 = await snapshot3.ref.getDownloadURL();
            List<String> imageList = [imageUrl1, imageUrl2, imageUrl3];


            safetyWindowService.uploadProduct({
              "name": windowNameController.text,
              "price": double.parse(priceController.text),
              "images":imageList,
              "category": 'safewindow'
            });
            formKey.currentState.reset();
            setState(() => isLoading = false);
            Fluttertoast.showToast(msg: 'Product added');
            Navigator.pop(context);
          });
        }
        else {
          setState(() => isLoading = false);

//          Fluttertoast.showToast(msg: 'select atleast one size');
        }
      } else {
        setState(() => isLoading = false);

//        Fluttertoast.showToast(msg: 'all the images must be provided');
      }
    }
  }



  void _selectImage(Future<File> pickImage, int imageNumber) async {
    File tempImg = await pickImage;
    switch (imageNumber) {
      case 1:
        setState(() => _image1 = tempImg);
        break;
      case 2:
        setState(() => _image2 = tempImg);
        break;
      case 3:
        setState(() => _image3 = tempImg);
        break;
    }
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image2,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 50, 14, 50),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image3,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

}
//ListView(
//children: <Widget>[
////        add category
//Row(
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text('Category: ', style: TextStyle(color: red),),
//),
//DropdownButton(items: <String>['Door', 'Window'].map((String value) {
//return new DropdownMenuItem<String>(
//value: value,
//child: new Text(value),
//);
//}).toList(), onChanged: changeSelectedCategory, value: _currentCategory,),
//],
//),
////add product name
//ListTile(
//leading: Icon(Icons.add),
//title: TextFormField(
//controller: nameController,
//decoration: InputDecoration(
//hintText: "Enter the Product Name"
//),
//),
//onTap: () {
//},
//),
//Divider(),
////add brand
////          Row(
////            children: <Widget>[
////              Padding(
////                padding: const EdgeInsets.all(8.0),
////                child: Text('Category: ', style: TextStyle(color: red),),
////              ),
////              DropdownButton(items: <String>['Door', 'Window'].map((String value) {
////                return new DropdownMenuItem<String>(
////                  value: value,
////                  child: new Text(value),
////                );
////              }).toList(), onChanged: changeSelectedCategory, value: _currentCategory,),
////
//////              Padding(
//////                padding: const EdgeInsets.all(8.0),
//////                child: Text('Brand: ', style: TextStyle(color: red),),
//////              ),
//////              DropdownButton(items: brandsDropDown, onChanged: changeSelectedBrand, value: _currentBrand,),
////            ],
////          ),
////          Divider(),
//ListTile(
//leading: Icon(Icons.money_rounded),
//title: TextFormField(
//controller: priceController,
//decoration: InputDecoration(
//hintText: "Enter the Product Price"
//),
//),
//onTap: () {
//},
//),
//Divider(),
//ListTile(
//title: Text("Add Product to Database"),
//onTap: (){
//productService.createProduct(nameController.text, _currentCategory, priceController.text);
//Fluttertoast.showToast(msg: 'Product created :)');
//Navigator.pop(context);
//},
//)
//],
//),