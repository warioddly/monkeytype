part of 'typing_bloc.dart';

sealed class TypingState {
  const TypingState();
}

final class TypingInitial extends TypingState { }

final class TypingStarted extends TypingState { }

final class TypingPaused extends TypingState { }

final class TypingEnded extends TypingState { }
