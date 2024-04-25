abstract class SearchState {}

class InitialState extends SearchState {}

class LoadingState extends SearchState {}

class LoadedWord extends SearchState {
  final List<String> words;
  LoadedWord({required this.words});
}
