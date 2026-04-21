import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/utils/form_validators.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:exercise_app/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ...existing code...
import 'package:screentasia/screentasia.dart';

@RoutePage()
class SecondLogin extends StatefulWidget {
  const SecondLogin({super.key});

  @override
  State<SecondLogin> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SecondLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> obscureNotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    obscureNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final l10n = context.l10n;
    return Scaffold(
      // appBar: AppBar(
      //  // automaticallyImplyLeading: false,
      //   title: Text(
      //     l10n.loginTitle,
      //     style: textTheme.titleMedium?.copyWith(
      //       color: theme.colorScheme.primary,
      //     )),
      //   actions: [IconButton(
      //     onPressed: (){
      //       final currentState = context.read<LocalBloc>().state;
      //       final newState = currentState.locale.languageCode == 'en'
      //         ? const Locale('ar')
      //         : const Locale('en');
      //       context.read<LocalBloc>().add(ChangeLanguage(newState));
      //     },
      //     icon: Icon(
      //       Icons.language,
      //       size: context.isMobile? 5.wp: 2.wp,
      //       color: colorScheme.primary,
      //     ))],
      // ),
      // #F8F7FF
      //*************************************************************************** */
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: context.isMobile? 100.wp: 75.wp,
            child: Form(
               key: formKey,
              child: Column(
                children: [
                  // 1. THE BRANDING HEADER
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 8.hp,
                      left: 6.wp,
                      right: 6.wp,
                      bottom: 4.hp,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // "Power Your Ambition" Badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFB255A0), // AppColors.accentMagenta
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "POWER YOUR AMBITION",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Main Headline
                        Text(
                          "YOUR NEXT\nRECOVERY\nIS EARNED.",
                          style: TextStyle(
                            height: 0.95,
                            fontSize: 42,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF1E293B), // Deep Slate
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Access your training protocols and track every beat of your journey.",
                          style: textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF74739E), // AppColors.mutedGrey
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
              
                  // 2. THE AUTHENTICATION CARD
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3.wp),
                    padding: EdgeInsets.all(7.wp),
                    decoration: BoxDecoration(
                      color: colorScheme.surface, // #F2EFFF
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back",
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF1E293B),
                          ),
                        ),
                        Text(
                          "Continue your streak today.",
                          style: textTheme.bodySmall?.copyWith(
                            color: const Color(0xFF74739E),
                          ),
                        ),
                        const SizedBox(height: 35),
              
                        // EMAIL SECTION
                        Text(
                          "EMAIL ADDRESS",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary, // #3E65FF
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Customtextfeild(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) => FormValidators.validateEmail(value, l10n),
                          controller: emailController,
                          hintText: "runner@email.com",
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
              
                        const SizedBox(height: 24),
              
                        // PASSWORD SECTION
                        Text(
                          "PASSWORD",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ValueListenableBuilder(
                          valueListenable: obscureNotifier,
                          builder: (context, value, child) {
                            return Customtextfeild(
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              obscureText: value,
                              validator: (input) => FormValidators.validatePassword(input, l10n),
                              controller: passwordController,
                              hintText: "••••••••",
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  value ? Icons.visibility_off : Icons.visibility,
                                ),
                                onPressed: () => obscureNotifier.value = !value,
                                color: colorScheme.primary,
                              ),
                            );
                          },
                        ),
              
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: TextButton(
                        //     onPressed: () {},
                        //     child: Text(
                        //       "Forgot password?",
                        //       style: TextStyle(color: colorScheme.primary, fontWeight: FontWeight.w600)
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 12),
              
                        // PRIMARY START SESSION BUTTON
                        BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state is AuthSuccess) {
                              context.router.replaceAll([DashboardPageRoute()]);
                              if(state.source == AuthSource.login){
                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(l10n.loginSuccessMessage)),
                              ); // Success!
                              }
                            }
                             else if (state is AuthFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(localizeMessage(context, state.error))),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is AuthLoading){
                              return Center(child: CircularProgressIndicator());
                            }
                            return SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState?.validate() ?? false) {
                                    context.read<AuthBloc>().add(
                                      LoginSubmitted(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  }
                                  
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme.primary, // #3E65FF
                                  shape: const StadiumBorder(),
                                  elevation: 0,
                                ),
                                child: Text(
                                  "START SESSION",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
              
                        const SizedBox(height: 30),
              
                        // DIVIDER
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: colorScheme.onSurfaceVariant.withOpacity(0.2),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "OR TRACK WITH",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF74739E),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: colorScheme.onSurfaceVariant.withOpacity(0.2),
                              ),
                            ),
                          ],
                        ),
              
                        const SizedBox(height: 25),
              
                        // SINGLE GOOGLE BUTTON
                        InkWell(
                          onTap: () {
                            context.read<AuthBloc>().add(GoogleSignInRequested());
                          },
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFDCE7FF,
                              ), // Light blue tint for social
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Replace with a proper Google Logo SVG if available
                                const Icon(
                                  Icons.g_mobiledata,
                                  size: 40,
                                  color: Color(0xFF1E293B),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF1E293B),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
              
                        const SizedBox(height: 40),
              
                        // FOOTER LINK
                        Center(
                          child: GestureDetector(
                            onTap: () => context.replaceRoute(SignUpScreenRoute()),
                            child: RichText(
                              text: TextSpan(
                                text: "New to PULSE? ",
                                style: TextStyle(
                                  color: const Color(0xFF74739E),
                                ),
                                children: [
                                  TextSpan(
                                    text: "Create Account",
                                    style: TextStyle(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.hp),
                ],
              ),
            ),
          ),
        ),
      ),
//*************************************************************************** */
      

      //end here
    );
  }
}
