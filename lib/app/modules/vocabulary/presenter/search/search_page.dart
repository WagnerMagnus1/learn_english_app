import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:learn_english/app/modules/vocabulary/domain/entities/result_context.dart';
import 'package:learn_english/app/modules/vocabulary/domain/errors/errors.dart';
import 'package:learn_english/app/modules/vocabulary/presenter/search/states/search_state.dart';
import 'search_controller.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key key, this.title = "Vocabulário"}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              onChanged: controller.setSearchText,
              decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Pesquisa"),
            ),
          ),
          Expanded(
            child: Observer(builder: (_) {
              var state = controller.state;

              if (state is ErrorState) {
                return _buildError(state.error);
              }

              if (state is StartState) {
                return Center(
                  child: Text('Digite alguma coisa...'),
                );
              } else if (state is LoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SuccessState) {
                return _buildList(state.list);
              } else {
                return Container();
              }
            }),
          )
        ],
      ),
    );
  }

  Widget _buildList(List<ResultContext> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        var item = list[index];
        return ListTile(
          title: Text(item.phrase),
          subtitle: Text(item.translate),
        );
      },
    );
  }

  Widget _buildError(FailureSearch error) {
    if (error is InvalidTextError) {
      return Center(
        child: Text('Nada encontrado'),
      );
    } else if (error is DataSourceError) {
      return Center(
        child: Text('Erro no site https://context.reverso.net/'),
      );
    } else {
      return Center(
        child: Text('Ops, ocorreu um erro :/'),
      );
      // }
    }
  }
}
