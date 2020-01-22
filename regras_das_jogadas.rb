class RegrasDasJogadas
  def self.calcular_resultado_partida(linha)

    #Transformando o conteudo da linha em vetor
    linha1 = linha.gsub("   ", "x")
    linha1 = linha1.gsub(" ", "")
    v = linha1.split("x")

    #Pulos dos jodores
    pulos_jogador_em_casa = v[2].to_i
    pulos_jagador_fora_de_casa = v[3].to_i

    #Regras da partida

    em_casa = 0

    #O jogador que obtiver quantidade de pulos menor que 3 na partida, será punido com 1 ponto a menos.
    if pulos_jogador_em_casa < 3
      em_casa = -1
    end

    #O jogador que obtiver quantidade de pulos menor que 3 na partida, será punido com 1 ponto a menos.
    fora_de_casa = 0
    if pulos_jagador_fora_de_casa < 3
      fora_de_casa = -1
    end

    #O jogador que obtiver o maior número de pulos de pedra na partida, recebe 3 pontos
    if pulos_jogador_em_casa > pulos_jagador_fora_de_casa
      return 3 + em_casa, 0 + fora_de_casa
    elsif  pulos_jogador_em_casa == pulos_jagador_fora_de_casa
      #Em caso de empate, o jogador que jogar fora de casa, recebe 2 pontos.
      return 0 + em_casa, 2 + fora_de_casa
    elsif  pulos_jogador_em_casa < pulos_jagador_fora_de_casa
      return 0 + em_casa, 3 + fora_de_casa
    end
  end

  def self.calcular_resultado_jogo jogador_1, jogador_2, linha

    #Transformando o conteudo da linha em vetor
    linha1 = linha.gsub("   ", "x")
    linha1 = linha1.gsub(" ", "")
    v = linha1.split("x")

    #Regras do Jogo





  end

  def self.calcular_resultado_campeonato
  end
end