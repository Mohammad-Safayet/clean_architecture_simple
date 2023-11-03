import 'package:freezed_annotation/freezed_annotation.dart';

part 'random.freezed.dart';

@freezed
class Random with _$Random {
  const factory Random({
    required List<String> categories,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String iconUrl,
    required String id,
    required String url,
    required String value,
  }) = _Random;
}
