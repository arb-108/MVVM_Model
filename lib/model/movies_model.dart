class movies {
  bool? ok;
  List<Description>? description;
  int? errorCode;

  movies({this.ok, this.description, this.errorCode});

  movies.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['description'] != null) {
      description = <Description>[];
      json['description'].forEach((v) {
        description!.add(new Description.fromJson(v));
      });
    }
    errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    if (this.description != null) {
      data['description'] = this.description!.map((v) => v.toJson()).toList();
    }
    data['error_code'] = this.errorCode;
    return data;
  }
}

class Description {
  String? tITLE;
  int? yEAR;
  String? iMDBID;
  int? rANK;
  String? aCTORS;
  String? aKA;
  String? iMDBURL;
  String? iMDBIV;
  String? iMGPOSTER;
  int? photoWidth;
  int? photoHeight;

  Description(
      {this.tITLE,
        this.yEAR,
        this.iMDBID,
        this.rANK,
        this.aCTORS,
        this.aKA,
        this.iMDBURL,
        this.iMDBIV,
        this.iMGPOSTER,
        this.photoWidth,
        this.photoHeight});

  Description.fromJson(Map<String, dynamic> json) {
    tITLE = json['#TITLE'];
    yEAR = json['#YEAR'];
    iMDBID = json['#IMDB_ID'];
    rANK = json['#RANK'];
    aCTORS = json['#ACTORS'];
    aKA = json['#AKA'];
    iMDBURL = json['#IMDB_URL'];
    iMDBIV = json['#IMDB_IV'];
    iMGPOSTER = json['#IMG_POSTER'];
    photoWidth = json['photo_width'];
    photoHeight = json['photo_height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['#TITLE'] = this.tITLE;
    data['#YEAR'] = this.yEAR;
    data['#IMDB_ID'] = this.iMDBID;
    data['#RANK'] = this.rANK;
    data['#ACTORS'] = this.aCTORS;
    data['#AKA'] = this.aKA;
    data['#IMDB_URL'] = this.iMDBURL;
    data['#IMDB_IV'] = this.iMDBIV;
    data['#IMG_POSTER'] = this.iMGPOSTER;
    data['photo_width'] = this.photoWidth;
    data['photo_height'] = this.photoHeight;
    return data;
  }
}
