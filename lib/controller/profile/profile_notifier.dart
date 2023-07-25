
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../model/models/user_data.dart';
import '../local_storeage.dart';
import 'profile_state.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier() : super(const ProfileState());

  final ImagePicker _image = ImagePicker();

  initial() {
    state = state.copyWith(
      gender: GMedicalStorage.getUser()?.gender,
      image: GMedicalStorage.getUser()?.img,
    );

  }

  setGender(dynamic gender) async {
    if (gender != null) {
      state = state.copyWith(gender: gender);
    }
  }

  saveProfile({
    required String? firstName,
    required String? lastName,
    required String? email,
    required PhoneNumber? phoneNumber,
    required VoidCallback onSuccess,
  }) async {
    await GMedicalStorage.setUser(UserData(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      gender: state.gender,
      img: state.image,
    ));
    onSuccess();
  }

  getImageGallery() {
    _image.pickImage(source: ImageSource.gallery).then((value) async {
      if (value != null) {
        CroppedFile? cropperImage =
            await ImageCropper().cropImage(sourcePath: value.path);
        if (cropperImage?.path.isNotEmpty ?? false) {
          state = state.copyWith(image: cropperImage!.path);
        }
      }
    });
  }


}
