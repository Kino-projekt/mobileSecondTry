import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/components/drawers/DrawerAdmin.dart';
import 'package:flutter_reduxx/components/drawers/DrawerAnonymous.dart';
import 'package:flutter_reduxx/components/drawers/DrawerUser.dart';
import 'package:flutter_reduxx/models/news.dart';
import 'package:flutter_reduxx/views/News/newsList.dart';
import 'Shows/showList.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/models/role.dart';
import 'package:flutter_reduxx/models/showing.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:flutter_reduxx/views/Price/price.dart';
import 'package:flutter_reduxx/views/home_viewmodel.dart';
import 'package:redux/redux.dart';


class Home extends StatefulWidget {

  final Store<AppState> store;

  Home(this.store);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
int _selectedIndex = 0;

List<Widget> _widgetOptions = <Widget>[

  NewsList(news: news),
  ShowingList(showing: showing),
  Price(),
  Price(),

];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

static final List<Showing> showing = [
  Showing(film: Film(img: 'https://bi.im-g.pl/im/15/b7/15/z22769941Q,Shrek.jpg', title: 'Shrek', timeInMinutes: 120, minAge: 3), hour: '12:00', date: '20 października 2020'),
  Showing(film: Film(img: 'https://techsetter.pl/wp-content/uploads/2019/12/rise_kubacki_main1.jpg', title: 'Star Wars', timeInMinutes: 170, minAge: 13), hour: '21:00', date: '21 października 2020'),
  Showing(film: Film(img: 'https://i.ytimg.com/vi/OqMN-lInSXw/hqdefault.jpg', title: 'Za szybcy za wśiekli', timeInMinutes: 120, minAge: 16), hour: '12:00', date: '20 października 2020'),
  Showing(film: Film(img: 'https://bi.im-g.pl/im/15/b7/15/z22769941Q,Shrek.jpg', title: 'Shrek', timeInMinutes: 120, minAge: 3), hour: '12:00', date: '20 października 2020'),
  Showing(film: Film(img: 'https://techsetter.pl/wp-content/uploads/2019/12/rise_kubacki_main1.jpg', title: 'Star Wars', timeInMinutes: 170, minAge: 13), hour: '21:00', date: '21 października 2020'),
  Showing(film: Film(img: 'https://i.ytimg.com/vi/OqMN-lInSXw/hqdefault.jpg', title: 'Za szybcy za wśiekli', timeInMinutes: 120, minAge: 16), hour: '12:00', date: '20 października 2020'),
  Showing(film: Film(img: 'https://bi.im-g.pl/im/15/b7/15/z22769941Q,Shrek.jpg', title: 'Shrek', timeInMinutes: 120, minAge: 3), hour: '12:00', date: '20 października 2020'),
  Showing(film: Film(img: 'https://techsetter.pl/wp-content/uploads/2019/12/rise_kubacki_main1.jpg', title: 'Star Wars', timeInMinutes: 170, minAge: 13), hour: '21:00', date: '21 października 2020'),
  Showing(film: Film(img: 'https://i.ytimg.com/vi/OqMN-lInSXw/hqdefault.jpg', title: 'Za szybcy za wśiekli', timeInMinutes: 120, minAge: 16), hour: '12:00', date: '20 października 2020'),
];


static final List<Film> films = [
  Film(img: 'https://bi.im-g.pl/im/15/b7/15/z22769941Q,Shrek.jpg', title: 'Shrek', timeInMinutes: 120, minAge: 3),
  Film(img: 'https://techsetter.pl/wp-content/uploads/2019/12/rise_kubacki_main1.jpg', title: 'Star Wars', timeInMinutes: 170, minAge: 13),
];

static final List<News> news = [
  News(img: 'https://bi.im-g.pl/im/15/b7/15/z22769941Q,Shrek.jpg', content: 'Schrek już w kinach!', author: 'Paweł Jadach', createDate: '17.04'),
  News(img: 'https://bi.im-g.pl/im/15/b7/15/z22769941Q,Shrek.jpg', content: 'Schrek już w kinach!', author: 'Paweł Jadach', createDate: '17.04'),
];


  @override
  Widget build(BuildContext context) {


    takeRole(User user) {
      Role role = user != null ? user.role : Role.USER;
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
              icon: Icon(Icons.home, color: Colors.black),
              activeIcon: Icon(Icons.home, color: Colors.red),
              title: Text('Nowości'),
              // backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Colors.black),
              activeIcon: Icon(Icons.business, color: Colors.red),
              title: Text('Seanse'),
              // backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school, color: Colors.black),
              activeIcon: Icon(Icons.school, color: Colors.red),
              title: Text('Filmy'),
              // backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school, color: Colors.black),
              activeIcon: Icon(Icons.school, color: Colors.red),
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

