import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'api_data_source.dart';
import 'detailsmeals.dart';

class HalamanDetailMeals extends StatelessWidget {
  final String id;
  const HalamanDetailMeals({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Details",
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadDetailMeals(id),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            DetailsMealsData data = DetailsMealsData.fromJson(snapshot.data);
            var meals = data.meals?[0];
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Container(
                    child: Image.network(
                      meals!.strMealThumb!,
                      height: MediaQuery.sizeOf(context).height/3,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    meals.strMeal!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Category: ${meals.strCategory!}'),
                      Text('Area: ${meals.strArea!}'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ingredients:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(meals.strIngredient1 ?? ''),
                  Text(meals.strIngredient2 ?? ''),
                  Text(meals.strIngredient3 ?? ''),
                  Text(meals.strIngredient4 ?? ''),
                  Text(meals.strIngredient5 ?? ''),
                  Text(meals.strIngredient6 ?? ''),
                  Text(meals.strIngredient7 ?? ''),
                  Text(meals.strIngredient8 ?? ''),
                  Text(meals.strIngredient9 ?? ''),
                  Text(meals.strIngredient10 ?? ''),
                  Text(meals.strIngredient11 ?? ''),
                  Text(meals.strIngredient12 ?? ''),
                  Text(meals.strIngredient13 ?? ''),
                  Text(meals.strIngredient14 ?? ''),
                  Text(meals.strIngredient15 ?? ''),
                  Text(meals.strIngredient16 ?? ''),
                  Text(meals.strIngredient17 ?? ''),
                  Text(meals.strIngredient18 ?? ''),
                  Text(meals.strIngredient19 ?? ''),
                  Text(meals.strIngredient20 ?? ''),
                  SizedBox(height: 10),
                  Text(
                    'Instructions',
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(meals.strInstructions!),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        launchUrl(Uri.parse(meals.strYoutube!));
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(50)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.play_arrow),
                          Text('Watch Tutorial'),
                        ],
                      )
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
