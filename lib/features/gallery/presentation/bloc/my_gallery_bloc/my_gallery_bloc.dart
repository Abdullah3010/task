
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jop_task/features/gallery/domain/usecases/get_images_usecase.dart';
import 'package:jop_task/features/gallery/domain/usecases/upload_image_usecase.dart';

part 'my_gallery_event.dart';
part 'my_gallery_state.dart';

class MyGalleryBloc extends Bloc<MyGalleryEvent, MyGalleryState> {
  final GetImagesUseCase getImagesUseCase;
  final UpladImageUseCase uploadImageUseCase;
  List<String> imagesUrl = [];
  MyGalleryBloc({
    required this.getImagesUseCase,
    required this.uploadImageUseCase,
  }) : super(MyGalleryInitial()) {
    on<MyGalleryEvent>((event, emit) async {
      if (event is GetImagesEvent) {
        emit(GetImagesLoading());
        
        final images = await getImagesUseCase();
        images.fold(
          (l) => emit(GetImagesError()),
          (r) {
            imagesUrl.clear();
            imagesUrl.addAll(r.imagesUrl);
            emit(GetImagesSuccess());
          },
        );
      } else if (event is UploadImageEvent) {
        emit(UploadImageLoading());
        final response = await uploadImageUseCase(event.image);
        response.fold(
          (l) => emit(UploadImageError()),
          (r) {
            emit(UploadImageSuccess());
          },
        );
      }
    });
  }
}
