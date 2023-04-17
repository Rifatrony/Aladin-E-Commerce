import 'package:aladin_ecommerce/view_model/category/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWiseProductScreen extends StatefulWidget {
  const CategoryWiseProductScreen({super.key});

  @override
  State<CategoryWiseProductScreen> createState() =>
      _CategoryWiseProductScreenState();
}

class _CategoryWiseProductScreenState extends State<CategoryWiseProductScreen> {
  final categoryViewModel = Get.put(CategoryViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Name"),
      ),
      body: Obx(
        () => Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey.shade200,
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                      itemCount: categoryViewModel
                          .category.value.categories!.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Column(
                                children: [
                                  ClipRRect(
                                    child: Image(
                                        image: NetworkImage(categoryViewModel
                                            .category
                                            .value
                                            .categories!
                                            .data![index]
                                            .image
                                            .toString())),
                                  ),
                                  SizedBox(height: Get.height * 0.01,),
                                  Text(categoryViewModel
                                      .category.value.categories!.data![index].name
                                      .toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 12
                                      ),
                                      ),
                                  SizedBox(height: Get.height * 0.01,),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )),
            // Expanded(
            //     flex: 3,
            //     child: ListView.builder(
            //         itemCount: 10, itemBuilder: (context, index) {}))
          ],
        ),
      ),
    );
  }
}
