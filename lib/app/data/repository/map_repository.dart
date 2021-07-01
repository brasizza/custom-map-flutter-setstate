import 'dart:convert';

import 'package:custommarker/app/data/model/location_model.dart';

class MapRepository {
  Future<List<LocationModel>> getData() async {
    String fakeList = '''[
  {
    "place_name": "Chichen Itza",
    "lat": 20.6828519,
    "lng": -88.5687196,
    "place_picture": "https://visiteomundo.com/wp-content/uploads/2021/03/chichen-itza.jpg",
    "description": "Chichen Itza was a major focal point in the Northern Maya Lowlands from the Late Classic (c. AD 600–900) through the Terminal Classic (c. AD 800–900) and into the early portion of the Postclassic period (c. AD 900–1200). The site exhibits a multitude of architectural styles, reminiscent of styles seen in central Mexico and of the Puuc and Chenes styles of the Northern Maya lowlands. The presence of central Mexican styles was once thought to have been representative of direct migration or even conquest from central Mexico, but most contemporary interpretations view the presence of these non-Maya styles more as the result of cultural diffusion."
  },
  {
    "place_name": "Eiffel Tower",
    "lat": 48.8582602,
    "lng": 2.2944991,
    "description": "The Eiffel Tower   is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower. Locally nicknamed  'La dame de fer' (French for 'Iron Lady'), it was constructed from 1887 to 1889 as the entrance to the 1889 World's Fair and was initially criticised by some of France's leading artists and intellectuals for its design, but it has become a global cultural icon of France and one of the most recognisable structures in the world. The Eiffel Tower is the most-visited paid monument in the world; 6.91 million people ascended it in 2015."
  },
  {
    "place_name": "Soccer Stadium",
    "lat": -23.5453119,
    "lng": -46.7201583,
    "place_picture": "https://veja.abril.com.br/wp-content/uploads/2019/11/arena-corinthians-itaquerao-1-15.jpg.jpg?quality=70&strip=info&resize=680,453",
    "description": "Neo Química Arena, previously known as Arena Corinthians, is a sports stadium located in São Paulo, Brazil, owned, operated and used by Corinthians. It has a seating capacity of 49,205,making it the fifth-largest stadium used by teams in the top tier of the Brazilian League and the eleventh-largest in Brazil.It hosted six matches during the 2014 FIFA World Cup, including the opening match on 12 June 2014.Because of a requirement for it to have at least 65,000 seats for the World Cup opening match, temporary seats were added to the stadium for the tournament.The temporary seats started to be removed shortly after its last World Cup match"
  },
  {
    "place_name": "Christ the Redeemer",
    "lat": -22.946252822875977,
    "lng": -43.20282745361328,
    "description": "Christ the Redeemer is an Art Deco statue of Jesus Christ in Rio de Janeiro, Brazil, created by French sculptor Paul Landowski and built by Brazilian engineer Heitor da Silva Costa, in collaboration with French engineer Albert Caquot. Romanian sculptor Gheorghe Leonida fashioned the face. Constructed between 1922 and 1931, the statue is 30 metres (98 ft) high, excluding its 8-metre (26 ft) pedestal. The arms stretch 28 metres (92 ft) wide.The statue weighs 635 metric tons (625 long, 700 short tons), and is located at the peak of the 700-metre (2,300 ft) Corcovado mountain in the Tijuca Forest National Park"
  },
  {
    "place_name": "Statue of Liberty",
    "lat": 40.6892532,
    "lng": -74.0445482,
    "place_picture": "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Statue_of_Liberty_2007.jpg/1200px-Statue_of_Liberty_2007.jpg",
    "description": "The Statue of Liberty (Liberty Enlightening the World; French: La Liberté éclairant le monde) is a colossal neoclassical sculpture on Liberty Island in New York Harbor within New York City, in the United States. The copper statue, a gift from the people of France to the people of the United States, was designed by French sculptor Frédéric Auguste Bartholdi and its metal framework was built by Gustave Eiffel. The statue was dedicated on October 28, 1886. The statue is a figure of Libertas, a robed Roman liberty goddess. She holds a torch above her head with her right hand, and in her left hand carries a tabula ansata inscribed JULY IV MDCCLXXVI (July 4, 1776 in Roman numerals), the date of the U.S. Declaration of Independence. A broken shackle and chain lie at her feet as she walks forward, commemorating the recent national abolition of slavery. After its dedication, the statue became an icon of freedom and of the United States, seen as a symbol of welcome to immigrants arriving by sea."
  }
]''';

    List<dynamic> _fakeList = jsonDecode(fakeList);
    List<LocationModel> _list = _fakeList.map((e) => LocationModel.fromJson(e)).toList();
    return _list;
  }
}
