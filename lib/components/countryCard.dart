import 'package:flutter/material.dart';
import 'package:countriesv2/pages/countryPage.dart';
import 'package:countriesv2/components/countryData.dart';

class CountryCard extends StatelessWidget{
  const CountryCard({super.key,required this.id/*, required this.flag, required this.name,
   required this.size*/});

  final int id;
  //final String flag;
  //final String name;
  //final String size;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.deepPurple,
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(maxWidth: 624),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(countries[id].name),
          Image.network(countries[id].flag),
          const Text("Размер: "),
          Text( countries[id].square + "тыс. км^2"),


          ElevatedButton(
              onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CountryPage(id : id)),
             );
        },
              child: Text('Подробнее')
          ),
        ],
      ),
    );
  }
}