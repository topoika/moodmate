part of "pages.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final navCubit = context.watch<NavCubit>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.homebg, fit: BoxFit.cover),
          ),
          BlocBuilder<QuoteBloc, QuoteStates>(
            builder: (context, state) {
              Quote quote = state is QuoteLoadedState ? state.quote : Quote();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: hPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 95),
                    Row(
                      children: [
                        Text(
                          'Hello, ${currentUser.value.name}',
                          textScaler: TextScaler.noScaling,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        // logout button
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<AuthBloc>().add(LogoutEvent());
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.login,
                              (route) => false,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: context.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'How are you feeling today?',
                      textScaler: TextScaler.noScaling,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomDropDownWidget(
                      hint: "Select your mood",
                      type: "mood",
                      value: navCubit.state.mood,
                      onchanged: (mood) {
                        navCubit.setMood(mood);
                        context.read<QuoteBloc>().add(GetQuoteEvent(mood));
                      },
                      items: [
                        "Happy",
                        "Sad",
                        "Angry",
                        "Excited",
                        "Bored",
                        "Anxious",
                        "Relaxed",
                        "Confident",
                        "Motivated",
                        "Grateful",
                        "Hopeful",
                        "Inspired",
                        "Curious",
                        "Content",
                        "Nostalgic",
                        "Proud",
                        "Surprised",
                        "Disappointed",
                        "Frustrated",
                        "Overwhelmed",
                        "Lonely",
                      ],
                      onSaved: (val) {},
                    ),
                    SizedBox(height: 30),
                    Visibility(
                      visible: state is QuoteLoadedState,
                      replacement: Center(
                        child: Column(
                          children: <Widget>[
                            LoadingContainer(height: 100, width: 100),
                            const SizedBox(height: 30),
                            LoadingContainer(height: 50, width: 400),
                            const SizedBox(height: 10),
                            LoadingContainer(height: 50, width: 150),
                            SizedBox(height: 20),
                            LoadingContainer(height: 50, width: 50),
                            SizedBox(height: 50),
                            LoadingContainer(height: 55, width: context.width),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 35,
                          horizontal: 15,
                        ),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                AppIcons.quote,
                                height: 80,
                                width: 80,
                                color: context.primaryColor,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                quote.quote ?? "Quote not available",
                                textScaler: TextScaler.noScaling,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: context.primaryColor,
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  context.read<QuoteBloc>().add(
                                    GetQuoteEvent(
                                      navCubit.state.mood ?? "random",
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: context.primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Visibility(
                      visible: state is QuoteLoadedState,
                      replacement: const SizedBox(),
                      child: PrimaryButton(
                        text: "Send Feedback".toUpperCase(),
                        bgColor: context.primaryColor,
                        onPressed: () {
                          navCubit.setQuote(quote);
                          Navigator.pushNamed(context, AppRoutes.feedback);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

void getHomeData(BuildContext context) {
  context.read<QuoteBloc>().add(GetQuoteEvent("random"));
  context.read<QuotesBloc>().add(GetUserQuotesEvent());
}
