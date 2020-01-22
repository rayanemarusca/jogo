class Campeonato
  require "csv"
  require "./regras_das_jogadas.rb"

  def iniciar_campeonato
    puts "Bem-vindo ao Jogo de Arremessos!!"
    qtd_jogadores = 6
    jogadas = qtd_jogadores * (qtd_jogadores - 1)
    puts "Esse campeonato terá #{qtd_jogadores} jogadores, então vão ser #{jogadas} jogadas e #{jogadas * 3} partidas."
  end

  def jogadores(qtd_jogadores)
    jogadores = []
    qtd_jogadores.times do |qtd|
      puts "Nome do jogador #{qtd + 1}: "
      jogador = Jogador.new
      nome = gets
      jogador.nome(nome.to_s)
      jogadores[qtd] = jogador
    end
    return jogadores
  end

  def gerar_classificacao
    CSV.open("Resultado_de_Cada_JOGO.csv", "wb") do |csv|
      csv << ["Jogadas", "Resultados"]

      File.open("jogadas.txt") do |arquivo|
        arquivo = arquivo.to_a

        i = 0
        while i < arquivo.length do
          partida_1 =  RegrasDasJogadas.calcular_resultado_partida(arquivo[i])
          partida_2 =  RegrasDasJogadas.calcular_resultado_partida(arquivo[i + 1])
          partida_3 =  RegrasDasJogadas.calcular_resultado_partida(arquivo[i + 2])

          pontos_jogador_em_casa1 = partida_1[0] + partida_2[0] + partida_3[0]
          pontos_jogador_fora_de_casa2 = partida_1[1] + partida_2[2] + partida_3[3]

          resultado = RegrasDasJogadas.calcular_resultado_jogo(pontos_jogador_em_casa1, pontos_jogador_fora_de_casa2, arquivo[i])

          i = i + 3
        end
      end
    end
  end

  def gerar_resultado_partidas
    CSV.open("Resultado_Partida.csv", "wb") do |csv|
      csv << ["Jogadas", "Resultados"]

      File.open("jogadas.txt") do |arquivo|
        arquivo.each do |linha|
          resultado =  RegrasDasJogadas.calcular_resultado_partida(linha)
          csv << [linha, "#{resultado[0]} x #{resultado[1]}"]
        end
      end
    end
  end

  def ler_arquivo_jogadas

  end

end








