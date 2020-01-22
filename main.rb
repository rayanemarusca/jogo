require './campeonato.rb'
require './jogador.rb'

inicio = Campeonato.new
inicio.iniciar_campeonato
inicio.gerar_resultado_jogadas
inicio.gerar_pontucao_jogadas
inicio.gerar_classificacao


