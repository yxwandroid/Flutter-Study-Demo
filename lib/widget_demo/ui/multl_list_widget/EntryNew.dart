class EntryNew {
  String groupName;
  int id;
  int parentId;
  int replyType;
  List<EntryNew> children;
  List<Reply> replys;
  int sortIndex;

  EntryNew(
      {this.children,
      this.groupName,
      this.id,
      this.parentId,
      this.replyType,
      this.replys,
      this.sortIndex});

  factory EntryNew.fromJson(Map<String, dynamic> json) {
    return EntryNew(
      children: json['children'] != null
          ? (json['children'] as List).map((i) => EntryNew.fromJson(i)).toList()
          : null,
      groupName: json['groupName'],
      id: json['id'],
      parentId: json['parentId'],
      replyType: json['replyType'],
      replys: json['replys'] != null
          ? (json['replys'] as List).map((i) => Reply.fromJson(i)).toList()
          : null,
      sortIndex: json['sortIndex'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupName'] = this.groupName;
    data['id'] = this.id;
    data['parentId'] = this.parentId;
    data['replyType'] = this.replyType;
    data['sortIndex'] = this.sortIndex;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    if (this.replys != null) {
      data['replys'] = this.replys.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reply {
  int accountId;
  String content;
  String createTime;
  int groupId;
  int id;
  String lastUpdateTime;
  int msgType;
  int sortIndex;
  int tenantId;
  String title;

  Reply(
      {this.accountId,
      this.content,
      this.createTime,
      this.groupId,
      this.id,
      this.lastUpdateTime,
      this.msgType,
      this.sortIndex,
      this.tenantId,
      this.title});

  factory Reply.fromJson(Map<String, dynamic> json) {
    return Reply(
      accountId: json['accountId'],
      content: json['content'],
      createTime: json['createTime'],
      groupId: json['groupId'],
      id: json['id'],
      lastUpdateTime: json['lastUpdateTime'],
      msgType: json['msgType'],
      sortIndex: json['sortIndex'],
      tenantId: json['tenantId'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountId'] = this.accountId;
    data['content'] = this.content;
    data['createTime'] = this.createTime;
    data['groupId'] = this.groupId;
    data['id'] = this.id;
    data['lastUpdateTime'] = this.lastUpdateTime;
    data['msgType'] = this.msgType;
    data['sortIndex'] = this.sortIndex;
    data['tenantId'] = this.tenantId;
    data['title'] = this.title;
    return data;
  }
}
