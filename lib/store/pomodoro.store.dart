import 'dart:async';

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

  Timer? cronometro;

  @action
  void reiniciar() {
    iniciado = false;
    tipoIntervalo = TipoIntervalo.DESCANSO;
    parar();
  }

  @action
  void iniciar() {
    iniciado = true;
    tipoIntervalo = TipoIntervalo.TRABALHO;
    cronometro = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (minutos == 0 && segundos == 0) {
          _trocarTipoIntervalo();
        } else if (segundos == 0) {
          segundos = 59;
          minutos--;
        } else {
          segundos--;
        }
      },
    );
  }

  @action
  void parar() {
    iniciado = false;
    tipoIntervalo = TipoIntervalo.DESCANSO;
    cronometro?.cancel();
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

  void _trocarTipoIntervalo() {
    if (estaTrabalhando()) {
      tipoIntervalo = TipoIntervalo.DESCANSO;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.TRABALHO;
      minutos = tempoTrabalho;
    }

    segundos = 0;
  }
}
