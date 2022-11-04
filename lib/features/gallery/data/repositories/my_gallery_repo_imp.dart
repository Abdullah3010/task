import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jop_task/core/network/network_info.dart';
import 'package:jop_task/features/gallery/data/datasources/gallery_remote_data_source.dart';
import 'package:jop_task/features/gallery/data/models/gallery_model.dart';
import 'package:jop_task/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:jop_task/features/gallery/domain/repositories/my_gallery_repositories.dart';

class MyGalleryRepoImp extends MyGalleryRepositories {
  final GalleryRemoteDateSource galleryRemoteDateSource;
  final NetworkInfo networkInfo;

  MyGalleryRepoImp({
    required this.galleryRemoteDateSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GalleryModel>> getImages() async {
    try {
      if (await networkInfo.isConnected) {
        final images = await galleryRemoteDateSource.getImages();
        return Right(images);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, Unit>> uploadImage(XFile? image) async {
    try {
      if (await networkInfo.isConnected) {
        await galleryRemoteDateSource.uploadImage(image: image);
        return const Right(unit);
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Left(ServerFailure());
    }
  }
}
