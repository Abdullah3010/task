part of 'my_gallery_bloc.dart';

abstract class MyGalleryEvent extends Equatable {
  const MyGalleryEvent();

  @override
  List<Object> get props => [];
}

class GetImagesEvent extends MyGalleryEvent {}

class UploadImageEvent extends MyGalleryEvent {
  final XFile? image;

  const UploadImageEvent({this.image});
}
