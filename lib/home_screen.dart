import 'package:book_app/presentation/bloc/remote_book_bloc.dart';
import 'package:book_app/presentation/bloc/remote_book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  _buildBody() {
    return BlocBuilder<RemoteBooksBloc, RemoteBooksState>(
      builder: (_, state) {
        if (state is RemoteBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RemoteBooksError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteBooksDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final book = state.books![index];
              return ListTile(
                title: Text(book.title),
                subtitle: Text(book.author),
              );
            },
            itemCount: state.books!.length,
          );
        }
        return const SizedBox();
      },
    );
  }
}
