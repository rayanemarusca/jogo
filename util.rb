class Util

  def self.pontuacao_partida_vetor linha
    #Transformando o conteudo da linha em vetor
    linha1 = linha.gsub("   ", "x")
    linha1 = linha1.gsub(" ", "")
    v = linha1.split("x")
    return v[2].to_i, v[3].to_i
  end

end