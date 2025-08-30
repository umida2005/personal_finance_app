import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class EditPasswordScreenBloc extends Bloc<EditPasswordScreenEvent, EditPasswordScreenState> {
  EditPasswordScreenBloc() : super(EditPasswordScreenState());
}
