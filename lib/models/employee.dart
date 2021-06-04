class Employee {
  int id;
  String firstname;
  String lastname;
  String streetaddress;
  String postcode;
  String city;
  String drivingLicense;
  String login;
  String agencies;
  String address;
  String ville;
  int timespan;

  Employee(
      {this.id,
      this.firstname,
      this.lastname,
      this.city,
      this.drivingLicense,
      this.login,
      this.address,
      this.ville,
      this.postcode,
      this.timespan});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    streetaddress = json['streetaddress'];
    city = json['city'];
    drivingLicense = json['drivingLicense'];
    login = json['login'];
    address = json['address'];
    ville = json['ville'];
    postcode = json['postcode'];
    timespan = json['timespan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['streetaddress'] = this.streetaddress;
    data['postcode'] = this.postcode;
    data['city'] = this.city;
    data['drivingLicense'] = this.drivingLicense;
    data['login'] = this.login;
    data['address'] = this.address;
    data['ville'] = this.ville;
    data['timespan'] = this.timespan;
    return data;
  }
}
