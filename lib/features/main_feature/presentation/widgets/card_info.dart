import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 150,
      width: double.maxFinite,
      child: Card(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [Text("Item nº 1"), Icon(Icons.close)],
              ),
            ),
            const Text(
                "Titulo: \nsunt aut facere repellat provident occaecati excepturi optio reprehenderit"),
            const Text(
                "Descrição: \nsunt aut facere repellat provident occaecati excepturi optio reprehenderit"),
          ],
        ),
      ),
    );
  }
}
