import 'package:flutter_repository/src/app/bloc/menu_fp/menu_bloc.dart';
import 'package:flutter_repository/src/app/view/page/home/home_page.dart';
import 'package:flutter_repository/src/app/view/widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../users_list/users_list_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuBloc>(
          create: (context) => MenuBloc(),
        ),
      ],
      child: const MenuPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          HomePage.prepare(),
          UserListPage.prepare(),
          // DeflasiPage.prepare(),
          // ShopListPage.prepare(),
          // PanenPage.prepare()
        ],
      ),
      bottomNavigationBar: BlocListener<MenuBloc, MenuState>(
        listener: (context, state) {
          controller.jumpToPage(state.index);
        },
        child: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.index,
              backgroundColor: whiteColor,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: xsFontSize,
              elevation: 10,
              selectedLabelStyle: textStyleW600,
              unselectedLabelStyle: textStyleW600,
              unselectedIconTheme: const IconThemeData(
                color: unselectedIconColor,
              ),
              selectedIconTheme: const IconThemeData(
                color: selectedIconColor,
              ),
              selectedItemColor: selectedTextColor,
              unselectedItemColor: unselectedTextColor,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.explore,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.people,
                    ),
                  ),
                  label: 'Users',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.signal_cellular_alt,
                    ),
                  ),
                  label: 'Deflasi',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.store,
                    ),
                  ),
                  label: 'Shop',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.account_balance_wallet,
                    ),
                  ),
                  label: 'Panen',
                ),
              ],
              onTap: (index) => context.read<MenuBloc>().add(MenuSwitch(index)),
            );
          },
        ),
      ),
    );
  }
}
