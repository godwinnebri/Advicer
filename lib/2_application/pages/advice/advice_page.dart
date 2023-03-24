import 'package:adviser_app/2_application/core/services/theme_service.dart';
import 'package:adviser_app/2_application/core/widgets/custom_button.dart';
import 'package:adviser_app/2_application/pages/advice/cubit/advicer_cubit_cubit.dart';
import 'package:adviser_app/2_application/pages/advice/widgets/advice_field.dart';
import 'package:adviser_app/2_application/pages/advice/widgets/advice_loading.dart';
import 'package:adviser_app/2_application/pages/advice/widgets/error_message.dart';
import 'package:adviser_app/2_application/pages/advice/widgets/welcome_field.dart';
import 'package:adviser_app/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AdvicePageWrapperProvider extends StatelessWidget {
  const AdvicePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdvicerCubit>(),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advicer',
          style: themeData.textTheme.headline1,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: CupertinoSwitch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: ((value) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              }),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 30),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<AdvicerCubit, AdvicerCubitState>(
                builder: (context, state) {
                  return state is AdviceStateInitial
                      ? WelcomeField(themeData: themeData)
                      : state is AdviceStateLoading
                          ? AdviseLoadingWidget(themeData: themeData)
                          : state is AdviceStateLoaded
                              ? AdviceField(
                                  themeData: themeData,
                                  advice: state.advice,
                                )
                              : state is AdviceStateError
                                  ? ErrorMessage(
                                      themeData: themeData,
                                      message: state.error)
                                  : const CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              height: 160,
              child: Center(
                child: CustomButton(
                    text: 'Get Advise',
                    onPressed: () => BlocProvider.of<AdvicerCubit>(context)
                        .adviceRequested()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
