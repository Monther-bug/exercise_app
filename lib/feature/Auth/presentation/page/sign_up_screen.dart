import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/presentation/bloc/local_bloc.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:exercise_app/core/theme/app_text_styles.dart';
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
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final ValueNotifier<bool> obscureNotifier = ValueNotifier<bool>(true);
    return Center(
      child: SizedBox(
        width: context.isMobile ? 100.wp : 75.wp,
        child: Scaffold(
          appBar: AppBar(
            actions: [IconButton(
              onPressed: (){
                final currentState = context.read<LocalBloc>().state;
                final newState = currentState.locale.languageCode == 'en'
                  ? const Locale('ar')
                  : const Locale('en');
                context.read<LocalBloc>().add(ChangeLanguage(newState));
              }, 
              icon: Icon(
                Icons.language,
                size: context.isMobile? 1.5.wp: 2.wp,
                color: AppColors.primary,
              ))],
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  //width: 40.wp,
                  height:context.isMobile?100.hp:  70.hp,
                  decoration: BoxDecoration(
                    color: AppColors.neutural,
                    borderRadius: BorderRadius.circular(2.wp),
                    boxShadow: [
                      BoxShadow(
                        color:AppColors.shadow.withOpacity(0.3),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(2.wp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          l10n.signUpTitle,
                          style: AppTextStyles.titleLarge.copyWith(
                            color: AppColors.primary
                          ),
                        ),
                        SizedBox(height: 2.hp),
                        Row(
                          children: [
                            Text(
                              l10n.userName,
                              style: AppTextStyles.titleSmall.copyWith(
                                color: AppColors.primary
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.hp),
                        Customtextfeild(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: (value) => FormValidators.validateName(value, l10n),
                           hintText: l10n.userName,
                                prefixIcon: Icon(
                                  Icons.person,                                  
                                  size: context.isMobile? 1.5.wp:2.wp,
                                  color: AppColors.greyText ,
                                ),
                        ),
                        SizedBox(height: 2.hp),
                        Row(
                          children: [
                            Text(
                              l10n.emailLabel,
                              style: AppTextStyles.titleSmall.copyWith(
                                color: AppColors.primary
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.hp),
                        Customtextfeild(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) => FormValidators.validateEmail(value, l10n),
                           hintText: l10n.emailHint,
                            prefixIcon: Icon(
                              Icons.email,                              
                              size: context.isMobile? 1.5.wp:2.wp,
                              color: AppColors.greyText,
                            ),
                        ),
                        SizedBox(height: 2.hp),
                        Row(
                          children: [
                            Text(
                              l10n.passwordLabel,
                              style: AppTextStyles.titleSmall.copyWith(
                                color:AppColors.primary
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.hp),
                        ValueListenableBuilder(
                          valueListenable: obscureNotifier,
                          builder: (context, value, child) {
                            return Customtextfeild(
                              controller: passwordController,
                              validator: (input) => FormValidators.validatePassword(input, l10n),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              obscureText: value,
                              suffixIcon: IconButton(icon: Icon(value
                              ?Icons.visibility
                              :Icons.visibility_off,                              
                              color: AppColors.primary,                              
                              size: context.isMobile? 1.5.wp:2.wp,),
                              onPressed:(){
                                obscureNotifier.value =
                                !obscureNotifier.value;
                              } ,),
                               hintText: l10n.passwordLabel,
                                prefixIcon: Icon(
                                  Icons.lock,                                  
                                  size: context.isMobile? 1.5.wp:2.wp,
                                  color: AppColors.greyText ,
                                ),
                            );
                          }
                        ),
    
                        SizedBox(height: 2.hp),
                        BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if(state is AuthSuccess){
                              if(state.source == AuthSource.signUp){
                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(l10n.signUpSuccessMessage))
                              );
                              }                             
                            } else if(state is AuthFailure){
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(localizeMessage(context, state.error))),
                          );
                            }
                          },
                          builder: (context, state) {
                            if(state is AuthLoading){
                              return CircularProgressIndicator();
                            }
                          
                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if(formKey.currentState!.validate()){
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
                                  backgroundColor:
                                      AppColors.secondary,// Background color
                                  foregroundColor:
                                      AppColors.secondary, // Splash/text default color                                
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(context.isMobile? 4.wp: 2.wp),
                                  ),
                                ),
                                child: Text(
                                  l10n.signUpButton,
                                  style: AppTextStyles.titleSmall.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 2.hp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${l10n.alreadyHaveAccount} ',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.greyText,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context.pushRoute(LoginScreenRoute());
                              },
                              child: Text(
                                l10n.loginLink,
                                style: AppTextStyles.titleSmall.copyWith(
                                  color: AppColors.primary
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
    );
  }
}
