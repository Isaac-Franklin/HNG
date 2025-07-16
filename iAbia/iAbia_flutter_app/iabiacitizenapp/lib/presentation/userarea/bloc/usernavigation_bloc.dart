import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'usernavigation_event.dart';
part 'usernavigation_state.dart';

class UsernavigationBloc extends Bloc<UsernavigationEvent, UsernavigationState> {
  UsernavigationBloc() : super(UsernavigationInitial()) {
    on<UsernavigationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
