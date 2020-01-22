class Util

  def self.pontuacao_partida_vetor linha
    #Transformando o conteudo da linha em vetor
    linha1 = linha.gsub("   ", "x")
    linha1 = linha1.gsub(" ", "")
    v = linha1.split("x")
    return v[2].to_i, v[3].to_i
  end

  def self.simplificar_array_jogador_pontuacao array
    #Transformando o conteudo do array em uma tabela com jogador e pontuação
    i = 0
    hash = Hash.new()

    table = Array.new

    array.each do |linha|
      v = linha.split(",")
      jogadores = v[0].split("x")
      table[i] =  "#{jogadores[0].gsub("\"", "" ).to_s.downcase}"
      table[i + 1] =  v[4].to_i

      hash.select Hash[*table]

      table[i + 2] =  "#{jogadores[1].gsub("\"", "" ).to_s.downcase}"
      table[i + 3] = v[5].to_i

      i = i + 4
    end
    #  v = linha.split(",")
    #  jogadores = v[0].split("x")
    #  table1 = Array.new
    #  table2 = Array.new
    #  if hash.length > 0
    #    hash.each do |key, value|
    #      array1 = value.to_a
    #      if array[0].downcase == jogadores[0].gsub("\"", "" ).to_s.downcase
    #        table1[0] =  "#{jogadores[0].gsub("\"", "" ).to_s.downcase}"
    #        table1[1] = array1[1].to_i + v[4].to_i
    #      else
    #        table1[0] =  "#{jogadores[0].gsub("\"", "" ).to_s.downcase}"
    #        table1[1] = v[4].to_i
    #      end
    #      hash[j] = Hash[*table1]
    #      puts hash[key]
    #    end
    #
    #  else
    #    table1[0] =  "#{jogadores[0].gsub("\"", "" ).to_s.downcase}"
    #    table1[1] = v[4].to_i
    #    hash = Hash[*table1]
    #  end
    #
    #  if hash.length > 0
    #    hash.each do |key, value|
    #      array2 = value.to_a
    #      if array[0].downcase == jogadores[1].gsub("\"", "" ).to_s.downcase
    #        table2[0] =  "#{jogadores[1].gsub("\"", "" ).to_s.downcase}"
    #        table2[1] = array2.to_i + v[5].to_i
    #      else
    #        table2[0] =  "#{jogadores[1].gsub("\"", "" ).to_s.downcase}"
    #        table2[1] = v[5].to_i
    #      end
    #      arr = hash.to_a
    #      hash[i] = Hash.new(Hash[*table2])
    #    end
    #  end
    #
    #  j += 2
    #  i += 2
    #end


    return  hash
  end

end