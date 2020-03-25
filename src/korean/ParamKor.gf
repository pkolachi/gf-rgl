resource ParamKor = ParamX, Hangul ** open Prelude in {

--------------------------------------------------------------------------------
-- Phonology

{- Lee & Ramsey 2000, p. 24-25:
  The difference in the way these words are written has to do with the productivity of the suffix.
  While the suffixes -um and -i can be used relatively freely to derive nouns from verbs and adjectives,
  the others cannot.
  In the mind of the speaker (and the user of the orthography), the words wus-um ‘laughter’ and noph-i ‘height’
  can be thought of as regular derivations of the verb wus- and the adjective noph-, much as are the
  predicative forms wus-uni, wus-ela, noph-ase, and noph-umyen. But words like makay ‘stopper’
  (morphologically mak+ay, but written as ma+kay) and mutem ‘grave’ are not derived productively.
  The decision to write them without showing the suffix separated was based upon the assumption that
  most people think of them as single, indivisible words. Their etymologies were thought not to be obvious.
-}

 -- Patterns and replacements defined in Hangul.gf
oper

  vowFinal : Str -> Bool = \str ->
    case str of {_ + #v => True ; _ => False} ;

--------------------------------------------------------------------------------
-- Morphophonology



--------------------------------------------------------------------------------
-- Nouns

param
  NForm =
      Bare     -- no case particle
    | Topic    -- 은 or 는
    | Subject  -- 이 or 가
    | Object   -- 을 or 를
    ;

  Phono = Vowel | Consonant ; -- Whether the word ends in vowel or consonant.

oper

  allomorph : NForm -> Str -> Str = \nf,s ->
    let finalV : Bool = vowFinal s ;
    in case nf of {
         Topic   => if_then_Str finalV "는" "은" ;
         Subject => if_then_Str finalV "가" "이" ;
         Object  => if_then_Str finalV "를" "을" ;
         Bare    => []
      } ;
--------------------------------------------------------------------------------
-- Numerals

param
  DForm = Indep | Attrib ;

  CardOrd = NOrd | NCard ;

  NumType = NoNum | IsDig | IsNum ;

  NumOrigin = SK | NK ;

oper
  isNum : {numtype : NumType} -> Bool = \nt -> case nt.numtype of {
    NoNum => False ;
    _     => True
    } ;
--------------------------------------------------------------------------------
-- Adjectives

param
  AForm =
   AAttr |
   APred VForm ;

--------------------------------------------------------------------------------
-- Prepositions

--------------------------------------------------------------------------------
-- Verbs
param
  VerbType = Active | Stative | Existential | Copula ; -- from Wikipedia https://en.wikipedia.org/wiki/Korean_verbs#Classification

  Aspect =
     Generic      -- zero morpheme
   | Habitual     -- 는
   | Prospective  -- 겠
   | Perfect      -- 었/았
   ;

  Style =
      Formal  -- 하십시오체
    | Polite  -- 해요체
    | Plain   --   해 라체
    ;

  SentenceType =
      Declarative
    | Interrogative
    | Imperative
    | Propositive ;


  -- TODO: include Aspect and SentenceType.
  -- These are all Generic and Declarative.
  VForm = VF Style Polarity ;

oper
  linVF = VF Polite Pos ;
{- Infinitive (Martin 1992, p. 251s)
  The Korean infinitive is used in the following ways:
(1) by itself at the end of a nonfinal clause to mean 'and so' or 'and then';
(2) as a connecting form used with an auxiliary verb (§7. 5) or to link two ordinary verbs in a kind of "regular compound", such as il.e na- 'get up', na o--+ na-o- 'come out', al.e tut- 'understand', … ;
(3) followed by the particle se with about the same meaning as (1), but more colloquial;
(4) followed by the particle ya with the meaning 'only if ya toy- 'only if we … will it do' = 'we have to (do it)';
…
• in such expressions as -e ya ha- and -e …
(5) followed by the particle to with the meaning 'even though • in such expressions as -e to coh­ 'be all right even if (one does)' = 'may (do), it is all right (to do)';
(6) followed by the particle la to make a command in the unquoted plain style;
(7) by itself at the end of a sentence to present a statement, question, command, or suggestion in the INTIMATE style (§11.3);
(8) followed by the particle yo at the end of a sentence to present a statement, question, command, or suggestion in the POLITE style (§11.3).
-}


--------------------------------------------------------------------------------
-- Clauses

param

  ClType = Statement | PolarQuestion | WhQuestion | Subord ;

}
