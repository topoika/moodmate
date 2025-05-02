part of "pages.dart";

class SubmitFeedback extends StatelessWidget {
  SubmitFeedback({super.key});
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final navCubit = context.watch<NavCubit>();
    String? msg;
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: BackButtonWidget(color: Colors.black),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: hPadding),
          children: [
            const SizedBox(height: 8),
            const Text(
              'Submit Feedback',
              textScaler: TextScaler.noScaling,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'We value your feedback. Please let us know your thoughts.',
              textScaler: TextScaler.noScaling,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            CustomTextInput(
              hint: "Your Feedback",
              title: "Feedback",
              type: "feedback",
              onSaved: (val) => msg = val,
            ),
            SizedBox(height: 20),
            BlocListener<FeedbackBloc, QuoteStates>(
              listener: (context, state) {
                if (state is FeedbackSentState) {
                  makeToast(state.message, type: "success");
                  Navigator.pop(context);
                } else if (state is QuoteErrorState) {
                  makeToast(state.message, type: "error", showDialog: true);
                }
              },
              child: BlocBuilder<FeedbackBloc, QuoteStates>(
                builder: (context, state) {
                  return PrimaryButton(
                    text: "Submit".toUpperCase(),
                    loading: state is QuoteLoadingState,
                    bgColor: context.primaryColor,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        context.read<FeedbackBloc>().add(
                          SendFeedbackEvent(navCubit.state.quote!, msg!),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
