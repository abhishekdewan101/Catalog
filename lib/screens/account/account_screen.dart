import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_palace/providers/view_model_providers.dart';
import 'package:mind_palace/screens/account/account_view_model.dart';
import 'package:mind_palace/utils/navigation/routes.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    AccountViewModel viewModel = ref.read(accountViewModelProvider);
    return StreamBuilder(
      stream: viewModel.getViewState(),
      builder: (context, snapshot) {
        if (snapshot.data != null &&
            snapshot.data == AccountViewState.signOutSuccessful) {
          Future.microtask(() => context.goNamed(Routes.base));
        }
        //TODO: Figure out what to do when signout fails.
        return Center(
          child: SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onBackground.withAlpha(75),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          viewModel.logoutUser();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: theme.colorScheme.onBackground,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
