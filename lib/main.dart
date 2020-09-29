import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:testeweb/core/controller/subcategoria_controller.dart';
import 'package:testeweb/core/model/subcategoria.dart';
import 'package:testeweb/paginas/subcategoria/subcategoria_list_home.dart';
import 'package:testeweb/paginas/produto/produto_list.dart';

import 'core/controller/produto_controller.dart';

void main() async {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<ProdutoController>(ProdutoController());
  getIt.registerSingleton<SubCategoriaController>(SubCategoriaController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ofertas - tem todos os dias',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'BELACLASSE.com.br'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BELACLASSE.com.br",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: true,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Menu 1"), Text("Menu 2")],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   color: Colors.purple,
            //   width: double.infinity,
            //   height: 70,
            // ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.93,
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Mais popular",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 200,
                      color: Colors.tealAccent,
                      child: SubCategoriaListHome(),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Produtos em destaque",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.orangeAccent,
                      child: ProdutoList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: buildDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print("tettetete");
        },
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 15, left: 20),
            height: 55,
            color: Colors.purple,
            child: Text(
              "Opções",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
