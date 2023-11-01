import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories.freezed.dart';

@freezed
class Categories with _$Categories {
  const factory Categories({
    required List<String> list,
  }) = _Categories;
}
