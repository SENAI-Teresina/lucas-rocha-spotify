## COMPONENTES:

- Brendon Gabriel
- Lucas Gabriel
- Marcelino Pereira
- Marcos Ryan
- Thiago Norberto
- Vitor Emanoel
- Wylly Yan

## 1º) Class Detalhes Route
![Detalhes Route](https://github.com/SENAI-Teresina/lucas-gabriel/assets/133674756/556f32a8-768d-4beb-9b76-9cecd17d6acf)

### Importações:
- `flutter/material.dart`: Pacote fundamental para desenvolvimento Flutter.
- `artistas.dart`: Arquivo que provavelmente contém a definição da classe Artista.
- `detalhes_do_artista.dart`: Arquivo que contém a tela de detalhes do artista.

### Classe DetalhesRoute:
- Uma classe estática responsável por gerar rotas dinâmicas para o aplicativo.

### Método generateRoute:
- Recebe um `RouteSettings` que contém informações sobre a rota atual.
- Usa uma instrução switch para verificar o nome da rota atual.
  - Se a rota for `/detalhes`:
    - Verifica se os argumentos fornecidos são do tipo Artista.
    - Se forem válidos, converte os argumentos para um objeto Artista e navega para a tela `DetalhesDoArtistaScreen`.
    - Se não forem válidos, navega para a rota de erro `_erroRota()`.
  - Caso contrário:
    - Navega para a rota de erro `_erroRota()`.

## 2º ) Classes Rotas
![Classes Rotas](https://github.com/SENAI-Teresina/lucas-gabriel/assets/133674756/42bb5ecf-5d52-431e-a003-6e97d00d7441)

### Método gerarRota(RouteSettings settings):

- Este método estático é chamado sempre que uma nova rota precisa ser gerada com base nas configurações da rota (`RouteSettings`).
- Ele recebe as configurações da rota como parâmetro.
- Usa uma instrução switch para verificar o nome da rota especificado nas configurações.
  - Caso o nome da rota seja `/detalhes`, ele verifica se os argumentos passados são do tipo esperado (Artista).
  - Se os argumentos forem válidos e do tipo esperado, ele converte os argumentos para um objeto Artista e navega para a tela `DetalhesDoArtistaScreen` passando o objeto Artista.
  - Caso contrário, se os argumentos não forem válidos, ele retorna para a rota de erro.
  - Se o nome da rota não for reconhecido, ele também retorna para a rota de erro.

### Método _rotaErro():

- Este método é privado e estático, utilizado para retornar uma rota de erro padrão caso uma rota não seja encontrada.
- Retorna um `MaterialPageRoute` que exibe uma tela de erro com um `AppBar` contendo o título "Erro" e um `Center` com o texto "Rota não encontrada".

## 3º) Class. Body 
![Class. Body](https://github.com/SENAI-Teresina/lucas-gabriel/assets/133674756/556f054a-ebcb-40ed-ab76-79c21f0de5cd)
![Class. Body](https://github.com/SENAI-Teresina/lucas-gabriel/assets/133674756/9dd47986-ade7-4d40-837c-f554599908af)

### Importações de pacotes e arquivos:
- `import 'package:flutter/material.dart'`: Importa o pacote Flutter Material, que contém widgets e recursos para construir interfaces de usuário de estilo Material.
- `import '../data/artistas.dart'`, `import '../data/musica.dart'`, `import '../data/favoritos.dart'`: Importa os arquivos que contêm os dados de artistas, músicas e favoritos.
- `import '../body.dart'`, `import '../tabs/biblioteca_aba.dart'`, `import '../tabs/favoritos_tab.dart'`: Importa os arquivos que contêm os widgets para o corpo da aplicação e as abas de favoritos e biblioteca.

### Função principal (main):
- `void main()`: Função principal que inicializa o aplicativo.
- `runApp(const MyApp())`: Inicia o aplicativo com o widget MyApp.

### Classe MyApp (estado mutável):
- `class MyApp extends StatefulWidget`: Define a classe do aplicativo, que é um widget mutável.
- `State<MyApp> createState() => _MyAppState()`: Cria o estado associado ao aplicativo.

### Classe _MyAppState (estado do aplicativo):
- `_MyAppState` é uma classe que controla o estado do aplicativo.
- `bool isOpened = false;`: Variável de estado que controla se o campo de pesquisa está aberto ou fechado.
- `Widget build(BuildContext context) { ... }`: Método que constrói a interface do usuário do aplicativo.

### MaterialApp:
- `MaterialApp`: Define o aplicativo com base no Material Design.
- `debugShowCheckedModeBanner: false,`: Remove a faixa de depuração na parte superior direita do aplicativo.

### Scaffold:
- `Scaffold`: Define a estrutura básica da tela do aplicativo.
- `appBar`: Define a barra de aplicativos com o título "Spotify" e os ícones de pesquisa e configurações.
- `bottom`: Define a barra de navegação inferior com três abas: "Explorar", "Favoritos" e "Biblioteca".

### Corpo da aplicação (body):
- `body`: Define o conteúdo principal da tela, que é um `TabBarView` com três guias: "Explorar", "Favoritos" e "Biblioteca".
- `TabBarView`: Exibe o conteúdo associado a cada aba.

### Conteúdo das abas:
- `Body(artistas: artistas, musicas: musicas, favoritos: favoritos, listHeight: 400)`: Exibe o conteúdo da aba "Explorar" usando o widget `Body` e passando os dados de artistas, músicas e favoritos.
- `FavoritosTab(favoritos: favoritos)`: Exibe o conteúdo da aba "Favoritos" usando o widget `FavoritosTab` e passando os dados de favoritos.
- `BibliotecaTab(artistas: artistas, musicas: musicas, favoritos: favoritos)`: Exibe o conteúdo da aba "Biblioteca" usando o widget `BibliotecaTab` e passando os dados de artistas, músicas e favoritos.

## 4º) Main
![Main](https://github.com/SENAI-Teresina/lucas-gabriel/assets/133674756/928e36f8-1660-4f06-9606-4cb9d389a9d8)

### Importações:
- `package:flutter/material.dart`: Pacote fundamental para desenvolvimento Flutter.
- `body.dart`: Arquivo que contém o widget principal da aplicação.
- `routes.dart`: Arquivo que contém as definições de rotas da aplicação.

### Função main:
- `void main()`: Função principal que inicializa o aplicativo.
- `runApp(MyApp())`: Inicia o aplicativo com o widget `MyApp`.

### Classe MyApp:
- Uma classe que representa o aplicativo como um todo.
- `MaterialApp`: O widget raiz do aplicativo que configura o tema, o título e as rotas do aplicativo.

### Método build:
- O método `build` é responsável por construir a interface do usuário do aplicativo.
- `Scaffold`: Define a estrutura básica do aplicativo.
- `AppBar`: Define a barra de aplicativos com um título "Spotify" e ícones de pesquisa e configurações.
- `BottomNavigationBar`: Define a barra de navegação inferior com três abas: "Explorar", "Favoritos" e "Biblioteca".
- `TabBarView`: Exibe o conteúdo associado a cada aba.

### Abas:
- Cada aba (Explorar, Favoritos e Biblioteca) é representada por um widget específico que é exibido quando a aba correspondente é selecionada.

## 5º) Inicialização
![Inicialização](https://github.com/SENAI-Teresina/lucas-gabriel/assets/133674756/013740a1-eaaf-4b3b-b199-e20b6f03e8a8)

### Método initState:
- `void initState() { ... }`: É um método do ciclo de vida do widget, chamado uma vez quando o widget é inserido na árvore de widgets.
- `initState` inicializa o estado do aplicativo, incluindo a leitura dos dados de artistas, músicas e favoritos do arquivo JSON.
- `setState(() { ... })`: Atualiza o estado do aplicativo com os dados lidos dos arquivos JSON.

## 6º) Body
![Body](https://github.com/SENAI-Teresina/lucas-gabriel/assets/133674756/4008e5d3-6a65-4b6e-a219-89d62aa26c6b)

### Importações:
- `package:flutter/material.dart`: Pacote fundamental para desenvolvimento Flutter.
- `artistas.dart`: Arquivo que contém a definição da classe Artista.
- `musica.dart`: Arquivo que contém a definição da classe Musica.
- `favoritos.dart`: Arquivo que contém a definição da classe Favoritos.

### Classe Body:
- `class Body extends StatefulWidget`: Define uma classe de widget mutável chamada `Body`.
- `State<Body> createState() => _BodyState()`: Cria o estado associado ao widget `Body`.

### Classe _BodyState:
- `_BodyState` é uma classe que controla o estado do widget `Body`.
- `List<Artista> artistas;`: Lista que armazena os objetos Artista.
- `List<Musica> musicas;`: Lista que armazena os objetos Musica.
- `List<Favoritos> favoritos;`: Lista que armazena os objetos Favoritos.

### Método build:
- `Widget build(BuildContext context) { ... }`: Método responsável por construir a interface do usuário do widget `Body`.
- `ListView.builder`: Constrói uma lista de widgets com base na lista de artistas, exibindo informações como nome, imagem e popularidade do artista.
- `ListView.builder`: Constrói uma lista de widgets com base na lista de músicas, exibindo informações como nome, artista e duração da música.
- `ListView.builder`: Constrói uma lista de widgets com base na lista de favoritos, exibindo informações como nome, imagem e popularidade do artista.

## 7º) Classe Musica
![Classe Musica](https://github.com/SENAI-Teresina/lucas-gabriel/assets/133674756/0cd90535-06bb-4d4d-ae04-b0f7d2040c24)

### Importações:
- `package:flutter/material.dart`: Pacote fundamental para desenvolvimento Flutter.

### Classe Musica:
- `class Musica { ... }`: Define uma classe `Musica` com propriedades como `id`, `nome`, `artista`, `duracao` e `imagem`.
- `Musica.fromJson(Map<String, dynamic> json)`: Construtor que cria uma instância de `Musica` a partir de um mapa JSON.

## 8º) Classe Favoritos
![Classe Favoritos](https://github.com/SENAI-Teresina/lucas-gabriel/assets/133674756/4b3d3043-b8d0-4b27-a62b-6c1a89ed60f6)

### Importações:
- `package:flutter/material.dart`: Pacote fundamental para desenvolvimento Flutter.

### Classe Favoritos:
- `class Favoritos { ... }`: Define uma classe `Favoritos` com propriedades como `id`, `nome`, `artista` e `imagem`.
- `Favoritos.fromJson(Map<String, dynamic> json)`: Construtor que cria uma instância de `Favoritos` a partir de um mapa JSON.

## 9º) Classe Artista
![Classe Artista](https://github.com/SENAI-Teresina/lucas-gabriel/assets/133674756/589e71b2-d1f0-4b49-bcb1-c23e4c12a4a3)

### Importações:
- `package:flutter/material.dart`: Pacote fundamental para desenvolvimento Flutter.

### Classe Artista:
- `class Artista { ... }`: Define uma classe `Artista` com propriedades como `id`, `nome`, `imagem` e `popularidade`.
- `Artista.fromJson(Map<String, dynamic> json)`: Construtor que cria uma instância de `Artista` a partir de um mapa JSON.

## 10º) Recursos de Música
![Recursos de Música](https://github.com/SENAI-Teresina/lucas-gabriel/assets/133674756/1728579e-184c-4c14-bd3e-ee522adcb7e1)

### Importações:
- `package:flutter/material.dart`: Pacote fundamental para desenvolvimento Flutter.

### Classe RecursosDeMusica:
- `class RecursosDeMusica { ... }`: Classe que contém métodos estáticos para gerenciar a reprodução de músicas.
- `static Future<void> pausar() async { ... }`: Método estático para pausar a reprodução de uma música.
- `static Future<void> parar() async { ... }`: Método estático para parar a reprodução de uma música.
- `static Future<void> reproduzir(String url) async { ... }`: Método estático para reproduzir uma música a partir de uma URL.
