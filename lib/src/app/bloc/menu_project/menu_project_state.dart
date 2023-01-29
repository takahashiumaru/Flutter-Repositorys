part of 'menu_project_bloc.dart';

@immutable
abstract class MenuProjectState {
  const MenuProjectState(this.index);
  final int index;
}

class MenuProjectSelected extends MenuProjectState {
  const MenuProjectSelected(super.index);
}
