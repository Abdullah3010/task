part of 'my_gallery_bloc.dart';

abstract class MyGalleryState extends Equatable {
  const MyGalleryState();
  
  @override
  List<Object> get props => [];
}

class MyGalleryInitial extends MyGalleryState {}

class GetImagesLoading extends MyGalleryState {}
class GetImagesSuccess extends MyGalleryState {}
class GetImagesError extends MyGalleryState {}

class UploadImageLoading extends MyGalleryState {}
class UploadImageSuccess extends MyGalleryState {}
class UploadImageError extends MyGalleryState {}