import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/components/drawers/DrawerAdmin.dart';
import 'package:flutter_reduxx/components/drawers/DrawerAnonymous.dart';
import 'package:flutter_reduxx/components/drawers/DrawerUser.dart';
import 'package:flutter_reduxx/models/article.dart';
import 'package:flutter_reduxx/redux/actions.dart';
import 'package:flutter_reduxx/views/Articles/articleList.dart';
import 'package:flutter_reduxx/views/Films/filmList.dart';
import 'Shows/showList.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/models/role.dart';
import 'package:flutter_reduxx/models/showing.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:flutter_reduxx/views/Price/price.dart';
import 'package:flutter_reduxx/views/home_viewmodel.dart';
import 'package:redux/redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Home extends StatefulWidget {

  final Store<AppState> store;

  Home(this.store);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
int _selectedIndex = 0;

static final List<Showing> showing = [
  Showing(film: Film(id: 1, title: 'axsd', createdAt: new DateTime(2020), director: 'asdasd', description: 'asdasfasd'), date: 'asdasf', hour: '12:00')
];

static final List<Article> articles = [
  Article(id: 1, description: 'asdasd0', status: 'xd', createdAt: new DateTime(2020))
];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {

  List<Widget> _widgetOptions = <Widget>[

        ArticleList(articles: articles),
        ShowingList(showing: showing),
        FilmList(),
        Price(),

      ];
    takeRole(User user) {
      Role role = user != null ? user.role : Role.ANONYMOUS;
      // print(role);
        switch (role) {
        case Role.ADMIN:
          return DrawerAdmin();
          break;
        case Role.USER:
          return DrawerUser(widget.store);
          break;
        default: return DrawerAnonymous();
      }
    }
    return new StoreConnector<AppState, HomeViewModel>(
      converter: ((Store<AppState> store) => HomeViewModel.create(store)),
      onInit: (store) async {
        store.dispatch(LoadingFromDBStart());
      },
      builder: (BuildContext context, HomeViewModel viewModel) => 
      
      Scaffold (
        appBar: AppBar(
          title: Text('Apka'),
        ),
        drawer: takeRole(viewModel.user),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.redAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.newspaper, color: Colors.black),
              activeIcon: FaIcon(FontAwesomeIcons.newspaper, color: Colors.red),
              title: Text('Nowości'),
              // backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.slideshow, color: Colors.black),
              activeIcon: Icon(Icons.slideshow, color: Colors.red),
              title: Text('Seanse'),
              // backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.video, color: Colors.black),
              activeIcon: FaIcon(FontAwesomeIcons.video, color: Colors.red),
              title: Text('Filmy'),
              // backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money, color: Colors.black),
              activeIcon: Icon(Icons.attach_money, color: Colors.red),
              title: Text('Cennik'),
              // backgroundColor: Colors.black,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red[300],
          onTap: _onItemTapped,
        ),
      )
    );
  }
}

