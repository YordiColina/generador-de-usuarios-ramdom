class UserLocation{
  final String city;
  final String state;

  UserLocation.fromJson(Map<String,dynamic>json)
    :city = json['city'],
     state = json['state'];

  UserLocation(this.city, this.state);
}