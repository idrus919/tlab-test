class FilmModel {
  final String? id,
      rank,
      rankUpDown,
      title,
      fullTitle,
      year,
      image,
      crew,
      imDbRating,
      imDbRatingCount;

  FilmModel({
    this.id,
    this.rank,
    this.rankUpDown,
    this.title,
    this.fullTitle,
    this.year,
    this.image,
    this.crew,
    this.imDbRating,
    this.imDbRatingCount,
  });

  static FilmModel? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return FilmModel(
      id: json['id'],
      rank: json['rank'],
      rankUpDown: json['rankUpDown'],
      title: json['title'],
      fullTitle: json['fullTitle'],
      year: json['year'],
      image: json['image'],
      crew: json['crew'],
      imDbRating: json['imDbRating'],
      imDbRatingCount: json['imDbRatingCount'],
    );
  }
}
