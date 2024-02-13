// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String message) sendMessage,
    required TResult Function(String id) newChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String message)? sendMessage,
    TResult? Function(String id)? newChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String message)? sendMessage,
    TResult Function(String id)? newChat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_NewChat value) newChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_NewChat value)? newChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_NewChat value)? newChat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageEventCopyWith<$Res> {
  factory $MessageEventCopyWith(
          MessageEvent value, $Res Function(MessageEvent) then) =
      _$MessageEventCopyWithImpl<$Res, MessageEvent>;
}

/// @nodoc
class _$MessageEventCopyWithImpl<$Res, $Val extends MessageEvent>
    implements $MessageEventCopyWith<$Res> {
  _$MessageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'MessageEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String message) sendMessage,
    required TResult Function(String id) newChat,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String message)? sendMessage,
    TResult? Function(String id)? newChat,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String message)? sendMessage,
    TResult Function(String id)? newChat,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_NewChat value) newChat,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_NewChat value)? newChat,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_NewChat value)? newChat,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements MessageEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
          _$SendMessageImpl value, $Res Function(_$SendMessageImpl) then) =
      __$$SendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
      _$SendMessageImpl _value, $Res Function(_$SendMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SendMessageImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessageImpl implements _SendMessage {
  const _$SendMessageImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MessageEvent.sendMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String message) sendMessage,
    required TResult Function(String id) newChat,
  }) {
    return sendMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String message)? sendMessage,
    TResult? Function(String id)? newChat,
  }) {
    return sendMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String message)? sendMessage,
    TResult Function(String id)? newChat,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_NewChat value) newChat,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_NewChat value)? newChat,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_NewChat value)? newChat,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _SendMessage implements MessageEvent {
  const factory _SendMessage(final String message) = _$SendMessageImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewChatImplCopyWith<$Res> {
  factory _$$NewChatImplCopyWith(
          _$NewChatImpl value, $Res Function(_$NewChatImpl) then) =
      __$$NewChatImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$NewChatImplCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res, _$NewChatImpl>
    implements _$$NewChatImplCopyWith<$Res> {
  __$$NewChatImplCopyWithImpl(
      _$NewChatImpl _value, $Res Function(_$NewChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$NewChatImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NewChatImpl implements _NewChat {
  const _$NewChatImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'MessageEvent.newChat(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewChatImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewChatImplCopyWith<_$NewChatImpl> get copyWith =>
      __$$NewChatImplCopyWithImpl<_$NewChatImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String message) sendMessage,
    required TResult Function(String id) newChat,
  }) {
    return newChat(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String message)? sendMessage,
    TResult? Function(String id)? newChat,
  }) {
    return newChat?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String message)? sendMessage,
    TResult Function(String id)? newChat,
    required TResult orElse(),
  }) {
    if (newChat != null) {
      return newChat(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_NewChat value) newChat,
  }) {
    return newChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_NewChat value)? newChat,
  }) {
    return newChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_NewChat value)? newChat,
    required TResult orElse(),
  }) {
    if (newChat != null) {
      return newChat(this);
    }
    return orElse();
  }
}

abstract class _NewChat implements MessageEvent {
  const factory _NewChat(final String id) = _$NewChatImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$NewChatImplCopyWith<_$NewChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MessageState {
  bool get isLoading => throw _privateConstructorUsedError;
  ResponseFailure? get error => throw _privateConstructorUsedError;
  List<ChatModel> get item => throw _privateConstructorUsedError;
  ChatsViewModel? get chatsViewModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageStateCopyWith<MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStateCopyWith<$Res> {
  factory $MessageStateCopyWith(
          MessageState value, $Res Function(MessageState) then) =
      _$MessageStateCopyWithImpl<$Res, MessageState>;
  @useResult
  $Res call(
      {bool isLoading,
      ResponseFailure? error,
      List<ChatModel> item,
      ChatsViewModel? chatsViewModel});

  $ResponseFailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$MessageStateCopyWithImpl<$Res, $Val extends MessageState>
    implements $MessageStateCopyWith<$Res> {
  _$MessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? item = null,
    Object? chatsViewModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ResponseFailure?,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
      chatsViewModel: freezed == chatsViewModel
          ? _value.chatsViewModel
          : chatsViewModel // ignore: cast_nullable_to_non_nullable
              as ChatsViewModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResponseFailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ResponseFailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageStateImplCopyWith<$Res>
    implements $MessageStateCopyWith<$Res> {
  factory _$$MessageStateImplCopyWith(
          _$MessageStateImpl value, $Res Function(_$MessageStateImpl) then) =
      __$$MessageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      ResponseFailure? error,
      List<ChatModel> item,
      ChatsViewModel? chatsViewModel});

  @override
  $ResponseFailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$MessageStateImplCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res, _$MessageStateImpl>
    implements _$$MessageStateImplCopyWith<$Res> {
  __$$MessageStateImplCopyWithImpl(
      _$MessageStateImpl _value, $Res Function(_$MessageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? item = null,
    Object? chatsViewModel = freezed,
  }) {
    return _then(_$MessageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ResponseFailure?,
      item: null == item
          ? _value._item
          : item // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
      chatsViewModel: freezed == chatsViewModel
          ? _value.chatsViewModel
          : chatsViewModel // ignore: cast_nullable_to_non_nullable
              as ChatsViewModel?,
    ));
  }
}

/// @nodoc

class _$MessageStateImpl implements _MessageState {
  const _$MessageStateImpl(
      {this.isLoading = false,
      this.error = null,
      final List<ChatModel> item = const [],
      this.chatsViewModel = null})
      : _item = item;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final ResponseFailure? error;
  final List<ChatModel> _item;
  @override
  @JsonKey()
  List<ChatModel> get item {
    if (_item is EqualUnmodifiableListView) return _item;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_item);
  }

  @override
  @JsonKey()
  final ChatsViewModel? chatsViewModel;

  @override
  String toString() {
    return 'MessageState(isLoading: $isLoading, error: $error, item: $item, chatsViewModel: $chatsViewModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._item, _item) &&
            (identical(other.chatsViewModel, chatsViewModel) ||
                other.chatsViewModel == chatsViewModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error,
      const DeepCollectionEquality().hash(_item), chatsViewModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageStateImplCopyWith<_$MessageStateImpl> get copyWith =>
      __$$MessageStateImplCopyWithImpl<_$MessageStateImpl>(this, _$identity);
}

abstract class _MessageState implements MessageState {
  const factory _MessageState(
      {final bool isLoading,
      final ResponseFailure? error,
      final List<ChatModel> item,
      final ChatsViewModel? chatsViewModel}) = _$MessageStateImpl;

  @override
  bool get isLoading;
  @override
  ResponseFailure? get error;
  @override
  List<ChatModel> get item;
  @override
  ChatsViewModel? get chatsViewModel;
  @override
  @JsonKey(ignore: true)
  _$$MessageStateImplCopyWith<_$MessageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
