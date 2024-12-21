class Company {
  int? id;
  String? companyName;
  String? companyAddress;
  String? companyNumber;
  String? companyLogo;

  Company({
    required this.id,
    required this.companyAddress,
    required this.companyLogo,
    required this.companyName,
    required this.companyNumber,
  });

  //method to convert company object to dart
  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyLogo = json['logo'];
    companyName = json['name'];
    companyNumber = json['phone'];
    companyAddress = json['address'];
  }

  //method to convert company object to json
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = companyName;
    data['address'] = companyAddress;
    data['phone'] = companyNumber;
    data['logo'] = companyLogo;

    return data;
  }

  // {
  //   "id": 1,
  //   "Name": "Salesforce",
  //   "logo": "https://logo.clearbit.com/list-manage.com",
  //   "phone": "(555) 486-3820",
  //   "Address": "Virginia Beach, Virginia, United States"
  // },
}
