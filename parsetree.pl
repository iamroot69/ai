sentence(Tree) --> noun_phrase(NP), verb_phrase(VP), { Tree = s(NP, VP) }.

verb_phrase(Tree) --> verb(V), noun_phrase(NP), { Tree = vp(V, NP) }.

article(the) --> [the].
article(a) --> [a].
noun(cat) --> [cat].
noun(dog) --> [dog].
noun(bird) --> [bird].
verb(chases) --> [chases].