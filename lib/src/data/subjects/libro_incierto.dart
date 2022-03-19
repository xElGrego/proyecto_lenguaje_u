class LibroIncierto {
  final String title;
  final String image;
  final String concepto;
  final String? title_2;

  LibroIncierto(
 {
    required this.title,
    required this.image,
    required this.concepto,
    this.title_2,
  });
}

List<LibroIncierto> libroInciertoList = [
  LibroIncierto(

    title: 'Un futuro incierto',
    concepto:
        "El futuro del libro está sellado, aunque habrá un período de transición cuando los medios digitales tratarán de imitar lo que se hacía en el libro, igual que la fotografía trató de imitar a la pintura o las primeras obras impresas a los manuscritos. La literatura va a sobrevivir pero bajo otras formas, que para mí serán radicalmente distintas. El paso del libro a lo electrónico implica una transformación total y uno está esperando a los artistas de esos nuevos medios",
    image: 'assets/libro_incierto/raul_zurita.jpg'
  ),
  LibroIncierto(

    title: 'El parafraseo',
    concepto:
        "Parafrasear es enunciar con palabras propias lo que se expresa en un texto. Para realizar una paráfrasis se utilizan palabras y estructuras sintácticas distintas a las del escrito original, que deben transmitir una misma idea global con respecto al primer texto. Existen 3 momentos para realizarlo: La comprensión del texto. ",
    image: 'assets/libro_incierto/parafraseo.jpg'
  ),
  LibroIncierto(
   
    title: 'El texto',
    image: 'assets/libro_incierto/texto.jpg',
    concepto:
        "El texto es una manifestación lingüística, oral o escrita, con una intención comunicativa y una unidad de sentido.Cada vez que nos comunicamos mediante palabras, ya sea de forma oral o escrita, estamos creando un texto. Así pues, entendemos por texto cualquier expresión verbal: una conversación, una carta, la letra de una canción, un discurso, un libro.",
  ),

  
];