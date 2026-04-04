import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/theme/app_text_styles.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:exercise_app/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ...existing code...
import 'package:screentasia/screentasia.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.router.replace(MyHomePageRoute(title: ''));
        }
      },
      child: Center(
        child: SizedBox(
          width: context.isMobile ? 100.wp : 75.wp,
          child: Scaffold(
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50.hp,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.wp),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(
                              255,
                              112,
                              112,
                              112,
                            ).withOpacity(0.3),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Login page',
                              style: AppTextStyles.titleLarge.copyWith(
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 2.hp),
                            Text(
                              'Email',
                              style: AppTextStyles.titleSmall.copyWith(
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 1.hp),
                            Customtextfeild(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(height: 2.hp),
                            Text(
                              'Password',
                              style: AppTextStyles.titleSmall.copyWith(
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(height: 1.hp),
                            Customtextfeild(
                              controller: passwordController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),

                            SizedBox(height: 2.hp),
                            BlocConsumer<AuthBloc, AuthState>(
                              listener: (context, state) {
                                if (state is AuthSuccess) {
                            context.router.replace(MyHomePageRoute(title: ''));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Logged in')),
                            ); // Success!
                              } else if (state is AuthFailure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.error)),
                                );
                              }
                              },
                              builder: (context, state) {
                                if (state is AuthLoading){
                                  return Center(child: CircularProgressIndicator());
                                }   
                                return ElevatedButton(
                                  onPressed: () {
                                    context.read<AuthBloc>().add(
                                      LoginSubmitted(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.green, // Background color
                                    foregroundColor: Colors
                                        .white, // Splash/text default color
                                    // minimumSize: Size(double.infinity, 50), // Responsive height placeholder
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.wp),
                                    ),
                                  ),
                                  child: Text(
                                    'Login',
                                    style: AppTextStyles.titleSmall.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),

                            SizedBox(height: 2.hp),
                            Row(
                              children: [
                                Text(
                                  "don't have an account? ",
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: const Color.fromARGB(
                                      255,
                                      186,
                                      188,
                                      186,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    context.pushRoute(SignUpScreenRoute());
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
