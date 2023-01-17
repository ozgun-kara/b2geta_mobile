class CompanyOrderDummyModel {
  int? id;
  String? imgUrl;
  String? date;
  String? orderNumber;
  String? productNumber;
  String? seller;
  String? address;
  String? quantity;
  String? status;
  String? title;
  String? totalPayment;
  String? unitPayment;

  CompanyOrderDummyModel(
      {this.id,
      this.imgUrl,
      this.date,
      this.orderNumber,
      this.productNumber,
      this.seller,
      this.address,
      this.quantity,
      this.status,
      this.title,
      this.totalPayment,
      this.unitPayment});

  CompanyOrderDummyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
    date = json['date'];
    orderNumber = json['orderNumber'];
    productNumber = json['productNumber'];
    seller = json['seller'];
    address = json['address'];
    quantity = json['quantity'];
    status = json['status'];
    title = json['title'];
    totalPayment = json['totalPayment'];
    unitPayment = json['unitPayment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['date'] = this.date;
    data['orderNumber'] = this.orderNumber;
    data['productNumber'] = productNumber;
    data['seller'] = this.seller;
    data['address'] = this.address;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['title'] = this.title;
    data['totalPayment'] = this.totalPayment;
    data['unitPayment'] = this.unitPayment;
    return data;
  }
}
