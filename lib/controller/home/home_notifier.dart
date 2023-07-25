import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/models/category_data.dart';
import '../../model/models/story_data.dart';
import '../../view/companents/app_assets.dart';
import 'home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super( const HomeState());

  initial() async {
    getStory();
    getCategory();
  }

  getStory() async {
    final data = await rootBundle.loadString(Assets.medicalDataStory);
    List<StoryData> storyList = storyDataFromJson(data);
    state = state.copyWith(storyList: storyList);
  }

  getCategory() async {
    final data = await rootBundle.loadString(Assets.medicalDataCategory);
    List<CategoryData> categories = categoryDataFromJson(data);
    state = state.copyWith(categories: categories);
  }
}
