class Hall {

  int id;
  String name;
  int countOfSeats;
  List occupiedSeats;

  Hall({this.id, this.name, this.countOfSeats, this.occupiedSeats});

  Hall.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    countOfSeats = json['countOfSeats'];
    occupiedSeats = json['occupiedSeats'];
  }
}