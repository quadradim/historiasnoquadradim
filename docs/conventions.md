# Convenções

- [Aspectos Gerais](#aspectos-gerais)
- [Nomenclatura Geral](#nomenclatura-geral)
- [Artes](#convenções-para-artefatos-visuais)
- [Glossário](#glossário)

# Aspectos Gerais

Toda nova cena apresentada no jogo "Atitude Historiadora" é composto por personagens, cenários, objetos, falas, áudio e **HUD**, sendo que parte dos artefatos podem ser temporários, portanto, para que possa ser evitado qualquer confusão é necessário que <ins>**sempre que houver um artefato definitivo então deverá ser excluido o artefato temporário**</ins>.

# Nomenclatura Geral
- Espaçamentos: Nenhum nome de arquivo deverá conter espaços, e para a separação de palavras utiliza-se "_"(underscore).
- Acentos: Nenhum nome de arquivo poderá possuir acentos.
- Letras maíuscula: Nenhum nome de arquivo deverá conter letras maíusculas.

De maneira geral, na nomeclatura de arquivos <span style="color:red">não poderão possuir</span>:
- <span style="color:maroon">Espaçamentos</span>
- <span style="color:maroon">Acentos</span>
- <span style="color:maroon">Letras Maiúsculas</span>

# Convenções para Artefatos Visuais

Os arquivos aplicados as artes os arquivos tratados podem ser personagens, cenários, objetos e HUD, portanto é necessário que exista uma estrutura de pastas. Portanto, considere que os arquivos estejam em uma dada pasta chamada `Quadradim`, assim, o aspecto estrutural será:

- <span style="color:yellow">Quadradim</span>
    - <span style="color:olive">episodios</span>
        - <span style="color:darkgoldenrod">episodio</span>
            - <span style="color:darkkhaki">localidade</span>
                - cenarios
                - <span style="color:palegoldenrod">personagens</span>
                    - <span style="color:goldenrod">nome_do_personagem</span>
                    - <span style="color:goldenrod">nome_do_personagem</span>
                    - <span style="color:goldenrod">nome_do_personagem</span>
                - <span style="color:palegoldenrod">objetos</span>
                    - <span style="color:goldenrod">nome_do_objeto</span>
                    - <span style="color:goldenrod">nome_do_objeto</span>
                    - <span style="color:goldenrod">nome_do_objeto</span>
            - <span style="color:darkkhaki">localidade</span>
            - <span style="color:darkkhaki">localidade</span>
        - <span style="color:darkgoldenrod">episodio</span>
        - <span style="color:darkgoldenrod">episodio</span>
    - <span style="color:olive">estilos</span>
        - Cores
        - Fontes
        - Interfaces

## Nomenclatura de Pastas:
- **Episodio**: O nome da pasta de um episódio será dada por `<numero_do_episodio>_<nomenclatura_do_episodio>`, exemplo:
    - `01_episodio_inicial`
    - `02_episodio_intermediario`
    - `03_um_episodio_final`
    - [...]
- **Localidade**: Cada localidade pertencerá a um determinado episódio, sendo que seu nome será `<numero_da_localidade>_<localidade>`, exemplo:
    - `01_taguatinga`
    - `02_nucleo_bandeirante`
    - [...]
- **Cenarios**: Cada cenário será denotado por `<número_do_cenário>_<cenario>.<formato>`, exemplo:
    - `01_lavadeiras.png`
    - `02_lavadeiras_alternativo.png`
    - [...]
- **Personagens**: Um personagem poderá possuir mais de uma imagem, portanto será necessário criar uma pasta para cada personagem, com o nome `<nome_do_personagem>`, exemplo:
    - `suzana`
    - `raulino`
    - [...]
- **Imagem de um Personagem**: Cada personagem poderá ter um conjunto de imagens, sendo cada imagem denotada por `<número_da_imagem_do_personagem>_<nome_do_personagem>_<característica_da_imagem>.<formato>`, exemplo:
    - `01_suzana_padrao.png`
    - `02_suzana_sorrindo.png`
    - `03_suzana_triste.png`
    - [...]
- **Objetos**: Objetos podem possuir diferentes estados, exemplo, um caderno poderia estar aberto ou fechado, considerando esta possibilidade, para cada objeto deverá haver uma pasta, chamada apenas `<objeto>`, exemplo:
    - `caderno`
    - `balde`
    - `flor`
    - [...]
- **Imagem de um Objeto**: O nome de um objeto é definido como `<número_do_objeto>_<nome_do_objeto>_<caracteristica_do_objeto>`, exemplo:
    - `01_caderno_fechado.png`
    - `02_caderno_aberto.png`
    - [...]

## Glossário
- **HUD**: A HUD é a sigla para representação dos objetos do jogo, tais como: vida, magia. Esses atributos variam de nome e de valor de acordo com o jogo.
