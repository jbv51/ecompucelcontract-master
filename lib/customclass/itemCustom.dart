
class itemCustom {
  dynamic  ItemNo,
  RecId;
  itemCustom( {this.ItemNo,this.RecId});

  factory itemCustom.fromJson(Map<String, dynamic> json) {
    return itemCustom(
      ItemNo: json['ItemNo'],
      RecId: json['RecId'],

    );
  }
}