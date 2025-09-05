
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:personal_finance_app/src/shared/data/app_shared_prefs.dart';
import 'package:personal_finance_app/src/shared/domain/entities/theme_enum.dart';
import 'package:personal_finance_app/src/shared/domain/model/observer.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> implements Observer<ThemeEnum> {
  static final _appSharedPref = GetIt.I.get<AppSharedPrefs>();

  AppBloc() : super(appState) {
    on<ThemeChangedEvent>(_onThemeChanged);
    _appSharedPref.themeObservable.addListener(this);
  }

  static AppState get appState => AppState(theme: _appSharedPref.getTheme());

  Future<void> _onThemeChanged(
      ThemeChangedEvent event,
      Emitter<AppState> emit,
      ) async {
    emit(state.copyWith(theme: event.newTheme));
  }

  @override
  void notify(ThemeEnum value) {
    add(ThemeChangedEvent(value));
  }

  @override
  Future<void> close() async {
    super.close();
    _appSharedPref.themeObservable.removeListener(this);
  }
}
