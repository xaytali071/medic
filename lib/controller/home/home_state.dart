// ignore_for_file: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../model/models/category_data.dart';
import '../../model/models/story_data.dart';
import '../../view/companents/app_assets.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default([]) List<StoryData> storyList,
    @Default([]) List<CategoryData> categories,
    @Default(
      [
        Assets.banner1,
        Assets.banner2,
        Assets.banner3,
      ],
    )
    List<String> banners,
  }) = _HomeState;
}
