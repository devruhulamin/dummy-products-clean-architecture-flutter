
import '../../domain/entities/review.dart';
import '../../utility/methods.dart';

class ReviewModel extends Review {
  ReviewModel({
    required super.rating,
    required super.comment,
    required super.date,
    required super.reviewerName,
    required super.reviewerEmail,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: tryParseInt(json['rating']),
      comment: json['comment'] ?? '',
      date: tryParseDateTime(json['date']),
      reviewerName: json['reviewerName'] ?? '',
      reviewerEmail: json['reviewerEmail'] ?? '',
    );
  }
  factory ReviewModel.empty(Map<String, dynamic> json) {
    return ReviewModel(
      rating: 0,
      comment: '',
      date: tryParseDateTime(json['date']),
      reviewerName: '',
      reviewerEmail: '',
    );
  }
}
