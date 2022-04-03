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


  LibroIncierto(
   
    title: 'Descontextualizar',
    image: 'assets/libro_incierto/descontextualizacion.jpg',
    concepto:
        "El contexto en el que ocurre algo o en el que se dice determinada frase es muy importante para comprender el mensaje general. Por esta razón, cuando sacamos algo fuera de contexto lo estamos descontextualizando, de este modo, ese hecho o esa información puede dar lugar a malas interpretaciones puesto que carece de la objetividad real.",
  ),


  LibroIncierto(
   
    title: 'El viaje mitológico',
    image: 'assets/libro_incierto/viaje.jpg',
    concepto:
        "El mundo atraviesa un cambio importante en cuanto a lo que llamamos digitalización, los libros físicos son parte de este cambio  ya que se está dando grandes pasos hacia un futuro digital. Los libros electrónicos son los llamados sucesores de los tradicionales libros de papel ya que tienen infinidad de conocimientos, sin barreras y restricciones, ya que todos pueden manipular esta tecnología.",
  ),

  
   LibroIncierto(
   
    title: 'El libro electrónico',
    image: 'assets/libro_incierto/descontextualizacion.jpg',
    concepto:
        "Estos libros electrónicos no son más documentos digitalizados y cada documento depende del tipo de archivo con el cual se pudo llevar a digitalizar, dependiendo de estos tipos de archivo encontraremos ciertos conflictos puesto que no todas las plataformas son gratuitas, ni todos los equipos permiten la utilización de las aplicaciones necesarias para visualizar el documento.",
  ),


  LibroIncierto(
   
    title: 'El viaje mitológico',
    image: 'assets/libro_incierto/libro.jpg',
    concepto:
        "El mundo atraviesa un cambio importante en cuanto a lo que llamamos digitalización, los libros físicos son parte de este cambio  ya que se está dando grandes pasos hacia un futuro digital. Los libros electrónicos son los llamados sucesores de los tradicionales libros de papel ya que tienen infinidad de conocimientos, sin barreras y restricciones, ya que todos pueden manipular esta tecnología.",
  ),


  
];