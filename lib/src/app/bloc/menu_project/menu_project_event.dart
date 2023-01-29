part of 'menu_project_bloc.dart';

@immutable
abstract class MenuProjectEvent {}

class MenuProjectNext extends MenuProjectEvent {
  MenuProjectNext(this.index);
  final int index;
}

class MenuProjectPrev extends MenuProjectEvent {
  MenuProjectPrev(this.index);
  final int index;
}

class MenuProjectSwitch extends MenuProjectEvent {
  MenuProjectSwitch(this.index);
  final int index;
}
