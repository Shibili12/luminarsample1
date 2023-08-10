import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    home: Review(),
  ));
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Fairy tale",
              style: GoogleFonts.satisfy(
                color: Colors.green[900],
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: Image.asset("assets/images/hooliesplash.jpg")),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  """A fairy tale (alternative names include fairytale, fairy story, magic tale, or wonder tale) is a short story that belongs to the folklore genre.[1] Such stories typically feature magic, enchantments, and mythical or fanciful beings. In most cultures, there is no clear line separating myth from folk or fairy tale; all these together form the literature of preliterate societies.[2] Fairy tales may be distinguished from other folk narratives such as legends (which generally involve belief in the veracity of the events described)[3] and explicit moral tales, including beast fables. Prevalent elements include dwarfs, dragons, elves, fairies, giants, gnomes, goblins, griffins, mermaids, talking animals, trolls, unicorns, monsters, witches, wizards, and magic and enchantments.
                        
                        In less technical contexts, the term is also used to describe something blessed with unusual happiness, as in "fairy-tale ending" (a happy ending)[4] or "fairy-tale romance". Colloquially, the term "fairy tale" or "fairy story" can also mean any far-fetched story or tall tale; it is used especially of any story that not only is not true, but could not possibly be true. Legends are perceived as real within their culture; fairy tales may merge into legends, where the narrative is perceived both by teller and hearers as being grounded in historical truth. However, unlike legends and epics, fairy tales usually do not contain more than superficial references to religion and to actual places, people, and events; they take place "once upon a time" rather than in actual times.[5]
                        
                        Fairy tales occur both in oral and in literary form; the name "fairy tale" ("conte de fées" in French) was first ascribed to them by Madame d'Aulnoy in the late 17th century. Many of today's fairy tales have evolved from centuries-old stories that have appeared, with variations, in multiple cultures around the world.[6]
                        
                        The history of the fairy tale is particularly difficult to trace because only the literary forms can survive. Still, according to researchers at universities in Durham and Lisbon, such stories may date back thousands of years, some to the Bronze Age.[7][8] Fairy tales, and works derived from fairy tales, are still written today.
                        
                        The Jatakas are probably the oldest collection of such tales in literature, and the greater part of the rest are demonstrably more than a thousand years old. It is certain that much (perhaps one-fifth) of the popular literature of modern Europe is derived from those portions of this large bulk which came west with the Crusades through the medium of Arabs and Jews.[9]
                        
                        Folklorists have classified fairy tales in various ways. The Aarne-Thompson-Uther classification system and the morphological analysis of Vladimir Propp are among the most notable. Other folklorists have interpreted the tales' significance, but no school has been definitively established for the meaning of the tales.""",
                  style: GoogleFonts.nunitoSans(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
