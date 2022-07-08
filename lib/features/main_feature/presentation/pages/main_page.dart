import 'package:flutter/material.dart';

import 'package:tarefa_pratica_bloc_adapter/features/main_feature/presentation/widgets/card_info.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.blue,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: 2,
              itemBuilder: ((context, index) => const CardInfo())),
        ),
      ),
    );
  }
}
