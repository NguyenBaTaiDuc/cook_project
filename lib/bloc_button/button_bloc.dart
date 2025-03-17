import 'package:cook_project/bloc_button/button_event.dart';
import 'package:cook_project/bloc_button/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonState(isPressed: false)) {
    on<PressedButtonEvent>((event, emit) {
      emit(ButtonState(isPressed: !state.isPressed));
    });
  }
}
