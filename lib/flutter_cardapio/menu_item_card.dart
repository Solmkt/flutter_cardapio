import 'package:flutter/material.dart';
import 'package:fluttercardapio/flutter_cardapio/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  MenuItemCard({Key key, this.menuItem, this.onTap}) : super(key: key);

  MenuItem menuItem;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Colors.yellowAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                menuItem.title,
              ),
              Expanded(
                child: Image.network(menuItem.image),
              ),
              Text(menuItem.description),
              Text('R\$ ${menuItem.price.toStringAsFixed(2)}')
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
