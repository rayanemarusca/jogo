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
    elsif  pulos_jogador_em_casa == pulos_jagador_fora_de_casa
      return 0 + em_casa, 2 + fora_de_casa
    elsif  pulos_jogador_em_casa < pulos_jagador_fora_de_casa
      return 0 + em_casa, 3 + fora_de_casa
    end
  end

  def self.calcular_resultado_jogo
  end

  def self.calcular_resultado_campeonato
  end

end