import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/models/chat_data.dart';
import '../../model/models/message_data.dart';
import '../../model/models/product_data.dart';
import '../local_storeage.dart';
import 'chat_state.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(const ChatState());
  final ImagePicker _image = ImagePicker();

  getMessage(List<ProductData> shops) {
    List<MessageData> messages = GMedicalStorage.getMessage(shops);
    state = state.copyWith(messages: messages);
  }

  selectShop(ProductData? shopData) {
    state = state.copyWith(selectDoc: shopData);
    List<MessageData> messages = List.from(state.messages);
    state = state.copyWith(chats: [], image: "");
    for (int i = 0; i < messages.length; i++) {
      if (messages[i].shopId == state.selectDoc?.id) {
        state = state.copyWith(chats: messages[i].chats ?? []);
      }
    }
  }

  addMessage(ChatData chat) {
    List<MessageData> messages = List.from(state.messages);
    List<ChatData> chats = [];
    int index = -1;
    for (int i = 0; i < messages.length; i++) {
      if (messages[i].shopId == state.selectDoc?.id) {
        chats = messages[i].chats ?? [];
        index = i;
      }
    }
    chats.insert(0, chat);
    if (index != -1) {
      messages[index] = messages[index].copyWith(chats: chats);
    } else {
      messages.add(
        MessageData(
            chats: chats, shopId: state.selectDoc?.id, doctors: state.selectDoc),
      );
    }
    GMedicalStorage.setMessage(messages);

    state = state.copyWith(messages: messages, chats: chats);
  }

  getImageGallery() {
    _image.pickImage(source: ImageSource.gallery).then((value) async {
      if (value != null) {
        CroppedFile? cropperImage =
            await ImageCropper().cropImage(sourcePath: value.path);
        if (cropperImage?.path.isNotEmpty ?? false) {
          addMessage(ChatData(
            date: DateTime.now(),
            img: cropperImage!.path,
            isUser: true,
          ));
        }
      }
    });
  }

  getImageCamera() {
    _image.pickImage(source: ImageSource.camera).then((value) async {
      if (value != null) {
        CroppedFile? cropperImage =
            await ImageCropper().cropImage(sourcePath: value.path);
        if (cropperImage?.path.isNotEmpty ?? false) {
          addMessage(ChatData(
            date: DateTime.now(),
            img: cropperImage!.path,
            isUser: true,
          ));
        }
      }
    });
  }
}
