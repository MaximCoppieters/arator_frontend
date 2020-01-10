import 'dart:io';
import 'dart:typed_data';

import 'package:arator/components/elements/button.dart';
import 'package:arator/tab_navigator.dart';
import 'package:arator/utils/enums/input_name.dart';
import 'package:arator/utils/exceptions/form_exception.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/data/model/Product.dart';
import 'package:arator/data/model/units/WeightUnit.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class SellerAddProductPage extends StatefulWidget {
  @override
  _SellerAddProductPageState createState() => _SellerAddProductPageState();
}

class _SellerAddProductPageState extends State<SellerAddProductPage> {
  File _image;
  String _fruitClassText = "";
  TextEditingController _amountController = TextEditingController();
  MoneyMaskedTextController _priceController = MoneyMaskedTextController();
  TextEditingController _descriptionController = TextEditingController();
  ProductBloc _productBloc;
  WeightUnit _weightUnit = WeightUnit.Kilogram;
  Uint8List _imageBinary;

  @override
  void initState() {
    _productBloc = BlocProvider.of<SellerProductBloc>(context);
    _productBloc.add(ResetProductEvent());

    _productBloc.listen((state) {
      if (state is ProductAdded) {
        TabNavigator.push(context, TabNavigatorRoutes.sell);
      }
    });
    super.initState();
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  upload(File imageFile) async {
    var uri = Uri.parse(
        "https://classifyfruitspxltwo.azurewebsites.net/api/classify_image_function");

    _imageBinary = imageFile.readAsBytesSync();
    var res = await http.post(uri,
        headers: {'Content-Type': 'image/jpeg'}, body: _imageBinary);
    String classification = res.body;
    List<String> speciesInformation = classification.split("-");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: PageBodyContainer(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height >= 700.0
              ? MediaQuery.of(context).size.height
              : 700.0,
          child: BlocBuilder<ProductBloc, ProductState>(
              bloc: _productBloc,
              builder: (context, productState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Take a photo",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    GestureDetector(
                      onTap: getImage,
                      child: Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange)),
                        child: _image == null
                            ? Text('No image selected.')
                            : Image.file(_image),
                      ),
                    ),
                    Text(
                      getFieldErrorText(InputName.imageUrl),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: Theme.of(context).textTheme.title.fontSize),
                    ),
                    Container(
                      height: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Product details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "0,00 €",
                              labelText: "Price",
                              errorText:
                                  getFieldErrorText(InputName.priceInEuro)),
                          keyboardType: TextInputType.number,
                          controller: _priceController,
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "12",
                                    labelText: "Amount",
                                    errorText:
                                        getFieldErrorText(InputName.amount)),
                                keyboardType: TextInputType.number,
                                controller: _amountController,
                              ),
                            ),
                            SizedBox(
                              width: 50.0,
                            ),
                            Flexible(
                              child: DropdownButton<WeightUnit>(
                                value: _weightUnit,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                underline: Container(
                                  height: 2,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onChanged: (WeightUnit newValue) {
                                  setState(() {
                                    _weightUnit = newValue;
                                  });
                                },
                                items: WeightUnit.values
                                    .map<DropdownMenuItem<WeightUnit>>(
                                        (WeightUnit weightUnit) {
                                  return DropdownMenuItem<WeightUnit>(
                                    value: weightUnit,
                                    child: Text(EnumToString.parse(weightUnit)),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                              hintText: "Describe your product",
                              labelText: "Description",
                              errorText:
                                  getFieldErrorText(InputName.description)),
                          controller: _descriptionController,
                        ),
                      ],
                    ),
                    Text(
                      _fruitClassText,
                      style: TextStyle(color: Colors.green, fontSize: 20.0),
                    ),
                    AppButton(
                      child: Text("Add Product"),
                      onPressed: () async {
                        Product product = new Product(
                            name: "test",
                            type: "Jonagold",
                            description: _descriptionController.text,
                            priceInEuro: _priceController.numberValue,
                            weightUnit: _weightUnit,
                            amount: _amountController.text.isEmpty
                                ? 0
                                : num.parse(_amountController.text),
                            image: _image);

                        _productBloc.add(AddProduct(product));
                      },
                    ),
                    productState is ProductsLoading
                        ? CircularProgressIndicator()
                        : Container(),
                  ],
                );
              }),
        ),
      ),
    );
  }

  String getFieldErrorText(InputName field) {
    if (_productBloc.state is AddProductFailed) {
      FormException error = _productBloc.state.props[0];
      if (error.field == field) {
        return error.message;
      }
    }
    return "";
  }
}
