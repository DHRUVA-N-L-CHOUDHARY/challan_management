
class RecordModel {
    String? id;
    String? userId;
    int? amount;
    String? remarks;
    String? imageUrl;
    String? busNumber;
    String? challanType;
    String? createdAt;
    int? v;
    String? recordId;

    RecordModel({this.id, this.userId, this.amount, this.remarks, this.imageUrl, this.busNumber, this.challanType, this.createdAt, this.v, this.recordId});

    RecordModel.fromJson(Map<String, dynamic> json) {
        id = json["_id"];
        userId = json["userID"];
        amount = json["amount"];
        remarks = json["remarks"];
        imageUrl = json["imageUrl"];
        busNumber = json["busNumber"];
        challanType = json["challanType"];
        createdAt = json["createdAt"];
        v = json["__v"];
        recordId = json["recordID"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["_id"] = id;
        _data["userID"] = userId;
        _data["amount"] = amount;
        _data["remarks"] = remarks;
        _data["imageUrl"] = imageUrl;
        _data["busNumber"] = busNumber;
        _data["challanType"] = challanType;
        _data["createdAt"] = createdAt;
        _data["__v"] = v;
        _data["recordID"] = recordId;
        return _data;
    }
}