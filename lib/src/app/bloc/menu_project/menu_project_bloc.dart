import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'menu_project_event.dart';
part 'menu_project_state.dart';

class MenuProjectBloc extends Bloc<MenuProjectEvent, MenuProjectState> {
  MenuProjectBloc() : super(const MenuProjectSelected(0)) {
    on<MenuProjectNext>(
      (event, emit) => emit(MenuProjectSelected(state.index + 1)),
    );
    on<MenuProjectPrev>(
      (event, emit) => emit(MenuProjectSelected(state.index - 1)),
    );
    on<MenuProjectSwitch>(
      (event, emit) => emit(MenuProjectSelected(event.index)),
    );
  }
}
