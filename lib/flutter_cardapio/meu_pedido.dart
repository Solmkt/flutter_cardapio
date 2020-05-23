import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercardapio/flutter_cardapio/menu_item.dart';

class MeuPedido extends StatefulWidget {
  List<MenuItem> listaMenuItems;

  MeuPedido({this.listaMenuItems});

  @override
  _MeuPedidoState createState() => _MeuPedidoState();
}

class _MeuPedidoState extends State<MeuPedido> {
  List<MenuItem> get listaMenuItems => widget.listaMenuItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Pedido'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            color: Colors.blueGrey[100],
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: listaMenuItems.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                setState(() {
                                  listaMenuItems.removeAt(index);
                                });
                              }),
                          Text(listaMenuItems[index].title),
                          Column(
                            children: <Widget>[
                              Text(
                                  'R\$ ${(listaMenuItems[index].price * listaMenuItems[index].quantity).toStringAsFixed(2)}'),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          if (listaMenuItems[index].quantity ==
                                              1) {
                                            listaMenuItems.removeAt(index);
                                          } else {
                                            listaMenuItems[index].quantity--;
                                          }
                                        });
                                      }),
                                  Text(listaMenuItems[index]
                                      .quantity
                                      .toString()),
                                  IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          listaMenuItems[index].quantity++;
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('3 Itens '),
              Text(' Preço Total: R\$ 59,90'),
            ],
          ),
          RaisedButton(
            onPressed: () {},
            color: Colors.lightGreen,
            child: Text('ENVIAR MEU PEDIDO'),
          ),
        ],
      ),
    );
  }
}
