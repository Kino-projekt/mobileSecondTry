import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_reduxx/components/drawers/DrawerAdmin.dart';
import 'package:flutter_reduxx/components/drawers/DrawerAnonymous.dart';
import 'package:flutter_reduxx/components/drawers/DrawerUser.dart';
import 'package:flutter_reduxx/components/filmList.dart';
import 'package:flutter_reduxx/models/film.dart';
import 'package:flutter_reduxx/models/role.dart';
import 'package:flutter_reduxx/models/showing.dart';
import 'package:flutter_reduxx/models/user.dart';
import 'package:flutter_reduxx/redux/app_state.dart';
import 'package:flutter_reduxx/views/home_viewmodel.dart';
import 'package:redux/redux.dart';


class Home extends StatelessWidget {

  final Store<AppState> store;

  Home(this.store);


final List<Showing> showing = [
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
          return DrawerUser(store);
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
          child: FilmList(showing: showing),
        ),
      )
    );
  }
}

