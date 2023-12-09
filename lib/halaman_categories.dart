import 'package:flutter/material.dart';
import 'package:responsiprakpam/api_data_source.dart';
import 'package:responsiprakpam/halaman_meals.dart';

import 'categories.dart';

class HalamanCategories extends StatefulWidget {
  const HalamanCategories({super.key});

  @override
  State<HalamanCategories> createState() => _HalamanCategoriesState();
}

class _HalamanCategoriesState extends State<HalamanCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEALS CATEGORIES',
          style: TextStyle(color: Colors.white),
          ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: _buildListUserBody(),
    );
  }
  Widget _buildListUserBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadCategories(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if(snapshot.hasError){
            return _buildErrorSection();
          }
          if(snapshot.hasData){
            CategoriesData dataMeals =
            CategoriesData.fromJson(snapshot.data);
            return _buildSuccesSection(dataMeals);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection(){
    return Text("Error Bos");
  }

  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccesSection(CategoriesData results){
    return ListView.builder(
        itemCount: results.categories!.length,
        itemBuilder: (BuildContext context, int index){
          return _buildItemUsers(results.categories![index]);
        }
    );
  }

  Widget _buildItemUsers(Categories dataMeals){
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HalamanMeals(ini: dataMeals.strCategory!),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.network(dataMeals.strCategoryThumb??''),
                  ),
                  SizedBox(height: 10,),
                  Text(dataMeals.strCategory!),
                  SizedBox(height: 10,),
                  Text(dataMeals.strCategoryDescription!),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
