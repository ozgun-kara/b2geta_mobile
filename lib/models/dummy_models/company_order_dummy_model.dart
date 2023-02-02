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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imgUrl'] = imgUrl;
    data['date'] = date;
    data['orderNumber'] = orderNumber;
    data['productNumber'] = productNumber;
    data['seller'] = seller;
    data['address'] = address;
    data['quantity'] = quantity;
    data['status'] = status;
    data['title'] = title;
    data['totalPayment'] = totalPayment;
    data['unitPayment'] = unitPayment;
    return data;
  }
}
