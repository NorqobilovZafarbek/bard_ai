import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'chat_view_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChatsViewModel {
  final String id;
  final String? topic;
  final DateTime createdAt;

  static const _uuid = Uuid();

  ChatsViewModel({
    String? id,
    this.topic,
    required this.createdAt,
  }) : id = id ?? _uuid.v4();

  ChatsViewModel? copyWith({
    String? id,
    String? topic,
    DateTime? dateTime,
  }) {
    return ChatsViewModel(
      id: id ?? this.id,
      topic: topic ?? this.topic,
      createdAt: createdAt,
    );
  }

  factory ChatsViewModel.fromJson(Map<String, dynamic> json) =>
      _$ChatsViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatsViewModelToJson(this);
}
