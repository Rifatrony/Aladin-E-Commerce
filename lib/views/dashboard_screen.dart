import 'package:aladin_ecommerce/views/navbar.dart';
import 'package:aladin_ecommerce/widgets/app_text.dart';
import 'package:aladin_ecommerce/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      drawer: const Navbar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade50,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Aladin E-Commerce",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 16),
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SearchWidget(),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200, shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 14,
                          )),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.red),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: const Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://static.vecteezy.com/system/resources/thumbnails/004/707/493/small/online-shopping-on-phone-buy-sell-business-digital-web-banner-application-money-advertising-payment-ecommerce-illustration-search-vector.jpg")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                    title: "Categories",
                    fontSize: 18,
                    color: Colors.redAccent.shade400,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.redAccent.shade400,
                  )
                ],
              ),
            ),
            const CategoryWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TitleText(title: "Latest Product", fontSize: 18, color: Colors.redAccent.shade400,),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.27,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Wrap(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 8,
                          ),
                          height: Get.height * 0.23,
                          width: Get.width * 0.34,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(15)),
                                  child: Image.network(
                                    "https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/04/honey-1296x728-header.jpg?w=1155&h=1528",
                                    height: 100,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        "Ekel Green Tea AHA BHA PHA Brightening Toner (250ml)",
                                        textAlign: TextAlign.justify,
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.005,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const AppText(
                                            title: "500 Tk",
                                            textSize: 13.0,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          AppText(
                                            title: "500 Tk",
                                            textSize: 13.0,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.w500,
                                            textDecoration: TextDecoration.lineThrough,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.015,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TitleText(title: "Best Selling", fontSize: 18, color: Colors.redAccent.shade400,),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.27,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Wrap(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 8,
                          ),
                          height: Get.height * 0.23,
                          width: Get.width * 0.34,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(16)),
                                  child: Image.network(
                                    "https://sinin.com.bd/wp-content/uploads/2022/03/FoxS-Crystal-Clear-Fruits-Flavored-Candy-1-600x600.jpg",
                                    height: 10,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        "Ekel Green Tea AHA BHA PHA Brightening Toner (250ml)",
                                        textAlign: TextAlign.justify,
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.005,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const AppText(
                                            title: "500 Tk",
                                            textSize: 13.0,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          AppText(
                                            title: "500 Tk",
                                            textSize: 13.0,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.w500,
                                            textDecoration: TextDecoration.lineThrough,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.015,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TitleText(title: "Sale Product", fontSize: 18, color: Colors.redAccent.shade400,),
            ),
            const Product(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TitleText(title: "Feature Product", fontSize: 18, color: Colors.redAccent.shade400,),
            ),
            const Product(),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                    title: "Top in categories",
                    fontSize: 18,
                    color: Colors.redAccent.shade400,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.redAccent.shade400,
                  )
                ],
              ),
            ),
            
            Container(
              padding: const EdgeInsets.all(10),
              height: Get.height * 0.27,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Wrap(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 8,
                          ),
                          height: Get.height * 0.23,
                          width: Get.width * 0.34,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(15)),
                                      child: Image.network(
                                        "https://cdn.beautyamora.com.au/media/catalog/product/e/k/ekel-aloe-vera-soothing-gel-100-300g-547.jpg",
                                        height: 100,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    Positioned(
                                      left: 50,
                                      top: 10,
                                      child: Container(
                                        height: Get.height * 0.03,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white70
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "6 % Off",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        "Ekel Aloe Massage Cream 300g",
                                        textAlign: TextAlign.justify,
                                        maxLines: 4,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.005,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const AppText(
                                            title: "500 Tk",
                                            textSize: 13.0,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          AppText(
                                            title: "500 Tk",
                                            textSize: 13.0,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.w500,
                                            textDecoration: TextDecoration.lineThrough,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.015,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TitleText(title: "Also ask for", fontSize: 18, color: Colors.redAccent.shade400,),
            ),
            const Product()
          
          
          ],
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: Get.height * 0.27,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Wrap(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 8,
                  ),
                  height: Get.height * 0.23,
                  width: Get.width * 0.34,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child: Image.network(
                            "https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/04/honey-1296x728-header.jpg?w=1155&h=1528",
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "Ekel Green Tea AHA BHA PHA Brightening Toner (250ml)",
                                textAlign: TextAlign.justify,
                                maxLines: 4,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.005,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const AppText(
                                    title: "500 Tk",
                                    textSize: 13.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  AppText(
                                    title: "500 Tk",
                                    textSize: 13.0,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                    textDecoration: TextDecoration.lineThrough,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.015,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
      padding: const EdgeInsets.only(left: 4, right: 4, top: 4),
      child: GridView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 65 / 52,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                //Get.to(const CategoryWiseRestaurantPage());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey.shade200,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://img.freepik.com/free-photo/fresh-milk-mug-jug-wooden-table_114579-18233.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  const AppText(
                      title: "Name", textSize: 12.0, color: Colors.black)
                ],
              ),
            );
          }),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Icon(Icons.search),
          SizedBox(
            width: Get.width * 0.02,
          ),
          const Text("Search Here")
        ],
      ),
    );
  }
}
