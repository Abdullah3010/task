import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jop_task/core/widgets/glass_container.dart';
import 'package:jop_task/core/widgets/rounded_button.dart';
import 'package:jop_task/features/gallery/presentation/bloc/my_gallery_bloc/my_gallery_bloc.dart';
import 'package:jop_task/injector.dart';

class MyImagePicker extends StatefulWidget {
  const MyImagePicker({super.key});

  @override
  State<MyImagePicker> createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyGalleryBloc>(
      create: (context) => MyInjector.injector<MyGalleryBloc>(),
      child: BlocConsumer<MyGalleryBloc, MyGalleryState>(
        listener: (context, state) {
          if (state is UploadImageSuccess) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<MyGalleryBloc>(context);
          return GlassContainer(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                    onPressed: () async {
                      final image = await pickImage(ImageSource.gallery);
                      bloc.add(UploadImageEvent(image: image));
                    },
                    color: const Color(0xffEFD8F9),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image),
                          Text(
                            'Gallery',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedButton(
                    onPressed: () async {
                      final image = await pickImage(ImageSource.camera);
                      bloc.add(UploadImageEvent(image: image));
                    },
                    color: const Color(0xffEBF6FF),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.camera),
                          Text(
                            'Camera',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<XFile?> pickImage(ImageSource imageSource) async {
    final picker = ImagePicker();
    return await picker.pickImage(source: imageSource);
  }
}
