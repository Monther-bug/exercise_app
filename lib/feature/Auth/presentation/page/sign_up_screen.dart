import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:exercise_app/core/theme/app_text_styles.dart';
import 'package:exercise_app/core/utils/form_validators.dart';
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
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final ValueNotifier<bool> obscureNotifier = ValueNotifier<bool>(true);
    return Center(
      child: SizedBox(
        width: context.isMobile ? 100.wp : 75.wp,
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  //width: 40.wp,
                  height: 60.hp,
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
                    padding:  EdgeInsets.all(1.wp),
                    child: Column(
                      children: [
                        Text(
                          'Sign Up page',
                          style: AppTextStyles.titleLarge.copyWith(
                            color: AppColors.primary
                          ),
                        ),
                        SizedBox(height: 2.hp),
                        Row(
                          children: [
                            Text(
                              'name',
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
                          validator: FormValidators.validateName,
                        ),
                        SizedBox(height: 2.hp),
                        Row(
                          children: [
                            Text(
                              'Email',
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
                          validator: FormValidators.validateEmail,
                        ),
                        SizedBox(height: 2.hp),
                        Row(
                          children: [
                            Text(
                              'Password',
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
                              validator: FormValidators.validatePassword,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              obscureText: value,
                              suffixIcon: IconButton(icon: Icon(value
                              ?Icons.visibility
                              :Icons.visibility_off,                              
                              color: AppColors.primary,
                              size: context.isMobile? 4.wp:2.wp),
                              onPressed:(){
                                obscureNotifier.value =
                                !obscureNotifier.value;
                              } ,),
                            );
                          }
                        ),
    
                        SizedBox(height: 2.hp),
                        BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if(state is AuthSuccess){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Signed up'))
                              );
                            } else if(state is AuthFailure){
                            ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error)),
                          );
                            }
                          },
                          builder: (context, state) {
                            if(state is AuthLoading){
                              return CircularProgressIndicator();
                            }
                          
                            return ElevatedButton(
                              onPressed: () {
                                if(_formKey.currentState!.validate()){
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
                                  borderRadius: BorderRadius.circular(1.wp),
                                ),
                              ),
                              child: Text(
                                'Sign Up',
                                style: AppTextStyles.titleSmall.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 2.hp),
                        Row(
                          children: [
                            Text(
                              "Already have an account? ",
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.greyText,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context.pushRoute(LoginScreenRoute());
                              },
                              child: Text(
                                'login',
                                style: AppTextStyles.bodySmall.copyWith(
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
