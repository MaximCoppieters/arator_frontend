import 'dart:io';

import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/data/FruitModel.dart';
import 'package:arator/data/Produce.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

class SellerAddProductPage extends StatefulWidget {
  @override
  _SellerAddProductPageState createState() => _SellerAddProductPageState();
}

class _SellerAddProductPageState extends State<SellerAddProductPage> {
  File _image;
  Produce _fruit;
  String _fruitClassText = "";
  TextEditingController _amountController;
  TextEditingController _unitController;
  TextEditingController _descriptionController;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  upload(File imageFile) async {
    var uri = Uri.parse(
        "https://classifyfruitspxltwo.azurewebsites.net/api/classify_image_function");

    var imageBinary = imageFile.readAsBytesSync();
    var res = await http.post(uri,
        headers: {'Content-Type': 'image/jpeg'}, body: imageBinary);
    String classification = res.body;
    List<String> speciesInformation = classification.split("-");

    String family = speciesInformation[0];
    String species = speciesInformation[1];
    String subspecies = speciesInformation[2];

    var fruit =
        new Produce(species, imageFile.path, null, null, null, null, null);
    fruit.family = family;
    fruit.subspecies = subspecies;
    return fruit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Produce'),
      ),
      body: ScopedModelDescendant<ProduceModel>(
        builder: (context, child, model) => PageBodyContainer(
          child: Column(
            children: <Widget>[
              Text(
                "Take a photo",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              GestureDetector(
                onTap: getImage,
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.orange)),
                  child: _image == null
                      ? Text('No image selected.')
                      : Image.file(_image),
                ),
              ),
              Container(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Product details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Amount"),
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Unit"),
                    controller: _unitController,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Description"),
                    controller: _descriptionController,
                  ),
                ],
              ),
              _image != null
                  ? RaisedButton(
                      child: Text("Identify Fruit"),
                      onPressed: () async {
                        _fruit = await upload(_image);
                        setState(() {
                          _fruitClassText = "Your fruit is classified as " +
                              _fruit.toString();
                        });
                      },
                    )
                  : Container(),
              Text(
                _fruitClassText,
                style: TextStyle(color: Colors.green, fontSize: 20.0),
              ),
              Spacer(),
              _image != null
                  ? RaisedButton(
                      child: Text("Add Produce"),
                      onPressed: () async {
                        save(_fruit, model);
                        Navigator.of(context).pushNamed("/seller-tab");
                      },
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void save(Produce fruit, ProduceModel model) {
    model.add(fruit);
    print("family:" + fruit.family);
    print("species:" + fruit.species);
    print("subspecies:" + fruit.subspecies);
    print("imagePath:" + fruit.imagePath);
  }
}
