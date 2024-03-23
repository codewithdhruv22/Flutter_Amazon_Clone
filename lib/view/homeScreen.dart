import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider_controller/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home-screen';


    static const List<String> carouselImages = [
    'https://s3.amazonaws.com/media.mediapost.com/dam/cropped/2019/12/06/screenshot-2019-12-05-at-23107-pm_kKdoMd4.png',
    'https://i.pinimg.com/originals/7d/04/31/7d0431f557e655026cfb4fa5af9b3ae7.jpg',
    'https://cdna.artstation.com/p/assets/images/images/031/542/572/large/gamunu-dissanayaka-product-cream-design.jpg?1603908970',
    'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs3/266175955/original/277ffa812eef9d27bde1251eb009ded62b75e988/unique-design-your-creative-product-advertisement-poster.jpg',
    // 'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  
  @override
  Widget build(BuildContext context) {
    final user  = Provider.of<UserProvider>(context).user;
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: (value){
                        print("SEARCH QUERY - $value");
                      },
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search Amazon.in',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic, color: Colors.black, size: 25),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
        height: 40,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 114, 226, 221),
              Color.fromARGB(255, 162, 236, 233),
            ],
            stops: [0.5, 1.0],
          ),
        ),
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  'Delivery to ${user.name} - ${user.address} ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 5,
                top: 2,
              ),
              child: Icon(
                Icons.arrow_drop_down_outlined,
                size: 18,
              ),
            )
          ],
        ),
            ),
        
        
        
        
            CarouselSlider(
        items: carouselImages.map(
          (i) {
            return Builder(
              builder: (BuildContext context) => Image.network(
                i,
                fit: BoxFit.cover,
                height: 250,
              ),
            );
          },
        ).toList(),
        options: CarouselOptions(
          viewportFraction: 1,
          height: 250,
        ),
            ),
        
        
        
        
        GestureDetector(
                  onTap: (){
                    print("GOING TO PRODUCT DETAIL SCREEN");
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        child: const Text(
                          'Holi Colorful Sale',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Image.network(
                       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGUvki1Gmdv7V_RZYYoWy1xAGW8poKgvtyoDUfRc_u2Y5O85MFkwuH0qO9Dcmik5mTBXw",
                        height: 235,
                        fit: BoxFit.fitHeight,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15),
                        alignment: Alignment.center,
                        child: const Text(
                          'Rs.70,000',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding:
                            const EdgeInsets.only(left: 15, top: 5, right: 40),
                        child: const Text(
                          'Code With Dhruv',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
        
        
        
        
        
                      
                    ],
                  ),
                ),
        
        SizedBox(height: 50,),
            Text(user.password),
             Text(user.name),
              Text(user.email),
               Text(user.type),
                Text(user.address),
                Text(user.stamp)
           
          ],
        ),
      ),




      
      )
   ;
  }
}