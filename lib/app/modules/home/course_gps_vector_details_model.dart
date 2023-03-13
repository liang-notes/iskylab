class CourseGpsVectorDetails {
  int? status;
  String? errorMessage;
  VectorGPSObject? vectorGPSObject;

  CourseGpsVectorDetails({this.status, this.errorMessage, this.vectorGPSObject});

  CourseGpsVectorDetails.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    errorMessage = json['ErrorMessage'];
    vectorGPSObject = json['vectorGPSObject'] != null ? VectorGPSObject?.fromJson(json['vectorGPSObject']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Status'] = status;
    data['ErrorMessage'] = errorMessage;
    if (vectorGPSObject != null) {
      data['vectorGPSObject'] = vectorGPSObject?.toJson();
    }
    return data;
  }
}

class VectorGPSObject {
  VectorGPS? ocean;
  VectorGPS? background;
  VectorGPS? bridge;
  VectorGPS? vegetation;
  VectorGPS? creek;
  VectorGPS? pond;
  Holes? holes;
  VectorGPS? path;
  VectorGPS? rock;
  VectorGPS? sand;
  VectorGPS? tree;
  int? holeCount;
  VectorGPS? lake;
  VectorGPS? lava;
  VectorGPS? clubhouse;

  VectorGPSObject({
    this.ocean,
    this.background,
    this.bridge,
    this.vegetation,
    this.creek,
    this.pond,
    this.holes,
    this.path,
    this.rock,
    this.sand,
    this.tree,
    this.holeCount,
    this.lake,
    this.lava,
    this.clubhouse,
  });

  VectorGPSObject.fromJson(Map<String, dynamic> json) {
    ocean = json['VectorGPS'] != null ? VectorGPS?.fromJson(json['VectorGPS']) : null;
    background = json['Background'] != null ? VectorGPS?.fromJson(json['Background']) : null;
    bridge = json['Bridge'] != null ? VectorGPS?.fromJson(json['Bridge']) : null;
    vegetation = json['Vegetation'] != null ? VectorGPS?.fromJson(json['Vegetation']) : null;
    creek = json['Creek'] != null ? VectorGPS?.fromJson(json['Creek']) : null;
    pond = json['Pond'] != null ? VectorGPS?.fromJson(json['Pond']) : null;
    holes = json['Holes'] != null ? Holes?.fromJson(json['Holes']) : null;
    path = json['Path'] != null ? VectorGPS?.fromJson(json['Path']) : null;
    rock = json['Rock'] != null ? VectorGPS?.fromJson(json['Rock']) : null;
    sand = json['Sand'] != null ? VectorGPS?.fromJson(json['Sand']) : null;
    tree = json['Tree'] != null ? VectorGPS?.fromJson(json['Tree']) : null;
    holeCount = json['HoleCount'];
    lake = json['Lake'] != null ? VectorGPS?.fromJson(json['Lake']) : null;
    lava = json['Lava'] != null ? VectorGPS?.fromJson(json['Lava']) : null;
    clubhouse = json['Clubhouse'] != null ? VectorGPS?.fromJson(json['Clubhouse']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (ocean != null) {
      data['VectorGPS'] = ocean?.toJson();
    }
    if (background != null) {
      data['Background'] = background?.toJson();
    }
    if (bridge != null) {
      data['Bridge'] = bridge?.toJson();
    }
    if (vegetation != null) {
      data['Vegetation'] = vegetation?.toJson();
    }
    if (creek != null) {
      data['Creek'] = creek?.toJson();
    }
    if (pond != null) {
      data['Pond'] = pond?.toJson();
    }
    if (holes != null) {
      data['Holes'] = holes?.toJson();
    }
    if (path != null) {
      data['Path'] = path?.toJson();
    }
    if (rock != null) {
      data['Rock'] = rock?.toJson();
    }
    if (sand != null) {
      data['Sand'] = sand?.toJson();
    }
    if (tree != null) {
      data['Tree'] = tree?.toJson();
    }
    data['HoleCount'] = holeCount;
    if (lake != null) {
      data['Lake'] = lake?.toJson();
    }
    if (lava != null) {
      data['Lava'] = lava?.toJson();
    }
    if (clubhouse != null) {
      data['Clubhouse'] = clubhouse?.toJson();
    }
    return data;
  }
}

class VectorGPS {
  int? shapeCount;
  Shapes? shapes;

