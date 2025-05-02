part of "pages.dart";

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(''), elevation: 0),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Welcome back',
              textScaler: TextScaler.noScaling,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Login to to get a motivational quote',
              textScaler: TextScaler.noScaling,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 15),
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
              forLogin: true,
            ),
            SizedBox(height: 20),
            BlocListener<AuthBloc, AuthStates>(
              listener: (context, state) {
                if (state is AuthError) {
                  makeToast(state.message, type: "error", showDialog: true);
                } else if (state is AuthSuccess) {
                  getHomeData(context);
                  makeToast("Login successful", type: "success");
                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                }
              },
              child: BlocBuilder<AuthBloc, AuthStates>(
                builder: (context, state) {
                  return PrimaryButton(
                    text: "Log In".toUpperCase(),
                    loading: state is AuthLoading,
                    bgColor: context.primaryColor,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        context.read<AuthBloc>().add(
                          LoginEvent(user: currentUser.value),
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
                  "Don't have an account?",
                  textScaler: TextScaler.noScaling,
                  style: TextStyle(color: Colors.black87, fontSize: 13),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.register);
                  },
                  child: Text(
                    "Sign Up",
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
