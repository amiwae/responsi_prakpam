// halaman_meals.dart
import 'package:flutter/material.dart';
import 'package:responsiprakpam/halaman_detailmeals.dart';
import 'api_data_source.dart';
import 'categories.dart';
import 'meals.dart';

class HalamanMeals extends StatelessWidget {
  final String ini;

  HalamanMeals({required this.ini});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$ini Meals',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadMeals(ini),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            MealsData data = MealsData.fromJson(snapshot.data);
            return GridView.builder(
              itemCount: data.meals?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
              ),
              itemBuilder: (context, index) {
                var meals = data.meals![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(
                      builder: (context) => HalamanDetailMeals(id: meals.idMeal!),
                    )
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          child: Image.network( meals.strMealThumb!,
                          ),
                        ),
                        SizedBox(height: 10),
                        FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(meals.strMeal!)
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
