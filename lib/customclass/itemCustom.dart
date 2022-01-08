
class itemCustom {
  dynamic  ItemNo,
  RecId,Description;
  itemCustom( {this.ItemNo,this.RecId,this.Description});

  factory itemCustom.fromJson(Map<String, dynamic> json) {
    return itemCustom(
      ItemNo: json['ItemNo'],
      RecId: json['RecId'],
      Description: json['Description'],

    );
  }
}