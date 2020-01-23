class Util

  def self.pontuacao_partida_vetor linha
    #Transformando o conteudo da linha em vetor
    linha1 = linha.gsub("   ", "x")
    linha1 = linha1.gsub(" ", "")
    v = linha1.split("x")
    return v[2].to_i, v[3].to_i
  end

  def self.simplificar_array_jogador_pontuacao array
    #Transformando o conteudo do array em uma hash com jogador e pontuação total do campeonato
    i = 0
    hash = {}

    table = Array.new

    array.each do |linha|
      v = linha.split(",")
      jogadores = v[0].split("x")
      table[i] =  "#{jogadores[0].gsub("\"", "" ).to_s.downcase}"
      table[i + 1] =  v[4].to_i


      if hash.length > 0
        hash.each do |key, value|
          if key == table[i]
            table[i + 1] = table[i + 1].to_i + value.to_i
          end
        end
      end
      hash = Hash[*table]

      table[i + 2] =  "#{jogadores[1].gsub("\"", "" ).to_s.downcase}"
      table[i + 3] = v[5].to_i

      if hash.length > 0
        hash.each do |key, value|
          if key == table[i + 2]
            table[i + 3] = table[i + 3].to_i + value.to_i
          end
        end
      end
      hash = Hash[*table]

      i = i + 4
    end

    return  hash
  end

  def self.contar_numero_de_vitoria_por_jogador array
    #Transformando o conteudo do array em uma hash com jogador e numero de vitorias do campeonato
    i = 0
    hash = {}

    table = Array.new

    array.each do |linha|
      v = linha.split(",")

      table[i] =  v[3]
      table[i + 1] =  1

      if hash.length > 0
        hash.each do |key, value|
          if key == table[i]
            table[i + 1] = table[i + 1].to_i + value.to_i
          end
        end
      end
      hash = Hash[*table]

      i = i + 2
    end
    return  hash
  end

  def self.transformar_numero_vitoria_em_array array
    array_resposta = array.to_s.gsub("[", "").gsub("]", "").gsub(" ", "").gsub("\\", "").gsub("\"", "")
    return array_resposta.split(",")
  end
end