require './campeonato.rb'
require './jogador.rb'

  inicio = Campeonato.new
  inicio.iniciar_campeonato

  jogador_egio = Jogador.new
  jogador_egio.nome("Egio")

  jogador_jaco = Jogador.new
  jogador_jaco.nome("Jaco")

  jogador_caio = Jogador.new
  jogador_caio.nome("Caio")

  jogador_pedro = Jogador.new
  jogador_pedro.nome("Pedro")

  jogador_ana = Jogador.new
  jogador_ana.nome("Ana")

  jogador_maria = Jogador.new
  jogador_maria.nome("Maria")

  jogadores = jogador_egio, jogador_jaco, jogador_caio, jogador_pedro, jogador_ana, jogador_maria


#inicio.gerar_resultado_jogadas
inicio.gerar_classificacao



