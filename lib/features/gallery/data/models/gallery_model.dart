import 'package:jop_task/features/gallery/domain/entities/gallery.dart';

class GalleryModel extends Gallery {
  const GalleryModel({required super.imagesUrl});

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      imagesUrl: json['data']['images'].map<String>((image) => image.toString()).toList(),
    );
  }
  //!
  Map<String, dynamic> toJson() {
    return {
      'imagesUrl': imagesUrl,
    };
  }

  @override
  List<Object?> get props => [
        imagesUrl,
      ];
}
