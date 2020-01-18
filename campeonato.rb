class Campeonato

  def iniciar_campeonato
    puts "Bem-vindo ao Jogo de Arremessos!!"
    puts "Defina a quantidade de jogadores: "
    qtd_jogadores = gets.to_i
    jogadas = qtd_jogadores * (qtd_jogadores - 1)
    puts "Esse campeonato terá #{qtd_jogadores}, então vão ser #{jogadas} jogadas e #{jogadas * 3} partidas."

     puts jogadores.as_json
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

  end
end

class Jogador

  def nom
    @nome
  end

  def nome(nome)
    @nome = nome
  end

  def pontos
    @pontos
  end

  def pontos(pontos)
    @pontos = pontos
  end
end

inicio = Campeonato.new
inicio.iniciar_campeonato





