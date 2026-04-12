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
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final ValueNotifier<bool> obscureNotifier = ValueNotifier<bool>(true);
    return Center(
      child: SizedBox(
        width: context.isMobile ? 100.wp : 75.wp,
        child: Scaffold(
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Container(
                    height:context.isMobile?100.hp: 60.hp,
                    // width: 40.wp,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                            'Login page',
                            style: AppTextStyles.titleLarge.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(height: 2.hp),
                          Row(
                            children: [
                              Text(
                                'Email',
                                style: AppTextStyles.titleSmall.copyWith(
                                  color: AppColors.primary,
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
                            hintText: 'name@domain.com',
                            prefixIcon: Icon(
                              Icons.email,
                              size: context.isMobile? 4.wp:2.wp,
                              color: AppColors.greyText,
                            ),
                          ),
                          SizedBox(height: 2.hp),
                          Row(
                            children: [
                              Text(
                                'Password',
                                style: AppTextStyles.titleSmall.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.hp),
                          ValueListenableBuilder(
                            valueListenable: obscureNotifier,
                            builder: (context, value, child) {
                              return Customtextfeild(
                                obscureText: value,
                                validator: FormValidators.validatePassword,
                                controller: passwordController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                hintText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: context.isMobile? 4.wp:2.wp,
                                  color: AppColors.greyText ,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    obscureNotifier.value =
                                    !obscureNotifier.value;
                                  }, 
                                  icon: Icon(value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                    color: AppColors.primary,
                                    size: context.isMobile? 4.wp:2.wp)),
                              );
                            }
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
                              return Column(
                                children: [

                                  SizedBox(
                                    width: double.infinity ,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState?.validate()?? false) {
                                        context.read<AuthBloc>().add(
                                          LoginSubmitted(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ),
                                        );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(                                      
                                        backgroundColor:
                                            AppColors.secondary, // Background color
                                        foregroundColor: AppColors.neutural, // Splash/text default color
                                        // minimumSize: Size(double.infinity, 50), // Responsive height placeholder
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(context.isMobile? 4.wp: 2.wp),
                                        ),
                                      ),
                                      child: Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: 2.wp),
                                        child: Text(
                                          'Login',
                                          style: AppTextStyles.titleSmall.copyWith(
                                            color: AppColors.primary
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 3.hp,),
                                  Row(children: [
                                    Expanded(child: Divider(
                                      thickness:context.isMobile? 0.2.wp: 0.08.wp,
                                      color: AppColors.greyText.withOpacity(0.5),
                                    )),                                    
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 1.wp),
                                      child: Text('OR CONNECT WITH',
                                      style: AppTextStyles.titleSmall.copyWith(
                                        color : AppColors.greyText,
                                        fontSize: context.isMobile? 9: 10
                                      ),),
                                    ),
                                    Expanded(child: Divider(
                                      thickness: context.isMobile? 0.2.wp: 0.08.wp,
                                      color: AppColors.greyText.withOpacity(0.5),
                                    )),
                                  ],),
                                  SizedBox(height: 3.hp,),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(onPressed: (){
                                      context.read<AuthBloc>().add(GoogleSignInRequested());                                      
                                    },
                                    style:  ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.neutural, // Background color
                                        //foregroundColor: AppColors.neutural, // Splash/text default color                                     
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(context.isMobile? 4.wp: 2.wp),
                                        ),
                                      ),
                                    child: Text(
                                        'Google',
                                        style: AppTextStyles.titleSmall)
                                                                    ),
                                  )
                                ],
                              );
                            },
                          ),
    
                          SizedBox(height: 3.hp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "don't have an account? ",
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.greyText
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  context.pushRoute(SignUpScreenRoute());
                                },
                                child: Text(
                                  'Sign up',
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
      ),
    );
  }
}
