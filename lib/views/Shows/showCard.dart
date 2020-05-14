import 'package:flutter/material.dart';
import 'package:flutter_reduxx/models/showing.dart';

class ShowCard extends StatelessWidget {

  final Showing show;

  ShowCard({this.show});


  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.network('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALcAAAETCAMAAABDSmfhAAAAQlBMVEXo6Ojp6enn5+fd3d2ZmZmVlZW0tLSSkpLOzs6bm5u4uLji4uLu7u7W1ta7u7ufn5/FxcWnp6esrKzLy8vAwMDT09PG4IofAAAEXklEQVR4nO2diW6rMBBFbRMIawhZ/v9Xnxc2E0hF6bs20j2tGhqs5mSEZzxOlIomOSONSOQZSbS3OB/0xkJvLPTGQm8s9MZCbyz0xkJvLPTGQm8s9MZCbyz0xkJvLPTGQm8s9MZCbyz0xkJvLPTGQm8s9MZCbyz0xkJvLPTGQm8s9MZCbyz0xkJvLPTGQm8s9MZCbyz0xkJvLPTGQm8s9MZCbyz0xkJvLPTGQm8s9MZCbyz0xkJvLPTGQm8s9MZCbyHUzvuPcNRbzRH2Ww0/F3zcGdZbDAJyuNFf05+Uw4nZ6eHpHnjcv4i3VHs/9LCSMny8Zd4VO2mzRKpD1/1x7/qVXnaTFo0Me53IxGinhsFpndlZc9vKsPGWNtyPTNNaoS5bp7XadmBn/HXAg3pn2uFZG+RDH97qDZS2Te9uYJZe0jy896VyeeWeXq6NXObpPqvLmz5rp6OS+TUWbzNDe+9e1n0NhUj03u4JxuM9i/eiQgrlxVucwHt0VrPrJCLvtLK126QW620y3MfyZIq3qJ+ReJeVMWt0quu9V6am8b5kZqBITGqJwFtXkU5jMrS7TryFoXDH1nsaGIf3yPz6HqelvXHeU6WPz9tfg8/nZWzeadFqVuOt/HiPAwN7Czsvb9KU76S9LPP3pG7nZZopM7CKZF7qPGjNXvP8LRby1tvl71jy4Gbd6VPLmE+uVVR1Z7E+WemKx/WJze4ReIuteH809nGuB20YR+9ZDhwPZ+uTOry3yydP+xH/lekbSrH++f8uibxkrY9V+L7BXSdFdivLsnOdmDlcwZ3NzOEjfP7u6+X+vlh7H3jYP4r3L4go3um3cHtnw3u7eD+aSvMs9GH7rta5G+3ODszb4N6uzidmI1PWJtPltd3VtHubst/UlPbYJJHGDbwHzyc/13mvv4yuzhvBjzovnLfw685Y5w887H+K96yPH59EhP38Zp1fjXc83um7trU88/erfOz6O7cD61sk87K9v/M8v836NOFHvfd2A9+3Io48qHUN6aK/9DOK6y/TYWAc3iMr3mraH4y3zi+9hbePHE+dH65vfXnnZe/tXh2c7yOLYR+ifeX9RIjBeyWf+Ll72D/p84mMJZ98qfPL/e+Y8ven90pLfwLv1ZfnT+A9NfHCzyeReev1t33/gDF71v0fnj+IXY+79bf5PYr1d6kdHsnQxvQdzVq/U/j9zjuw9/M69pS7+ssqbH8pRPeL9xWY15UDv/9EJt11M8ZbXLPp/TaBvJWU+cYW1SavpnY9XEhvtbEj+BUV2Puzr1msTb6dDukdCHpjoTcWemOhNxZ6Y6E3FnpjoTcWemOhNxZ6Y6E3FnpjoTcWemOhNxZ6Y6E3FnpjoTcWemOhNxZ6Y6E3FnpjoTcWemOhNxZ6Y6E3FnpjoTcWemOhNxZ6Y6E3FnpjoTcWemOhNxZ6Y6E3FnpjoTcWemOhNxZ6Y6E3FnpjoTcWemOhNxZ6Yzm19xlJRLP3v25GQfMPSUpFe5+/lOUAAAAASUVORK5CYII='),
              title: Text(
                show.film.title.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('${show.date} ${show.hour}'),
            ),
            SizedBox(height: 10.0),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'CZYTAJ WIĘCEJ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  ),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text(
                    'ZAREZERWUJ',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        )
      );
  }
}