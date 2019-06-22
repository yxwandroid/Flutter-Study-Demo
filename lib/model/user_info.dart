class UserInfo {
  String accessToken;
  String tokenType;
  String refreshToken;
  int expiresIn;

  UserInfo({this.accessToken, this.tokenType, this.refreshToken, this.expiresIn});

  UserInfo.fromJson(Map<String, dynamic> json) {    
    this.accessToken = json['access_token'];
    this.tokenType = json['token_type'];
    this.refreshToken = json['refresh_token'];
    this.expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['refresh_token'] = this.refreshToken;
    data['expires_in'] = this.expiresIn;
    return data;
  }

}
