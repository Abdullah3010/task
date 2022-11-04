import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jop_task/core/errors/failures.dart';
import 'package:jop_task/features/gallery/domain/repositories/my_gallery_repositories.dart';

class UpladImageUseCase {
  final MyGalleryRepositories myGalleryRepositories;

  UpladImageUseCase(this.myGalleryRepositories);

  Future<Either<Failure, Unit>> call(XFile? image) async {
    return await myGalleryRepositories.uploadImage(image);
  }
}
