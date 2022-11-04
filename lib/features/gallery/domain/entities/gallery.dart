import 'package:equatable/equatable.dart';

class Gallery extends Equatable {
  final List<String> imagesUrl;

  const Gallery({required this.imagesUrl});

  @override
  List<Object?> get props => [
        imagesUrl,
      ];
}
