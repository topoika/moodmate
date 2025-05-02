part of "./pages.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          getHomeData(context);
          Navigator.of(context).pushReplacementNamed(AppRoutes.home);
        } else if (state is AuthError) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.login);
        }
      },
      child: BlocBuilder<AuthBloc, AuthStates>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Color(0xFF7D4CDB),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logo, width: 180, height: 180),
                  const SizedBox(height: 10),
                  Text(
                    'MoodMate'.toUpperCase(),
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Your daily dose of positivity'.toUpperCase(),
                    textScaler: TextScaler.noScaling,

                    style: TextStyle(
                      color: Color(0xFFF6C90E),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: state is AuthLoading,
                    child: CupertinoActivityIndicator(
                      color: Colors.white,
                      radius: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
