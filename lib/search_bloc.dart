import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfeature/search_event.dart';
import 'package:searchfeature/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(LoadedWord(words: words)) {
    on<SearchWord>((event, emit) {
      List<String> searchedTile = [];
      for (var element in words) {
        if (element.contains(event.word)) {
          searchedTile.add(element);
        }
      }

      emit(LoadedWord(words: searchedTile));
    });
  }

  static List<String> words = [
    'FLutter',
    'FLutter',
    'by',
    'FLutter guys',
    'coffee'
  ];
}
