// ignore_for_file: depend_on_referenced_packages

import'package:freezed_annotation/freezed_annotation.dart';
import '../../model/models/chat_data.dart';
import '../../model/models/message_data.dart';
import '../../model/models/product_data.dart';


part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<MessageData> messages,
    @Default([]) List<ChatData> chats,
    @Default(null) ProductData? selectDoc,
    @Default("") String image,
  }) = _ChatState;
}
