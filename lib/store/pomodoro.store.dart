import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int minutos = 2;

  @observable
  int segundos = 00;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  @action
  void reiniciar() {
    iniciado = false;
  }

  @action
  void iniciar() {
    iniciado = true;
  }

  @action
  void parar() {
    iniciado = false;
  }

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
  }

  @action
  void decrementarTempoTrabalho() {
    tempoTrabalho--;
  }

  @action
  void decrementarTempoDescanso() {
    tempoDescanso--;
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
  }
}
