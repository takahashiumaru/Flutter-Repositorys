part of 'menu_bloc.dart';

@immutable
abstract class MenuState {
  const MenuState(this.index);
  final int index;
}

class MenuSelected extends MenuState {
  const MenuSelected(super.index);
}
