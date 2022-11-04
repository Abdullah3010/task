import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jop_task/core/errors/failures.dart';
import 'package:jop_task/features/gallery/data/models/gallery_model.dart';

abstract class MyGalleryRepositories {
  Future<Either<Failure, GalleryModel>> getImages();
  Future<Either<Failure, Unit>> uploadImage(XFile? image);
}
