# jogo-de-arremesso

- rvm install ruby-2.5.5
- gem install bundle
- bundle install

#Regras

Problema proposto

Jogo de arremessos de pedras na água:

Cada jogador realiza duas partidas com cada um dos demais jogadores. Sempre uma partida em sua fazenda(em casa) e outra na fazenda do adversário (fora de casa). Cada partida tem 3 jogadas, onde cada jogador recebe 3 pedras, uma para cada jogada.

Regras da partida:
- O jogador vitorioso na partida é aquele que obtiver o maior número de pulos de pedras na partida.
- Deve-se somar a quantidade de pulos das 3 jogadas, para se obter o número de pulos de pedras do jogador.
- Sempre que a quantidade de pulos do jogador na jogada for maior que 10, este será bonificado com 2 pulos nesta jogada.
- Sempre que as 3 jogadas de um jogador tenham quantidades de pulos de pedras iguais,
  acrescentar-se-á 10% à quantidade total de pulos do jogador na partida, devendo o valor destes 10% ser arredondado para um número inteiro, caso o mesmo não seja inteiro.
- Uma partida é identificada usando-se os nomes dos jogadores, como exemplo jogadorA x jogadorB, onde a ordem dos nomes indica quem joga em casa, e quem joga fora de casa. Nesse caso, o jogadorA está jogando  em casa, e o jogadorB fora de casa.
  
Regras para pontuação da partida:
- O jogador que obtiver o maior número de pulos de pedra na partida, recebe 3 pontos.
- Em caso de empate, o jogador que jogar fora de casa, recebe 2 pontos.
- O jogador que obtiver quantidade de pulos menor que 3 na partida, será punido com 1 ponto a menos.

Critérios de desempate na classificação geral:
- O vencedor será o jogador que obtiver maior soma de pontos, em todas as partidas
- Havendo empate de pontos, o primeiro critério de desempate, será o maior número de vitórias do jogador; o segundo critério é o maior número de vitórias fora de casa, depois, a maior quantidade pulos de bonificação, e depois o menor número de pontos de punição. 
Solução para o problema proposto:

Utilizando-se da linguagem de programação Ruby, gerar um arquivo de resposta, no formato csv, que contenha a classificação geral do campeonato a partir do arquivo jogadas.txt, que contém as informações de todas as jogadas do campeonato. O arquivo de resposta deve conter a classificação por jogador, bem como a pontuação obtida.
