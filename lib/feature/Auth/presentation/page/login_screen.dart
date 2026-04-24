import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/utils/form_validators.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/Auth/data/models/request/login_request.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_Action_bloc/bloc/auth_action_bloc.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:exercise_app/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ...existing code...
import 'package:screentasia/screentasia.dart';

import '../../../home/bloc/favorites_bloc.dart';
import '../bloc/auth_status_bloc/bloc/auth_status_bloc.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    return BlocListener<AuthStatusBloc, AuthStatusState>(
      listener: (context, state) {
        if(state is Authenticated){
          context.router.replaceAll([DashboardPageRoute()]);
          context.read<FavoritesBloc>().add(LoadFavorites());}
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: context.isMobile ? 100.wp : 75.wp,
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
                              color: const Color(
                                0xFFB255A0,
                              ), // AppColors.accentMagenta
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              l10n.loginPowerYourAmbition,
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Main Headline
                          Text(
                            l10n.loginRecoveryHeadline,
                            style: textTheme.titleLarge?.copyWith(
                              height: 0.95,
                              fontSize: 42,
                              fontWeight: FontWeight.w900,
                              //color: const Color(0xFF1E293B), // Deep Slate
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            l10n.loginJourneySubtitle,
                            style: textTheme.bodyMedium?.copyWith(
                              color: const Color(
                                0xFF74739E,
                              ), // AppColors.mutedGrey
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
                            color: colorScheme.shadow.withOpacity(0.05),
                            blurRadius: 25,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.loginWelcomeBack,
                            style: textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              // color: const Color(0xFF1E293B),
                            ),
                          ),
                          Text(
                            l10n.loginContinueStreak,
                            style: textTheme.bodySmall?.copyWith(
                              color: const Color(0xFF74739E),
                            ),
                          ),
                          const SizedBox(height: 35),

                          // EMAIL SECTION
                          Text(
                            l10n.emailLabel.toUpperCase(),
                            style: textTheme.titleSmall?.copyWith(
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
                            validator: (value) =>
                                FormValidators.validateEmail(value, l10n),
                            controller: emailController,
                            hintText: l10n.emailHint,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // PASSWORD SECTION
                          Text(
                            l10n.passwordLabel.toUpperCase(),
                            style: textTheme.titleSmall?.copyWith(
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
                                validator: (input) =>
                                    FormValidators.validatePassword(
                                      input,
                                      l10n,
                                    ),
                                controller: passwordController,
                                hintText: l10n.passwordHintMasked,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () =>
                                      obscureNotifier.value = !value,
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
                          BlocConsumer<AuthActionBloc, AuthActionState>(
                            listener: (context, state) {
                              if (state is AuthSuccess) {
                                context.read<AuthStatusBloc>().add(AuthCheck());
                                //  context.router.replaceAll([DashboardPageRoute()]);
                                if (state.source == AuthSource.login) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(l10n.loginSuccessMessage),
                                    ),
                                  ); // Success!
                                }
                              } else if (state is AuthFailure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      localizeMessage(context, state.error),
                                    ),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is AuthActionLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState?.validate() ??
                                        false) {
                                      context.read<AuthActionBloc>().add(
                                        LoginSubmitted(
                                          request: LoginRequest(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        colorScheme.primary, // #3E65FF
                                    shape: const StadiumBorder(),
                                    elevation: 0,
                                  ),
                                  child: Text(
                                    l10n.loginStartSession,
                                    style: textTheme.titleMedium?.copyWith(
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
                                  color: colorScheme.onSurfaceVariant
                                      .withOpacity(0.2),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Text(
                                  l10n.loginOrTrackWith,
                                  style: textTheme.bodySmall?.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.primary.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: colorScheme.onSurfaceVariant
                                      .withOpacity(0.2),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 25),

                          // SINGLE GOOGLE BUTTON
                          InkWell(
                            onTap: () {
                              context.read<AuthActionBloc>().add(
                                GoogleSignInRequested(),
                              );
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
                                    l10n.continueWithGoogle,
                                    style: textTheme.titleMedium?.copyWith(
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
                              onTap: () =>
                                  context.replaceRoute(SignUpScreenRoute()),
                              child: RichText(
                                text: TextSpan(
                                  text: '${l10n.loginNewToPulse} ',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: const Color(0xFF74739E),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: l10n.loginCreateAccount,
                                      style: textTheme.titleSmall?.copyWith(
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
      ),
    );
  }
}
