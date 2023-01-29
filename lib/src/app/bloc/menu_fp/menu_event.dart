part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent {}

class MenuSwitch extends MenuEvent {
  MenuSwitch(this.index);
  final int index;
}

class MenuNext extends MenuEvent {
  MenuNext(this.index);
  final int index;
}

class MenuPrevious extends MenuEvent {
  MenuPrevious(this.index);
  final int index;
}

class MenuSwitchReset extends MenuEvent {
  MenuSwitchReset(this.index);
  final int index;
}
