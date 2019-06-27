//群成员信息model
class ChatRoomMember {
  String wechatId;
  String nickname;
  String avatar;

  ChatRoomMember({this.wechatId, this.nickname, this.avatar});

  ChatRoomMember.fromJson(Map<String, dynamic> json) {
    this.wechatId = json['wechatId'];
    this.nickname = json['nickname'];
    this.avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wechatId'] = this.wechatId;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    return data;
  }

}
