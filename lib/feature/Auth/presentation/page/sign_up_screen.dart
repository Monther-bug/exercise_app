


import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/utils/form_validators.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:exercise_app/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> obscureNotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    obscureNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background, // #F8F7FF
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
             width: context.isMobile ? 90.wp : 75.wp,
            child: Column(
              children: [
                // 1. BRANDING HEADER
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: 8.hp, 
                    left: 6.wp, 
                    right: 6.wp, 
                    bottom: 3.hp
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.signUpJoinTheClub,
                        style: textTheme.titleLarge?.copyWith(
                          height: 0.95,
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                         // color: const Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        l10n.signUpJourneySubtitle,
                        style: textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF74739E), // AppColors.mutedGrey
                        ),
                      ),
                    ],
                  ),
                ),
            
                // 2. SIGN UP FORM CARD
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
                      )
                    ],
                  ),
                  child: Form(
                    key: formKey,
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          context.router.replaceAll([const DashboardPageRoute()]);
                          if (state.source == AuthSource.signUp) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.signUpSuccessMessage)),
                            );
                          }
                        } else if (state is AuthFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(localizeMessage(context, state.error))), 
                          );
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel(textTheme, l10n.userName, colorScheme.primary),
                            Customtextfeild(
                               keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              controller: nameController,
                              hintText: l10n.signUpNameHint,
                              validator: (v) => FormValidators.validateName(v, l10n),
                            ),
                            
                            const SizedBox(height: 20),
                            
                            _buildLabel(textTheme, l10n.emailLabel, colorScheme.primary),
                            Customtextfeild(
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              controller: emailController,
                              hintText: l10n.signUpEmailHint,
                              
                              validator: (v) => FormValidators.validateEmail(v, l10n),
                            ),
            
                            const SizedBox(height: 20),
            
                            _buildLabel(textTheme, l10n.signUpCreatePassword, colorScheme.primary),
                            ValueListenableBuilder(
                              valueListenable: obscureNotifier,
                              builder: (context, value, child) {
                                return Customtextfeild(
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.done,
                                  controller: passwordController,
                                  obscureText: value,
                                  hintText: l10n.passwordHintMasked,
                                  validator: (v) => FormValidators.validatePassword(v, l10n),
                                  suffixIcon: IconButton(
                                    icon: Icon(value ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () => obscureNotifier.value = !value,
                                    color: colorScheme.primary,
                                  ),
                                );
                              },
                            ),
            
                            const SizedBox(height: 20),
            
                            
            
                 
            
                            // ACTION BUTTON
                            state is AuthLoading
                                ? const Center(child: CircularProgressIndicator())
                                : Container(
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient: LinearGradient(
                                        colors: [
                                          colorScheme.primary, // #3E65FF
                                          const Color(0xFFB255A0), // #B255A0 (accentMagenta)
                                        ],
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState?.validate() ?? false) {
                                          context.read<AuthBloc>().add(
                                            SignUpSubmitted(
                                              name: nameController.text,
                                              email: emailController.text,
                                              password: passwordController.text,
                                            ),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        shape: const StadiumBorder(),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            l10n.signUpStartTraining,
                                            style: textTheme.titleMedium?.copyWith(
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          const Icon(Icons.arrow_forward, color: Colors.white),
                                        ],
                                      ),
                                    ),
                                  ),
            
                            const SizedBox(height: 30),
            
                            // FOOTER
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    l10n.signUpAlreadyHavePulse,
                                    style: textTheme.bodySmall?.copyWith(color: const Color(0xFF74739E), fontSize: 13),
                                  ),
                                  TextButton(
                                    onPressed: () => context.replaceRoute(LoginScreenRoute()),
                                    child: Text(
                                      l10n.signUpLoginToAccount,
                                      style: textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: colorScheme.primary,
                                        letterSpacing: 1.1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 5.hp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(TextTheme textTheme, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        text.toUpperCase(),
        style: textTheme.titleSmall?.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: color,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}