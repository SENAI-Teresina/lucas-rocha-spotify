// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class Artista {
  final String nome;
  final String imagemUrl;
  final bool ultimoVisto;
  final String descricao;
  final String curiosidade;

  Artista({
    required this.nome,
    required this.imagemUrl,
    this.ultimoVisto = false,
    required this.descricao,
    required this.curiosidade,
  });
}

List<Artista> artistas = [
  Artista(
    nome: "Felipe Amorim",
    imagemUrl: "assets/images/Felipe Amourim.jpeg",
    descricao: "Felipe Amorim é um aclamado escritor brasileiro conhecido por suas narrativas envolventes que misturam realismo e fantasia.\n\n"
        "Sua prosa poética e sensível explora as complexidades das relações humanas, deixando uma marca duradoura nos leitores.",
    curiosidade: "Multifacetado: Além de escritor, Amorim é um talentoso músico, tocando vários instrumentos desde a adolescência;\n\n"
        "Inspirado pela Natureza: Ele encontra inspiração na natureza, sendo um ávido observador da vida selvagem.\n\n"
        "Viajante Incansável: Suas viagens pelo mundo alimentam sua criatividade, explorando destinos exóticos ao redor do globo.\n\n"
        "Defensor da Literatura Nacional: Amorim apoia jovens escritores e promove a literatura brasileira.\n\n"
        "Filantropia: Ele se envolve em causas sociais e ambientais, contribuindo para projetos de conservação e educação em comunidades carentes.",
  ),
  Artista(
    nome: "João Gomes",
    imagemUrl: "assets/images/João Gomes.jpg",
    ultimoVisto: true,
    descricao: "João Gomes é um cantor e compositor brasileiro que ganhou destaque no cenário musical com seu estilo único que mescla elementos do sertanejo e do arrocha.\n\n"
        "Sua voz marcante e suas letras envolventes conquistaram um grande público, tornando-o uma das principais revelações da música nacional.",
    curiosidade: "Ascensão Meteórica: João Gomes alcançou o sucesso de forma rápida e impressionante, conquistando milhões de visualizações em suas músicas em um curto espaço de tempo.\n\n"
        "Carisma nas Redes Sociais: Ele é conhecido por sua presença carismática nas redes sociais, interagindo constantemente com seus fãs e compartilhando momentos de sua vida pessoal e profissional.\n\n"
        "Letras Autênticas: Suas letras falam sobre temas como amor, superação e fé, tocando o coração de seus admiradores com sua sinceridade e autenticidade.",
  ),
  Artista(
  nome: "Tarcisio do Acordeon",
  imagemUrl: "assets/images/Tarcisio do Acordeon.jpg",
  descricao: "Tarcisio do Acordeon é um talentoso músico brasileiro que se destacou no cenário do forró contemporâneo.\n\n"
    "Com sua habilidade excepcional no acordeon e sua voz marcante, ele conquistou uma legião de fãs por todo o país.",
  curiosidade: "Virtuosismo Musical: Tarcisio é reconhecido por sua habilidade técnica no acordeon, impressionando o público com sua destreza e expressividade.\n\n"
    "Sucesso nas Redes Sociais: Ele utiliza ativamente as redes sociais para se conectar com seus fãs, compartilhando performances ao vivo e bastidores de sua vida artística.\n\n"
    "Versatilidade Musical: Além do forró, Tarcisio experimenta outros estilos musicais, demonstrando sua versatilidade e amplitude artística.",
),
Artista(
  nome: "Zé Vaqueiro",
  imagemUrl: "assets/images/Zé Vaqueiro.jpg",
  descricao: "Zé Vaqueiro é um cantor e compositor brasileiro conhecido por sua contribuição ao cenário do forró e do sertanejo.\n\n"
    "Sua voz única e suas letras cativantes conquistaram o coração do público, tornando-o uma figura proeminente na música nordestina contemporânea.",
  curiosidade: "Origens Humildes: Zé Vaqueiro nasceu em uma família simples do interior do Nordeste, e sua jornada até o sucesso é inspiradora para muitos de seus fãs, refletindo sua autenticidade e determinação.\n\n"
    "Hitmaker: Ele é reconhecido por produzir sucessos que se tornam verdadeiros fenômenos nas paradas musicais, consolidando sua posição como um dos principais artistas do gênero.\n\n"
    "Carisma e Simpatia: Zé Vaqueiro é conhecido por sua personalidade carismática e sua proximidade com os fãs, cultivando uma relação de proximidade e reciprocidade por meio das redes sociais e apresentações ao vivo.",
),
Artista(
  nome: "Evoney Fernandes",
  imagemUrl: "assets/images/Evoney Fernandes.jpg",
  descricao: "Evoney Fernandes é um cantor e compositor brasileiro que se destaca no cenário do forró e do sertanejo.\n\n"
    "Sua voz marcante e suas melodias envolventes conquistaram admiradores em todo o país, garantindo-lhe um lugar de destaque na música nordestina contemporânea.",
  curiosidade: "Versatilidade Artística: Evoney é conhecido por sua versatilidade, explorando uma variedade de estilos musicais que vão desde o forró tradicional até o sertanejo universitário, demonstrando sua amplitude artística e sua capacidade de se reinventar.\n\n"
    "Colaborações de Sucesso: Ele já colaborou com diversos artistas renomados, enriquecendo o cenário musical brasileiro com sua contribuição e criatividade.\n\n"
    "Paixão Pela Performance: Evoney é um artista apaixonado pelo palco, entregando performances energéticas e emocionantes que encantam o público e o deixam ansioso por mais.",
),
Artista(
  nome: "Jonas Esticado",
  imagemUrl: "assets/images/Jonas Esticado.jpg",
  descricao: "Jonas Esticado é um cantor e compositor brasileiro que se destacou no cenário do forró contemporâneo.\n\n"
    "Com sua voz marcante e suas músicas animadas, ele conquistou uma legião de fãs por todo o país, consolidando-se como uma das principais figuras do gênero.",
  curiosidade: "Juventude Talentosa: Jonas começou sua carreira musical ainda jovem e rapidamente chamou a atenção do público e da indústria com seu talento e carisma.\n\n"
    "Shows Memoráveis: Ele é conhecido por suas apresentações ao vivo cheias de energia e carisma, que atraem multidões e deixam uma marca duradoura em seus fãs.\n\n"
    "Hitmaker Consistente: Jonas Esticado possui um histórico impressionante de sucessos nas paradas musicais, consolidando sua posição como um dos principais hitmakers do forró atual.",
),
Artista(
  nome: "Mari Fernandes",
  imagemUrl: "assets/images/Mari Fernandes.jpg",
  descricao: "Mari Fernandes é uma cantora e compositora brasileira que ganhou destaque no cenário da música sertaneja.\n\n"
    "Com sua voz doce e suas letras sinceras, ela conquistou o coração do público, tornando-se uma das principais revelações femininas do gênero.",
  curiosidade: "Empoderamento Feminino: Mari Fernandes é uma voz forte em defesa do empoderamento feminino, utilizando sua música para transmitir mensagens de autoconfiança e independência para suas fãs.\n\n"
    "Estilo Único: Ela é conhecida por seu estilo autêntico e original, que combina elementos do sertanejo tradicional com influências contemporâneas, criando uma sonoridade única e cativante.\n\n"
    "Sucesso nas Redes Sociais: Mari é muito ativa nas redes sociais, onde compartilha momentos de sua vida pessoal e profissional, além de interagir com seus fãs de maneira próxima e autêntica.",
),
Artista(
  nome: "Pablo",
  imagemUrl: "assets/images/Pablo.jpg",
  descricao: "Pablo é um cantor e compositor brasileiro conhecido por suas músicas românticas e emocionantes, que conquistaram o coração do público do nordeste brasileiro.\n\n"
    "Com sua voz marcante e suas letras apaixonadas, ele se tornou uma das principais figuras do estilo conhecido como 'arrocha', cativando fãs em todo o país.",
  curiosidade: "Origens Humildes: Pablo tem uma história de vida inspiradora, tendo superado muitos desafios para alcançar o sucesso na indústria da música. Sua jornada de superação ressoa com muitos de seus fãs, tornando-o uma figura querida e admirada.\n\n"
    "Sucesso Nacional: Embora tenha alcançado inicialmente o sucesso na região nordeste do Brasil, Pablo conquistou uma base de fãs em todo o país, consolidando-se como um dos principais representantes do arrocha a nível nacional.\n\n"
    "Canções Marcantes: Suas músicas são conhecidas por suas melodias envolventes e letras emocionantes, que falam sobre amor, saudade e superação, tocando o coração de seus ouvintes.",
),
Artista(
  nome: "Henry Freitas",
  imagemUrl: "assets/images/Henry Freitas.jpg",
  descricao: "Henry Freitas é um cantor e compositor brasileiro que se destaca no cenário do forró e do sertanejo.\n\n"
    "Com sua voz marcante e seu carisma no palco, ele conquistou uma legião de fãs por todo o país, tornando-se uma das principais vozes masculinas do gênero.",
  curiosidade: "Talento Desde Jovem: Henry mostrou talento para a música desde jovem, e sua paixão o levou a se dedicar à carreira artística, conquistando o reconhecimento do público e da crítica.\n\n"
    "Carreira Versátil: Ele é conhecido por sua versatilidade musical, explorando uma variedade de estilos que vão desde o forró tradicional até o sertanejo universitário, demonstrando sua amplitude artística e sua capacidade de se adaptar às tendências contemporâneas.\n\n"
    "Presença Cativante: Henry Freitas é um artista carismático e carismático, que conquista o público com sua presença de palco envolvente e suas performances emocionantes.",
),
Artista(
  nome: "zezo",
  imagemUrl: "assets/images/zezo.jpg",
  descricao: "Zezo é um cantor e compositor brasileiro que se destacou no cenário do forró romântico.\n\n"
    "Com sua voz inconfundível e suas músicas apaixonadas, ele conquistou uma legião de fãs por todo o país, tornando-se uma das principais referências do gênero.",
  curiosidade: "Longevidade na Carreira: Zezo tem uma carreira sólida e duradoura, tendo conquistado sucesso e reconhecimento ao longo de décadas de trabalho árduo na indústria da música.\n\n"
    "Hitmaker Consagrado: Ele é conhecido por produzir uma série de sucessos que se tornaram verdadeiros clássicos do forró romântico, embalando gerações com suas melodias emocionantes.\n\n"
    "Carisma e Simpatia: Zezo é admirado não apenas por sua música, mas também por sua personalidade cativante e sua proximidade com os fãs, cultivando uma relação de carinho e respeito ao longo de sua carreira.",
),
Artista(
  nome: "Nadson o Ferinha",
  imagemUrl: "assets/images/Nadson.jpg",
  descricao: "Nadson o Ferinha é um cantor e compositor brasileiro que ganhou destaque no cenário do forró e do sertanejo.\n\n"
    "Com sua voz única e suas músicas animadas, ele conquistou uma legião de fãs por todo o país, consolidando-se como uma das principais revelações do gênero.",
  curiosidade: "Juventude Talentosa: Nadson começou sua carreira musical ainda jovem e rapidamente chamou a atenção do público e da indústria com seu talento e carisma.\n\n"
    "Ascensão Meteórica: Ele alcançou o sucesso de forma rápida e impressionante, conquistando milhões de visualizações em suas músicas e se tornando uma das vozes mais promissoras do forró contemporâneo.\n\n"
    "Carisma nas Redes Sociais: Nadson é muito ativo nas redes sociais, onde compartilha momentos de sua vida pessoal e profissional, interagindo com seus fãs de maneira próxima e autêntica.",
),
Artista(
  nome: "Japãozin",
  imagemUrl: "assets/images/Japãozin.jpg",
  descricao: "Japãozin é um cantor e compositor brasileiro conhecido por sua contribuição ao cenário do funk carioca.\n\n"
    "Com seu estilo irreverente e suas batidas contagiantes, ele conquistou uma legião de fãs por todo o país, tornando-se uma das principais figuras do gênero.",
  curiosidade: "Origens no Morro: Japãozin vem de uma comunidade no Rio de Janeiro e sua música muitas vezes reflete suas experiências e vivências na favela, trazendo autenticidade à sua arte.\n\n"
    "Ritmo Cativante: Suas músicas são marcadas por ritmos dançantes e letras que abordam temas do cotidiano, conectando-se com o público jovem e tornando-se trilha sonora de festas e bailes por todo o Brasil.\n\n"
    "Presença Carismática: Japãozin é conhecido por sua presença de palco carismática e sua habilidade em animar multidões, transformando qualquer evento em uma verdadeira celebração.",
),
Artista(
  nome: "Flaguim moral",
  imagemUrl: "assets/images/Flaguim moral.jpg",
  descricao: "Flaguim Moral é um cantor e compositor brasileiro que se destaca no cenário do brega funk.\n\n"
    "Com seu estilo autêntico e suas letras envolventes, ele conquistou uma legião de fãs por todo o país, tornando-se uma das vozes mais representativas do gênero.",
  curiosidade: "Inovação Musical: Flaguim Moral é conhecido por sua capacidade de inovar no cenário do brega funk, mesclando elementos do estilo com outros gêneros musicais e criando uma sonoridade única e cativante.\n\n"
    "Letras Controversas: Suas músicas muitas vezes abordam temas polêmicos e controversos, gerando debates e discussões, mas também conquistando admiradores pela sua autenticidade e ousadia.\n\n"
    "Popularidade nas Redes Sociais: Ele é muito ativo nas redes sociais, onde compartilha suas músicas, bastidores de sua vida artística e interage com seus fãs, cultivando uma base de seguidores fiéis e engajados.",
),
Artista(
  nome: "Allanzinho",
  imagemUrl: "assets/images/Allanzinho.jpg",
  descricao: "Allanzinho é um cantor e compositor brasileiro que ganhou destaque no cenário do brega funk.\n\n"
    "Com sua voz marcante e suas músicas envolventes, ele conquistou uma legião de fãs por todo o país, tornando-se uma das principais revelações do gênero.",
  curiosidade: "Talento Emergente: Allanzinho despontou no cenário musical brasileiro com sua habilidade vocal e sua capacidade de criar hits contagiantes, conquistando um espaço de destaque no competitivo mundo da música.\n\n"
    "Sucesso nas Plataformas Digitais: Suas músicas alcançaram milhões de visualizações nas plataformas de streaming e redes sociais, consolidando sua posição como uma das vozes mais promissoras do brega funk.\n\n"
    "Energia Contagiante: Allanzinho é conhecido por suas performances ao vivo cheias de energia e carisma, que cativam o público e o deixam ansioso por mais."
),
Artista(
  nome: 'Charlie Brown Jr.',
  imagemUrl: "assets/images/CharlieBrown.jpg",
  descricao: "É mt bom cara",
  curiosidade: "Um artista legal"
)

];
