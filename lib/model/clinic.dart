class Clinic {
  int portalID;
  int iD;
  String name;
  String description;
  String workTime;
  String doctors;
  String hospital;
  String mobile;
  String isType;
  String tinhTP;
  String quanHuyen;
  String xaPhuong;
  String duongPho;
  double latitude;
  double longitude;
  double kmNew;
  String logo;
  int total;
  double rAVG;
  int rMyApp;
  int rTotal;
  int cTotal;
  int r5;
  int r4;
  int r3;
  int r2;
  int r1;

  Clinic(
      {this.portalID,
      this.iD,
      this.name,
      this.description,
      this.workTime,
      this.doctors,
      this.hospital,
      this.mobile,
      this.isType,
      this.tinhTP,
      this.quanHuyen,
      this.xaPhuong,
      this.duongPho,
      this.latitude,
      this.longitude,
      this.kmNew,
      this.logo,
      this.total,
      this.rAVG,
      this.rMyApp,
      this.rTotal,
      this.cTotal,
      this.r5,
      this.r4,
      this.r3,
      this.r2,
      this.r1});

  Clinic.fromJson(Map<String, dynamic> json) {
    portalID = json['portalID'];
    iD = json['iD'];
    name = json['name'];
    description = json['description'];
    workTime = json['workTime'];
    doctors = json['doctors'];
    hospital = json['hospital'];
    mobile = json['mobile'];
    isType = json['isType'];
    tinhTP = json['tinhTP'];
    quanHuyen = json['quanHuyen'];
    xaPhuong = json['xaPhuong'];
    duongPho = json['duongPho'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    kmNew = json['km_New'];
    logo = json['logo'];
    total = json['total'];
    rAVG = json['rAVG'];
    rMyApp = json['rMyApp'];
    rTotal = json['rTotal'];
    cTotal = json['cTotal'];
    r5 = json['r5'];
    r4 = json['r4'];
    r3 = json['r3'];
    r2 = json['r2'];
    r1 = json['r1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['portalID'] = this.portalID;
    data['iD'] = this.iD;
    data['name'] = this.name;
    data['description'] = this.description;
    data['workTime'] = this.workTime;
    data['doctors'] = this.doctors;
    data['hospital'] = this.hospital;
    data['mobile'] = this.mobile;
    data['isType'] = this.isType;
    data['tinhTP'] = this.tinhTP;
    data['quanHuyen'] = this.quanHuyen;
    data['xaPhuong'] = this.xaPhuong;
    data['duongPho'] = this.duongPho;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['km_New'] = this.kmNew;
    data['logo'] = this.logo;
    data['total'] = this.total;
    data['rAVG'] = this.rAVG;
    data['rMyApp'] = this.rMyApp;
    data['rTotal'] = this.rTotal;
    data['cTotal'] = this.cTotal;
    data['r5'] = this.r5;
    data['r4'] = this.r4;
    data['r3'] = this.r3;
    data['r2'] = this.r2;
    data['r1'] = this.r1;
    return data;
  }
}