  VectorGPS({this.shapeCount, this.shapes});

  VectorGPS.fromJson(Map<String, dynamic> json) {
    shapeCount = json['ShapeCount'];
    shapes = json['Shapes'] != null ? Shapes?.fromJson(json['Shapes']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ShapeCount'] = shapeCount;
    if (shapes != null) {
      data['Shapes'] = shapes?.toJson();
    }
    return data;
  }
}

class Shapes {
  List<Shape>? shape;

  Shapes({this.shape});

  Shapes.fromJson(Map<String, dynamic> json) {
    if (json['Shape'] != null) {
      shape = <Shape>[];
      json['Shape'].forEach((v) {
        shape?.add(Shape.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (shape != null) {
      data['Shape'] = shape?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VegetationShape {
  Attributes? attributes;
  String? points;

  VegetationShape({this.attributes, this.points});

  VegetationShape.fromJson(Map<String, dynamic> json) {
    attributes = json['Attributes'] != null ? Attributes?.fromJson(json['Attributes']) : null;
    points = json['Points'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (attributes != null) {
      data['Attributes'] = attributes?.toJson();
    }
    data['Points'] = points;
    return data;
  }
}

class Attributes {
  int? description;
  int? type;
  int? size;

  Attributes({this.description});

  Attributes.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
    type = json['Type'];
    size = json['Size'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Description'] = description;
    data['Type'] = type;
    data['Size'] = size;
    return data;
  }
}

class Shape {
  String? points;

  Shape({this.points});

  Shape.fromJson(Map<String, dynamic> json) {
    points = json['Points'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Points'] = points;
    return data;
  }
}

class Holes {
  List<Hole>? hole;

  Holes({this.hole});

  Holes.fromJson(Map<String, dynamic> json) {
    if (json['Hole'] != null) {
      hole = <Hole>[];
      json['Hole'].forEach((v) {
        hole?.add(Hole.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (hole != null) {
      data['Hole'] = hole?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hole {
  VectorGPS? greencenter;
  VectorGPS? bunker;
  VectorGPS? centralpath;
  VectorGPS? teeboxcenter;
  VectorGPS? perimeter;
  int? holeNumber;
  VectorGPS? green;
  VectorGPS? fairway;
  VectorGPS? teebox;

  Hole(
      {this.greencenter,
      this.bunker,
      this.centralpath,
      this.teeboxcenter,
      this.perimeter,
      this.holeNumber,
      this.green,
      this.fairway,
      this.teebox});

  Hole.fromJson(Map<String, dynamic> json) {
    greencenter = json['Greencenter'] != null ? VectorGPS?.fromJson(json['Greencenter']) : null;
    bunker = json['Bunker'] != null ? VectorGPS?.fromJson(json['Bunker']) : null;
    centralpath = json['Centralpath'] != null ? VectorGPS?.fromJson(json['Centralpath']) : null;
    teeboxcenter = json['Teeboxcenter'] != null ? VectorGPS?.fromJson(json['Teeboxcenter']) : null;
    perimeter = json['Perimeter'] != null ? VectorGPS?.fromJson(json['Perimeter']) : null;
    holeNumber = json['HoleNumber'];
    green = json['Green'] != null ? VectorGPS?.fromJson(json['Green']) : null;
    fairway = json['Fairway'] != null ? VectorGPS?.fromJson(json['Fairway']) : null;
    teebox = json['Teebox'] != null ? VectorGPS?.fromJson(json['Teebox']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (greencenter != null) {
      data['Greencenter'] = greencenter?.toJson();
    }
    if (bunker != null) {
      data['Bunker'] = bunker?.toJson();
    }
    if (centralpath != null) {
      data['Centralpath'] = centralpath?.toJson();
    }
    if (teeboxcenter != null) {
      data['Teeboxcenter'] = teeboxcenter?.toJson();
    }
    if (perimeter != null) {
      data['Perimeter'] = perimeter?.toJson();
    }
    data['HoleNumber'] = holeNumber;
    if (green != null) {
      data['Green'] = green?.toJson();
    }
    if (fairway != null) {
      data['Fairway'] = fairway?.toJson();
    }
    if (teebox != null) {
      data['Teebox'] = teebox?.toJson();
    }
    return data;
  }
}
