import 'package:dartz/dartz.dart';
import 'package:jop_task/core/errors/failures.dart';
import 'package:jop_task/features/gallery/data/models/gallery_model.dart';
import 'package:jop_task/features/gallery/domain/repositories/my_gallery_repositories.dart';

class GetImagesUseCase {
  final MyGalleryRepositories myGalleryRepositories;

  GetImagesUseCase(this.myGalleryRepositories);

  Future<Either<Failure, GalleryModel>> call() async {
    return await myGalleryRepositories.getImages();
  }
}
