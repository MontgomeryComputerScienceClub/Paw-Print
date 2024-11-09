import 'package:myapp/src/models/story.dart';
import 'package:myapp/src/models/storypreview.dart';

Map<String, dynamic> storyJson = {
  "id": 545,
  "title": "PHS Profile: Joe Bongiovi",
  "content":
      "After countless tours around the world with his bands, raking in double-digits of ensemble trophies and awards, Joe Bongiovi completes his 18th year as a band director at PHS. He is the sole conductor of the Princeton Studio Band, which frequently competes at both local and national jazz festivals, and this past December, Bongiovi took the band to Abbey Road Studios in London to record a new jazz album that will be released on June 14.\r\n“To prepare for [the recording was] harder than preparing for a [normal] competition because we recorded six pieces that had to be pristine when we got to the recording studio,” Bongiovi said.\r\nMost recently, the band won the state championship from the New Jersey Association for Jazz Education for the seventh time. However, their success didn’t come without hours of practice and rehearsals.\r\n“We prepare by playing a lot of music, not just the music that we compete on ... we keep looking for more and more difficult pieces of music,” said Bongiovi. “We just break [the music] down [slowly] and try to make it as perfect as possible, [before speeding] it back up.”\r\nIn addition to directing Studio Band, Bongiovi also co-conducts the Nassau and Tiger bands alongside PHS band director Dave Pollack. \r\n“[Co-directing is] great because ... we can divide the students that are there by instrument [and] work on separate things,” said Pollack. “So he can work with brass, I can work with woodwinds, one of us can work with rhythm section, one can work with soloists.”\r\nThough currently a music teacher, Bongiovi started his music career in high school, where he played tuba in the school’s marching band. He went on to study film scoring and composition at Berklee College of Music. While still in college, Bongiovi began helping his high school band director arrange and compose pieces for a marching band camp. Eventually, he started conducting the pieces that he wrote, which became a defining shift into his career as a teacher.\r\n“I sort of fell into teaching,” said Bongiovi. “One day, the director told me, ‘You wrote it, so get up and conduct it’ ... it was a nice way of meshing composition and teaching.”\r\nThis led him to go back to school to get his Master in Music Education from the University of the Arts. After getting his master’s, Bongiovi taught at several middle and high schools in Pennsylvania and New Jersey; it wasn’t until 2007 that Bongiovi began teaching at PHS.\r\n“I came [in the middle] of the 2006–2007 school year. They had an opening and the band director at the time, who was Dr. Downey, wanted me to come and that’s how I began teaching here,” said Bongiovi. “Being able to create new adventures and creating new opportunities for students has been keeping [my job] exciting.”\r\nIsaac Son ’27, a student in Nassau II, appreciates Bongiovi’s guidance and attitude during class.\r\n“When Mr. Bongiovi is there, he’s straightforward with what we do, which I like. He doesn’t waste that much time [and] he’s a good band director,” said Son. “[He also makes] funny jokes [which] make me laugh.”\r\nConsidering that Bongiovi has been teaching for 18 years, he often tries to incorporate new challenges and projects into his classes.\r\n“Four years ago, [at Abbey Road], we did mostly jazz covers of popular songs. This time, we brought in jazz artists to play with us,” said Bongiovi. “Creating new adventures and creating new opportunities for students has [kept teaching] exciting ... [I hope to] keep coming up with new ideas.”",
  "authors": ["Eddie Tang", "Sourish Pramanik", "Joel Pulikan"],
  "month": 6,
  "year": 2024,
  "column": "Other"
};

Map<String, dynamic> storyJson2 = {
  "id": 696,
  "title": "PHS Profile: Eddie Tang",
  "content": "Eddie is hot \r\nyipee!!",
  "authors": ["Kylie Sek"],
  "month": 6,
  "year": 2024,
  "imgUrl": "https://thespokesman.net/wp-content/uploads/2024/05/class.png",
  "column": "People"
};

Story defaultStory = Story.fromJson(storyJson);
Story defaultStory2 = Story.fromJson(storyJson2);

StoryPreview previewStory = StoryPreview.fromJson(storyJson);
StoryPreview previewStory2 = StoryPreview.fromJson(storyJson2);
