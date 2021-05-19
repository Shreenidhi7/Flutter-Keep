class User{
  String firstName;
  String lastName;
  String email;
  String password;

  User(this.firstName,this.lastName,this.email,this.password);
}


class RegistrationModel {
  bool suceses;
  Result result;

  RegistrationModel({this.suceses, this.result});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    suceses = json['suceses'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['suceses'] = this.suceses;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  String sId;
  String firstName;
  String lastName;
  String email;
  String password;
  String createdAt;
  String updatedAt;
  int iV;

  Result(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}





class RegistrationErrorModel {
  bool suceses;
  String error;

  RegistrationErrorModel({this.suceses, this.error});

  RegistrationErrorModel.fromJson(Map<String, dynamic> json) {
    suceses = json['suceses'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['suceses'] = this.suceses;
    data['error'] = this.error;
    return data;
  }
}