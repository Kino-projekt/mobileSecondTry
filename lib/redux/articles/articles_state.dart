import 'package:flutter_reduxx/models/article.dart';
import 'package:meta/meta.dart';

@immutable
class ArticlesState {
  final bool isError;
  final bool isLoading;
  final bool isSuccess;
  final List<Article> articles;

  const ArticlesState({ this.isError, this.isLoading, this.isSuccess, this.articles });

  factory ArticlesState.initial() => ArticlesState(
        isLoading: false,
        isError: false,
        isSuccess: false,
        articles: null,
      );

  ArticlesState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required bool isSuccess,
    @required List<Article> articles,
  }) {
    return ArticlesState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      articles: articles ?? this.articles,
    );
  }
}