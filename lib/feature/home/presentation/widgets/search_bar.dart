import 'package:exercise_app/core/theme/app_colors.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/feature/home/presentation/bloc/search_bloc.dart';
import 'package:exercise_app/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screentasia/screentasia.dart';

class SearchBar extends StatelessWidget {
  final BuildContext? contextt;
  const SearchBar({
    this.contextt,
    super.key});
  

  @override
  Widget build(BuildContext contextt) {
    return Customtextfeild(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      prefixIcon:  Icon(
        Icons.search, 
        color: AppColors.primary,
        size: contextt.isMobile? 4.wp:2.wp),
      hintText: contextt.l10n.searchHint,
      onChanged: (value){
        contextt.read<SearchBloc>().add(SearchingEvent(value));
      },
      onFieldSubmitted: (value) => FocusScope.of(contextt).unfocus(),
      borderRadius: 1,
    );
  }
}
