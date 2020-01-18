class Campeonato

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

  end

  def ler_arquivo_jogadas
    File.open("jogadas.txt") do |arquivo|
      arquivo.each do |linha|
        puts linha
          linha1 = linha.gsub("   ", "x")
          linha1 = linha1.gsub(" ", "")
        puts linha1
          v = linha1.split("x")
        puts RegrasDasJogadas.calcular_resultado_partida(v[2], v[3])
      end
    end
  end

end

class RegrasDasJogadas

  def self.calcular_resultado_partida(pulos_jogador_em_casa, pulos_jagador_fora_de_casa)
    em_casa = 0
    if pulos_jogador_em_casa < 3
      em_casa = -1
    end

    fora_de_casa = 0
    if pulos_jagador_fora_de_casa < 3
      fora_de_casa = -1
    end

    if pulos_jogador_em_casa > pulos_jagador_fora_de_casa
      return 3 + em_casa, 0 + fora_de_casa
    elsif  pulos_jogador_em_casa = pulos_jagador_fora_de_casa
      return 0 + em_casa, 2 + fora_de_casa
    elsif  pulos_jogador_em_casa < pulos_jagador_fora_de_casa
      return 0 + em_casa, 0 + fora_de_casa
    end
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

inicio.ler_arquivo_jogadas






