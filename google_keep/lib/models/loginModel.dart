class LoginModel {
  Response response;
  Result result;

  LoginModel({this.response, this.result});

  LoginModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Response {
  bool success;
  String sId;
  Token token;
  String name;

  Response({this.success, this.sId, this.token, this.name});

  Response.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    sId = json['_id'];
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['_id'] = this.sId;
    if (this.token != null) {
      data['token'] = this.token.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class Token {
  bool status;
  String message;
  String token;

  Token({this.status, this.message, this.token});

  Token.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
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



class LoginErrorModel {
  bool success;
  String error;

  LoginErrorModel({this.success, this.error});

  LoginErrorModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    return data;
  }
}
