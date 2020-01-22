class RegrasDasJogadas

  def self.calcular_pulos_jogada partida_1, partida_2, partida_3, linha

    #Transformando o conteudo da linha em vetor
    linha1 = linha.gsub("   ", "x")
    linha1 = linha1.gsub(" ", "")
    v = linha1.split("x")

    #Regras do Jogo

    #Deve-se somar a quantidade de pulos das 3 jogadas, para se obter o número de pulos de pedras do jogador.
    total_pulos_jogador_em_casa1 = partida_1[0] + partida_2[0] + partida_3[0]
    total_pulos_jogador_fora_de_casa2 = partida_1[1] + partida_2[1] + partida_3[1]

    # O jogador vitorioso na partida é aquele que obtiver o maior número de pulos de pedras na partida.
    if total_pulos_jogador_em_casa1 > total_pulos_jogador_fora_de_casa2
      vitorioso =  v[0] #Vitorioso
    elsif total_pulos_jogador_fora_de_casa2 > total_pulos_jogador_em_casa1
      vitorioso =  v[1] #Vitorioso
    else
      vitorioso =  "Empate"
    end

    #Sempre que a quantidade de pulos do jogador na jogada for maior que 10, este será bonificado com 2 pulos nesta jogada.
    if total_pulos_jogador_em_casa1 > 10
      total_pulos_jogador_em_casa1 += 2
    end

    if total_pulos_jogador_fora_de_casa2 > 10
      total_pulos_jogador_fora_de_casa2 += 2
    end

    #Sempre que as 3 jogadas de um jogador tenham quantidades de pulos de pedras iguais,
    #  acrescentar-se-á 10% à quantidade total de pulos do jogador na partida, devendo o valor destes 10% ser arredondado para um número inteiro, caso o mesmo não seja inteiro.

    if partida_1[0]  == partida_2[0]  && partida_1[0] == partida_3[0]
      total_pulos_jogador_em_casa1 = (total_pulos_jogador_em_casa1 * 10 / 100 ).to_i
    end

    if partida_1[1]  == partida_2[1]  && partida_1[1] == partida_3[1]
      total_pulos_jogador_fora_de_casa2 = (total_pulos_jogador_fora_de_casa2 * 10 / 100 ).to_i
    end

    #[jogadores], [Total de pulos jogador em casa], [Total de pulos fora de casa], [jagador vencedor]
    return "#{v[0]}x#{v[1]}", total_pulos_jogador_em_casa1, total_pulos_jogador_fora_de_casa2,  vitorioso
  end

  def self.calcular_pontos_jogada(partidas, linha)
    resultado = RegrasDasJogadas.calcular_pulos_jogada(partidas[0], partidas[1], partidas[2], linha)

    #Pulos dos jogadores
    pulos_jogador_em_casa = resultado[1].to_i
    pulos_jagador_fora_de_casa = resultado[2].to_i

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
      pontos_em_casa =  3 + em_casa
      pontos_fora_de_casa = 0 + fora_de_casa
    elsif  pulos_jogador_em_casa == pulos_jagador_fora_de_casa
      #Em caso de empate, o jogador que jogar fora de casa, recebe 2 pontos.
      pontos_em_casa = 0 + em_casa
      pontos_fora_de_casa = 2 + fora_de_casa
    elsif  pulos_jogador_em_casa < pulos_jagador_fora_de_casa
      pontos_em_casa = 0 + em_casa
      pontos_fora_de_casa = 3 + fora_de_casa
    end

    #[jogadores], [Total de pulos jogador em casa], [Total de pulos fora de casa], [jagador vencedor],
    # [total_pontos_jogador_em_casa], [total_pontos_jogador_fora_de_casa]
    return resultado[0], resultado[1], resultado[2], resultado[3], pontos_em_casa, pontos_fora_de_casa
  end

  def self.calcular_classificacao array
    #total pontuação por jogador
    hash = Util.simplificar_array_jogador_pontuacao array

    #Lista de classificação em ordem de pontuação
    #O vencedor será o jogador que obtiver maior soma de pontos, em todas as partidas
    ordenacao = hash.sort_by  {|key, value| value}


    numero_vitoria = Util.contar_numero_de_vitoria_por_jogador array

    return ordenacao, numero_vitoria
  end
end