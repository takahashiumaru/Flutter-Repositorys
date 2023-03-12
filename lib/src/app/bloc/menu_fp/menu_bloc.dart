// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(const MenuSelected(0)) {
    on<MenuNext>((event, emit) => emit(MenuSelected(state.index + 1)));
    on<MenuPrevious>((event, emit) => emit(MenuSelected(state.index - 1)));
    on<MenuSwitch>((event, emit) => emit(MenuSelected(event.index)));
    on<MenuSwitchReset>((event, emit) => emit(MenuSelected(event.index)));
  }
}
