class ReplyModel1 {
  String groupName;
  int id;
  int sortIndex;
  int parentId;
  int replyType;
  List<ReplysListBean> replys;

  ReplyModel1(
      {this.groupName,
      this.id,
      this.sortIndex,
      this.parentId,
      this.replyType,
      this.replys});

  ReplyModel1.fromJson(Map<String, dynamic> json) {
    this.groupName = json['groupName'];
    this.id = json['id'];
    this.sortIndex = json['sortIndex'];
    this.parentId = json['parentId'];
    this.replyType = json['replyType'];
    this.replys = (json['replys'] as List) != null
        ? (json['replys'] as List)
            .map((i) => ReplysListBean.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupName'] = this.groupName;
    data['id'] = this.id;
    data['sortIndex'] = this.sortIndex;
    data['parentId'] = this.parentId;
    data['replyType'] = this.replyType;
    data['replys'] = this.replys != null
        ? this.replys.map((i) => i.toJson()).toList()
        : null;
    return data;
  }

  @override
  String toString() {
    return 'ReplyModel1{groupName: $groupName, id: $id, sortIndex: $sortIndex, parentId: $parentId, replyType: $replyType, replys: $replys}';
  }
}

class ReplysListBean {
  String title;
  String content;
  String createTime;
  String lastUpdateTime;
  int id;
  int tenantId;
  int groupId;
  int accountId;
  int msgType;
  int sortIndex;

  ReplysListBean(
      {this.title,
      this.content,
      this.createTime,
      this.lastUpdateTime,
      this.id,
      this.tenantId,
      this.groupId,
      this.accountId,
      this.msgType,
      this.sortIndex});

  ReplysListBean.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.content = json['content'];
    this.createTime = json['createTime'];
    this.lastUpdateTime = json['lastUpdateTime'];
    this.id = json['id'];
    this.tenantId = json['tenantId'];
    this.groupId = json['groupId'];
    this.accountId = json['accountId'];
    this.msgType = json['msgType'];
    this.sortIndex = json['sortIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['createTime'] = this.createTime;
    data['lastUpdateTime'] = this.lastUpdateTime;
    data['id'] = this.id;
    data['tenantId'] = this.tenantId;
    data['groupId'] = this.groupId;
    data['accountId'] = this.accountId;
    data['msgType'] = this.msgType;
    data['sortIndex'] = this.sortIndex;
    return data;
  }

  @override
  String toString() {
    return 'ReplysListBean{title: $title, content: $content, createTime: $createTime, lastUpdateTime: $lastUpdateTime, id: $id, tenantId: $tenantId, groupId: $groupId, accountId: $accountId, msgType: $msgType, sortIndex: $sortIndex}';
  }
}
