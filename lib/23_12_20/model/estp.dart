class Estp {
  String title;
  String subTitle;
  String imageUrl;
  String description;

//<editor-fold desc="Data Methods">
  Estp({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Estp &&
              runtimeType == other.runtimeType &&
              title == other.title &&
              subTitle == other.subTitle &&
              imageUrl == other.imageUrl &&
              description == other.description);

  @override
  int get hashCode =>
      title.hashCode ^
      subTitle.hashCode ^
      imageUrl.hashCode ^
      description.hashCode;

  @override
  String toString() {
    return 'Estp{' +
        ' title: $title,' +
        ' subTitle: $subTitle,' +
        ' imageUrl: $imageUrl,' +
        ' description: $description,' +
        '}';
  }

  Estp copyWith({
    String? title,
    String? subTitle,
    String? imageUrl,
    String? description,
  }) {
    return Estp(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'subTitle': this.subTitle,
      'imageUrl': this.imageUrl,
      'description': this.description,
    };
  }

  factory Estp.fromMap(Map<String, dynamic> map) {
    return Estp(
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
      imageUrl: map['imageUrl'] as String,
      description: map['description'] as String,
    );
  }

//</editor-fold>
}