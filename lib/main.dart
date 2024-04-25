import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfeature/search_bloc.dart';
import 'package:searchfeature/search_event.dart';
import 'package:searchfeature/search_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (_) => SearchBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          primaryColor: Colors.blue,
          secondaryHeaderColor: Colors.black,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home: const SearchPage(),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Theme.of(context).primaryColor,
          child: Text("Search word"),
        ),
      ),
      body: Column(
        children: [_searchField(context), _words(context)],
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey, // Color of the border
            width: 1.0, // Width of the border
          ),
          borderRadius: BorderRadius.circular(10.0), // Border radius
        ),
        child: TextField(
            decoration: const InputDecoration(
              border: InputBorder.none, // Removes underline
              hintText: 'Enter some text',
            ),
            onChanged: (value) =>
                context.read<SearchBloc>().add(SearchWord(word: value))),
      ),
    );
  }

  Widget _words(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is LoadedWord) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: state.words.length,
              separatorBuilder: (context, index) => const Divider(
                thickness: 0.2,
                color: Colors.grey,
              ),
              itemBuilder: (context, index) {
                return Text(
                  state.words[index],
                  style: Theme.of(context).textTheme.headline6,
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
