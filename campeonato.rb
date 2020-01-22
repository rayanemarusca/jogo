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
    CSV.open("Resultado_Partida.csv", "wb") do |csv|
      csv << ["Jogadas", "Resultados"]

      File.open("jogadas.txt") do |arquivo|
        arquivo.each do |linha|
          puts linha
          linha1 = linha.gsub("   ", "x")
          linha1 = linha1.gsub(" ", "")
          puts linha1
          v = linha1.split("x")
          resultado =  RegrasDasJogadas.calcular_resultado_partida(v[2].to_i, v[3].to_i)
          csv << [linha, "#{resultado[0]} x #{resultado[1]}"]
        end
      end
    end
  end

  def ler_arquivo_jogadas

  end

end








