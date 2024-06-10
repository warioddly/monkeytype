part of 'typing_bloc.dart';

sealed class TypingEvent {
  const TypingEvent();
}

final class TypingStart extends TypingEvent { }

final class TypingPause extends TypingEvent { }

final class TypingEnd extends TypingEvent { }
