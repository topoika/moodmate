part of "pages.dart";

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: BackButtonWidget(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Create an account',
              textScaler: TextScaler.noScaling,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Register to get a motivational quote',
              textScaler: TextScaler.noScaling,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            CustomTextInput(
              hint: "Full Name",
              title: "Full Name",
              type: "name",
              value: currentUser.value.name,
              onSaved: (val) => currentUser.value.name = val,
            ),
            CustomTextInput(
              hint: "Email",
              title: "Email",
              type: "email",
              value: currentUser.value.email,
              onSaved: (val) => currentUser.value.email = val,
            ),
            PasswordField(
              hint: "Password",
              title: "Password",
              onSaved: (val) => currentUser.value.password = val,
            ),
            PasswordField(
              hint: "Confirm Password",
              title: "Confirm Password",
              onSaved: (val) => {},
            ),
            SizedBox(height: 20),
            BlocListener<AuthBloc, AuthStates>(
              listener: (context, state) {
                if (state is AuthError) {
                  makeToast(state.message, type: "error", showDialog: true);
                } else if (state is AuthSuccess) {
                  makeToast("Register successful", type: "success");
                  getHomeData(context);
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                }
              },
              child: BlocBuilder<AuthBloc, AuthStates>(
                builder: (context, state) {
                  return PrimaryButton(
                    text: "Register".toUpperCase(),
                    loading: state is AuthLoading,
                    bgColor: context.primaryColor,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<AuthBloc>().add(
                          RegisterEvent(user: currentUser.value),
                        );
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(color: Colors.black87, fontSize: 13),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  },
                  child: Text(
                    "Sign In",
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                      color: context.primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
