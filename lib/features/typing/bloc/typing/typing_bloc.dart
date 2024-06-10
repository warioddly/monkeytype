import 'package:flutter_bloc/flutter_bloc.dart';

part 'typing_event.dart';
part 'typing_state.dart';

class TypingBloc extends Bloc<TypingEvent, TypingState> {
  TypingBloc() : super(TypingInitial()) {
    on<TypingStart>((event, emit) => emit(TypingStarted()));
    on<TypingPause>((event, emit) => emit(TypingPaused()));
    on<TypingEnd>((event, emit) => emit(TypingEnded()));
  }
}
