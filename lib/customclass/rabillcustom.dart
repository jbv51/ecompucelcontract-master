

class rabillcustom {
  dynamic ForwardedDate,
  ApprovedDate,
  DeductedAmount,
  TotalAmount,
  FinalAmount,
  ForwardedAmount,
  totalAmountofBILL,
  isFinalBill,
  ApprovedAmount,
  SerialNumber,
  CreatedDate,
  isApproved,
  isForwarded,
  RABillid;
  rabillcustom({this.ForwardedDate,
    this.ApprovedDate,
    this.DeductedAmount,
    this.TotalAmount,
    this.FinalAmount,
    this.ForwardedAmount,
    this.totalAmountofBILL,
    this.isFinalBill,
    this.ApprovedAmount,
    this.SerialNumber,
    this.CreatedDate,
    this.isApproved,
    this.isForwarded,
    this. RABillid});
  factory rabillcustom.fromJson(Map<String, dynamic> json) {
    return rabillcustom(
        ForwardedDate: json['ForwardedDate'],
        ApprovedDate: json['ApprovedDate'],
        DeductedAmount: json['DeductedAmount'],
        TotalAmount: json['TotalAmount'],
        FinalAmount: json['FinalAmount'],
        ForwardedAmount: json['ForwardedAmount'],
        totalAmountofBILL: json['totalAmountofBILL'],
        isFinalBill: json['isFinalBill'],
        ApprovedAmount: json['ApprovedAmount'],
        SerialNumber: json['SerialNumber'],
        CreatedDate: json['CreatedDate'],
        isApproved: json['isApproved'],
        isForwarded: json['isForwarded'],
        RABillid: json['RABillid'],
    );
  }


}