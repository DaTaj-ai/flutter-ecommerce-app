import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ DetailsScreen/widgets/CategoryItemWidget.dart';
import '../../Models/category_response_model.dart';
import '../../Service/ApiEndPoint.dart';
import '../../Service/NetworkService.dart';

class CategoryListWidget extends StatefulWidget {
  CategoryListWidget({super.key , required this.ontap});

  void Function(String) ontap;

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();

}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  late Future<CategoryResponseModel> response;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    response = NetworkService.getCategorise(
      ApiEndpoints.category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: response,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.categories?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = snapshot.data!.categories?[index];
              return Categoryitemwidget(categori: category?? Categories() , ontap: (value){
                widget.ontap(value);
              } );
            },
          );
        } else {
          return Center(child: Text('No data'));
        }
      },
    );
  }
}
