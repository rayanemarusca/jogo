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

  def gerar_classificacao
    CSV.open("Classificação.csv", "wb") do |csv|
      csv << ["Classificação", " Jogador ", " Pontuação Total ", " Número de Vitórias"]

      array = Array.new
      File.open("jogadas.txt") do |arquivo|
        arquivo = arquivo.to_a
        i = 0
        j= 0
        while i < arquivo.length do
          partida_1 =  Util.pontuacao_partida_vetor(arquivo[i])
          partida_2 =  Util.pontuacao_partida_vetor(arquivo[i + 1])
          partida_3 =  Util.pontuacao_partida_vetor(arquivo[i + 2])

          partidas = [partida_1, partida_2, partida_3]

          resultado =  RegrasDasJogadas.calcular_pontos_jogada(partidas, arquivo[i])
          array[j] = resultado.to_s.sub("[","").sub("]","")
          i = i + 3
          j += 1
        end
        result = RegrasDasJogadas.calcular_classificacao(array)
      end
    end
  end

  def gerar_pontucao_jogadas
    CSV.open("Resultado_Pontução_de_Cada_Jogada.csv", "wb") do |csv|
      csv << ["Jogadas", " Total de Pulos ", " Resultado ", " Pontuacao "]

      File.open("jogadas.txt") do |arquivo|
        arquivo = arquivo.to_a
        i = 0
        while i < arquivo.length do
          partida_1 =  Util.pontuacao_partida_vetor(arquivo[i])
          partida_2 =  Util.pontuacao_partida_vetor(arquivo[i + 1])
          partida_3 =  Util.pontuacao_partida_vetor(arquivo[i + 2])

          partidas = [partida_1, partida_2, partida_3]

          resultado =  RegrasDasJogadas.calcular_pontos_jogada(partidas, arquivo[i])
          csv << [resultado[0], "#{resultado[1]} x #{resultado[2]}", resultado[3], "#{resultado[4]} x #{resultado[5]}"]
          i = i + 3
        end
      end
    end
  end

  def gerar_resultado_jogadas
    CSV.open("Resultado_de_cada_Jogada.csv", "wb") do |csv|
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
end








