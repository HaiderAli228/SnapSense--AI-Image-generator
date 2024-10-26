import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../view-model/api_services.dart';

part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptInitialEvent>(promptInitialEvent);
    on<PromptEnteredEvent>(promptEnteredEvent);
  }

  FutureOr<void> promptEnteredEvent(
      PromptEnteredEvent event, Emitter<PromptState> emit) async {
    emit(PromptGeneratingImageLoadState());
    Uint8List? bytes = await PromptRepo.generateImage(event.prompt);
    if (bytes != null) {
      emit(PromptGeneratingImageSuccessState(bytes));
    } else {
      emit(PromptGeneratingImageErrorState());
    }
  }

  FutureOr<void> promptInitialEvent(
      PromptInitialEvent event, Emitter<PromptState> emit) async {
    try {
      // Use rootBundle to load image as Uint8List from assets
      Uint8List bytes = await rootBundle.load('assets/file.jpg').then((data) => data.buffer.asUint8List());
      emit(PromptGeneratingImageSuccessState(bytes));
    } catch (e) {
      emit(PromptGeneratingImageErrorState()); // Error state if asset not found
    }
  }

}
