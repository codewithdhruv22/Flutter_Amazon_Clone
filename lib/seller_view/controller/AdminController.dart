import 'dart:io';

import 'package:amazon_clone/controller/provider_controller/user_provider.dart';
import 'package:amazon_clone/utils/errorHandler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

class AdminController{


void sellProduct({

  required BuildContext context,
  required String name,
  required String description,
  required double price,
  required int quantity,
  required String category,
  required List<File> images,
  
  
}) async{

  final userProvider = Provider.of<UserProvider>(context, listen: false);


  try {
    final cloudinary = CloudinaryPublic('delc6lpe8', 'n2hj6ajd');

    List<String> imageUrl = [];

    images.forEach((img) async {

CloudinaryResponse res = await cloudinary.uploadFile(CloudinaryFile.fromFile(img.path, folder : name));
     
     imageUrl.add(res.secureUrl);
     print(res.secureUrl);
     });


  } catch (e) {
    showSnackBar(context, e.toString());
  }
}


}