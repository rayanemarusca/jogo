class Campeonato
  require "csv"
  require "./regras_das_jogadas.rb"
  require "./util.rb"

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
    CSV.open("Total_de_Pulos_de_Cada_Jogo.csv", "wb") do |csv|
      csv << [" Jogadas ", " Total de Pulos " , " Resultado "]

      File.open("jogadas.txt") do |arquivo|
        arquivo = arquivo.to_a
        i = 0
        while i < arquivo.length do
          partida_1 =  Util.pontuacao_partida_vetor(arquivo[i])
          partida_2 =  Util.pontuacao_partida_vetor(arquivo[i + 1])
          partida_3 =  Util.pontuacao_partida_vetor(arquivo[i + 2])

          resultado = RegrasDasJogadas.calcular_pulos_jogada(partida_1, partida_2, partida_3, arquivo[i])

          csv << [resultado[0], "#{resultado[1]} x #{resultado[2]}", resultado[3]]
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
          resultado =  RegrasDasJogadas.calcular_pontos_jogada(linha)
          csv << [linha, "#{resultado[0]} x #{resultado[1]}"]
        end
      end
    end
  end

  def ler_arquivo_jogadas

  end

end








