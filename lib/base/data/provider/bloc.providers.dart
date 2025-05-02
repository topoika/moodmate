part of "provider.dart";

List<SingleChildWidget> blocProvider({required BuildContext context}) => [
  BlocProvider(create: (_) => AuthBloc(repo: AuthRepo())..add(GetUserEvent())),
  BlocProvider(create: (_) => QuoteBloc(repo: QuoteRepo())),
  BlocProvider(create: (_) => QuotesBloc(repo: QuoteRepo())),
  BlocProvider(create: (_) => FeedbackBloc(repo: QuoteRepo())),

  // cubit providers
  BlocProvider(create: (_) => NavCubit()),
];
