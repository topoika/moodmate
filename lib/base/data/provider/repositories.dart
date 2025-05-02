part of "provider.dart";

List<SingleChildWidget> repositries = [
  RepositoryProvider(create: (_) => AuthRepo()),
  RepositoryProvider(create: (_) => QuoteRepo()),
];
