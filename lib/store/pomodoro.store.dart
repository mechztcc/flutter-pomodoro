import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

enum TipoIntervalo { TRABALHO, DESCANSO }

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

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.DESCANSO;

  @action
  void reiniciar() {
    iniciado = false;
    tipoIntervalo = TipoIntervalo.DESCANSO;
  }

  @action
  void iniciar() {
    iniciado = true;
    tipoIntervalo = TipoIntervalo.TRABALHO;
  }

  @action
  void parar() {
    iniciado = false;
    tipoIntervalo = TipoIntervalo.DESCANSO;
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

  bool estaTrabalhando() {
    return tipoIntervalo == TipoIntervalo.TRABALHO;
  }

  bool estaDescansando() {
    return tipoIntervalo == TipoIntervalo.DESCANSO;
  }
}
