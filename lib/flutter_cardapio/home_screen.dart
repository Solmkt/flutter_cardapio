import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercardapio/flutter_cardapio/list_menu.dart';
import 'package:fluttercardapio/flutter_cardapio/menu_item_card.dart';
import 'package:fluttercardapio/flutter_cardapio/meu_pedido.dart';

import 'menu_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListMenu listMenu = ListMenu();

  List<MenuItem> listaMenuItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loja Teste'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                itemCount: listMenu.menuItem.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return Center(
                    child: MenuItemCard(
                      menuItem: listMenu.menuItem[index],
                      onTap: () {
                        if (listaMenuItems.contains(listMenu.menuItem[index])) {
                        } else {
                          listaMenuItems.add(listMenu.menuItem[index]);
                        }

                        print('${listMenu.menuItem[index].title}');
                        print('${listMenu.menuItem[index].quantity}');
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MeuPedido(
                        listaMenuItems: listaMenuItems,
                      )));
        },
      ),
    );
  }
}
