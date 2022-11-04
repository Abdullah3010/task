import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/core/user/current_user.dart';
import 'package:jop_task/core/utils/app_colors.dart';
import 'package:jop_task/core/widgets/rounded_button.dart';
import 'package:jop_task/features/gallery/presentation/bloc/my_gallery_bloc/my_gallery_bloc.dart';
import 'package:jop_task/features/gallery/presentation/widgets/my_image_widget.dart';
import 'package:jop_task/features/gallery/presentation/widgets/pick_image_widget.dart';
import 'package:jop_task/injector.dart';

class MyGalleryScreen extends StatelessWidget {
  const MyGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MyGalleryBloc>(
        create: (context) =>
            MyInjector.injector<MyGalleryBloc>()..add(GetImagesEvent()),
        child: BlocBuilder<MyGalleryBloc, MyGalleryState>(
          builder: (context, state) {
            final bloc = BlocProvider.of<MyGalleryBloc>(context);
            return Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.blue,
                    Colors.blue.shade200,
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 30,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Welcome\n${CurrentUser.getUser()!.name.split(' ')[0]}',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              width: 60,
                              height: 60,
                              color: AppColors.primary,
                              child: const Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundedButton(
                              color: Colors.white,
                              onPressed: () {
                                bloc.add(GetImagesEvent());
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(Icons.arrow_back),
                                  Text(
                                    'Log Out',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: RoundedButton(
                              color: Colors.white,
                              onPressed: () {
                                pickImage(context);
                                bloc.add(GetImagesEvent());
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(Icons.upload),
                                  Text(
                                    'Upload',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            itemCount: bloc.imagesUrl.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 25,
                              mainAxisSpacing: 25,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return MyImageWidget(url: bloc.imagesUrl[index]);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void pickImage(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.white.withOpacity(0),
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.transparent,
        // insetPadding: const EdgeInsets.all(22),
        content: SizedBox(
          height: 250,
          child: MyImagePicker(),
        ),
        actionsAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
