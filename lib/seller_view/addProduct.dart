import 'package:flutter/material.dart';

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
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
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
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 2 - 70,
                      vertical: 20),
                  decoration: BoxDecoration(color:Colors.amberAccent),
                  child: const Text("Add Product"),
                )),
          ],
        ),
      )),
    );
  }
}
