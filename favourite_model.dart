class Model{
  int? id;
  String? name;
  String? location;
  String? description;
  String? image;
  String? rating;
  String? reviews;
  String? funFact;
  List<String>? photos;
 Model(
      {this.id,
      this.name,
      this.location,
      this.description,
      this.image,
      this.rating,
      this.reviews,
      this.funFact,
      this.photos});
Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    description = json['description'];
    image = json['image'];
    rating = json['rating'];
    reviews = json['reviews'];
    funFact = json['fun_fact'];
    photos = json['photos'].cast<String>();
  }
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['description'] = this.description;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    data['fun_fact'] = this.funFact;
    data['photos'] = this.photos;
    return data;
  }
}