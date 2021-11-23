import 'package:rxdart/subjects.dart';

class boolBloc {
  BehaviorSubject<bool> bloc = BehaviorSubject<bool>();
  Stream<bool> get Stream$ => bloc.stream;
  bool get value => bloc.value;

  SetValue(bool val) => bloc.add(val);
}

class intBloc {
  BehaviorSubject<int> bloc = BehaviorSubject<int>();
  Stream<int> get Stream$ => bloc.stream;
  int get value => bloc.value;

  SetValue(int val) => bloc.add(val);
}
