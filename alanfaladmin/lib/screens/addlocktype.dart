import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alanfaladmin/db/lockcount.dart';
import 'package:alanfaladmin/db/locktype.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddLockType extends StatefulWidget {
  @override
  _AddLockTypeState createState() => _AddLockTypeState();
}

class _AddLockTypeState extends State<AddLockType> {
  List<DocumentSnapshot> lockCount = <DocumentSnapshot>[];
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  LockCountService lockCountService = LockCountService();
  LockTypeService lockTypeService = LockTypeService();
  String _currentCategory;
  List<String> selectedSizes = <String>[];
  List<DropdownMenuItem<String>> lockCountDropDown =
      <DropdownMenuItem<String>>[];

  @override
  void initState() {
    getLockCount();
  }

  List<DropdownMenuItem<String>> getLockCountDropdown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < lockCount.length; i++) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
                child: Text(lockCount[i].data()['lockcount']),
                value: lockCount[i].data()['lockcount']));
      });
    }
    return items;
  }

  changeSelectedCategory(String selectedCategory) {
    setState(() => _currentCategory = selectedCategory);
  }

  changeSelectedBrand(String selectedBrand) {
    setState(() => _currentCategory = selectedBrand);
  }

  void changeSelectedSize(String size) {
    if (selectedSizes.contains(size)) {
      setState(() {
        selectedSizes.remove(size);
      });
    } else {
      setState(() {
        selectedSizes.insert(0, size);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.2,
        backgroundColor: Colors.black,
        title: Text(
          'Add New Lock Type',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.red), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: <Widget>[
          //add product name
          ListTile(
            leading: Icon(Icons.add, color: Colors.deepOrange,),
            title: TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Enter the Lock Type"),
            ),
            onTap: () {},
          ),
//          Divider(),
          //add brand
//          Row(
//            children: <Widget>[
//              Checkbox(
//                  value: selectedSizes.contains('Single'),
//                  onChanged: (value) => changeSelectedSize('Single')),
//              Text('Single'),
//              Checkbox(
//                  value: selectedSizes.contains('Double'),
//                  onChanged: (value) => changeSelectedSize('Double')),
//              Text('Double'),
//            ],
//          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Lock Count: ',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ),
              DropdownButton(
                items: lockCountDropDown,
                onChanged: changeSelectedCategory,
                value: _currentCategory,
              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(
//                  'Brand: ',
//                  style: TextStyle(color: Colors.red),
//                ),
//              ),
//              DropdownButton(
//                items: brandsDropDown,
//                onChanged: changeSelectedBrand,
//                value: _currentBrand,
//              ),
            ],
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add, color: Colors.deepOrange,),
            title: TextFormField(
              controller: priceController,
              decoration: InputDecoration(hintText: "Enter the Price for the Lock Type"),
            ),
            onTap: () {},
          ),
          Divider(),
//          ListTile(
//            leading: Icon(Icons.add_circle_outline),
//            title: Text("Quantity"),
//            onTap: () {
//            },
//          ),
//          Divider(),
//          ListTile(
//            leading: Icon(Icons.library_books),
//            title: Text("Color"),
//            onTap: () {},
//          ),
//          Divider(),
          ListTile(
            title: Text("Add Lock Type to Database"),
            onTap: () {
              lockTypeService.createLockType(nameController.text, _currentCategory, priceController.text);
              Fluttertoast.showToast(msg: 'Lock Count created :)');
              Navigator.pop(context);
            },
          )
        ],
      ),

    );
  }
  getLockCount() async {
    List<DocumentSnapshot> data = await lockCountService.getLockCount();
    print(data.length);
    setState(() {
      lockCount = data;
      lockCountDropDown = getLockCountDropdown();
      _currentCategory = lockCount[0].data()['lockcount'];
    });
  }
}
