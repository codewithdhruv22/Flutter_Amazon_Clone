import 'dart:io';

import 'package:amazon_clone/seller_view/controller/AdminController.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productQuantityController =
      TextEditingController();

  String category = 'Computer';
  List<String> productCat = [
    'Mobiles',
    'Clothes',
    'Computer',
    'Makeup',
    'Audio',
    'Printers',
    'Toys',
    'Electronics'
  ];

  List<File> _images = [];

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
            title: Text(
              "Add Product",
              style: TextStyle(color: Colors.black),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
            child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              _images.length == 0
                  ? GestureDetector(
                      onTap: _getImage,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.folder_open,
                                size: 40,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Select Product Images',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              Text(
                                'You can select upto 6 images',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 300,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _images.length + 1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                        ),
                        itemBuilder: (context, index) {
                          if (index == _images.length) {
                            if (_images.length == 6) {
                              return SizedBox();
                            } else {
                              return GestureDetector(
                                onTap: _getImage,
                                child: Container(
                                  color: Colors.grey[200],
                                  child: Icon(Icons.add),
                                ),
                              );
                            }
                          } else {
                            return GestureDetector(
                              onTap: () {
                                _viewImageInDialog(_images[index], index);
                              },
                              child: Stack(
                                children: [
                                  Hero(
                                    tag: 'imageHero$index',
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Image.file(
                                        _images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _images.remove(_images[index]);
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20.0),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: productNameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a product name.';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: "Product Name",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: productDescriptionController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a product description.';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: "Product Description",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: productPriceController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a product price.';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: "Product Price (in Rs.)",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: productQuantityController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a product price.';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  hintText: "Product Quantity",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                    value: category,
                    items: productCat.map((String item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    }),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                  onTap: () {
                   AdminController().sellProduct
                   (
                    context: context,
                    name: 'MacbookPro', description: 'Des',
                    price: 20000,
                    quantity: 232,
                    category: 'adada',
                    images: _images,
                    
                   );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 2 - 70,
                        vertical: 20),
                    decoration: BoxDecoration(color: Colors.amberAccent),
                    child: const Text("Add Product"),
                  )),
            ],
          ),
        )),
      ),
    );
  }

  void _viewImageInDialog(File imageFile, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Hero(
                tag: 'imageHero$index',
                child: Image.file(
                  imageFile,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
