concrete CatAra of Cat = CommonX - [Utt]  ** open ResAra, Prelude, ParamX in {

  flags optimize=all_subs ;

  lincat

-- Phrase

    Utt = {s : Gender => Str};

-- Tensed/Untensed

    SSlash,
    S  = {s : Order => Str} ; -- subordinate clause has nominal word order and subject in acc
    QS = {s : QForm => Str} ;
    RS = {s : Agr => Case => Str} ; -- case because the relative pronoun inflects in case

-- Sentence

    Cl = ResAra.Cl ; -- {s : Tense => Polarity => Order => Str} ;
    ClSlash = ResAra.ClSlash ;
    Imp = {s : Polarity => Gender => ResAra.Number => Str} ;

-- Question

    QCl = ResAra.QCl ; -- {s : Tense => Polarity => QForm => Str} ;
    IDet = ResAra.IDet ; -- {s : Gender => State => Case => Str ; n : Number} ;
    IP   = ResAra.IP ;   -- {s : (isPred : Bool) => State => Case => Str ; n : Number} ;
    IComp = ResAra.IComp ; -- 
    IQuant = {s : State => Case => Str} ;

-- Relative

    RCl = ResAra.RCl ;
    RP = ResAra.RP ;

-- Verb

    VP = ResAra.VP ;
    VPSlash = ResAra.VPSlash ; -- VP ** {c2:Preposition}
    Comp = ResAra.Comp ** {obj : Obj ; isNP : Bool} ;
--    SC = {s : Str} ;
--
-- Adjective

    AP = ResAra.AP ;

-- Noun

    CN = ResAra.CN;
    NP, Pron = ResAra.NP; --{s : Case => Str ; a : Agr } ;
    Num,
    Ord,
    Card = ResAra.NumOrdCard ;
    Predet = ResAra.Predet ;

    Det = ResAra.Det ;
--  {s : Species => Gender => Case => Str ;
--   d : State; n : Size; isNum : Bool } ;
    Quant = ResAra.Quant ;
    Art = {s : ResAra.Number => Species => Gender => Case => Str;
             d : State} ;

-- Numeral

    Numeral = {s : CardOrd => Gender => State => Case => Str ;
               n : Size } ;
    Digits = {s : Str;
              n : Size};

-- Structural

    Conj = {s : Str ; n : ResAra.Number} ;
--    DConj = {s1,s2 : Str ; n : ResAra.Number} ;
    Subj = {s : Str ; o : Order} ;
    Prep = ResAra.Preposition ;

-- Open lexical classes, e.g. Lexicon

    V, VS, VQ, VA = ResAra.Verb ; -- = {s : VForm => Str} ;
    V2, V2A = ResAra.Verb2 ;
    VV = ResAra.Verb2 ** {sc : Preposition} ; -- c2 is for verb
    V2S, V2Q = ResAra.Verb2 ;
    V3 = ResAra.Verb3 ;
    V2V = ResAra.Verb3 ** {sc : Preposition} ; -- c3 is for verb, c2 is for dir.obj

    A = ResAra.Adj ;
    A2 = ResAra.Adj2 ;

    N = ResAra.Noun ;
    N2 = ResAra.Noun2 ;
    N3 = ResAra.Noun3 ;
    PN = {s : Case => Str; g : Gender; h : Species} ;

linref

  CN = \cn -> uttCN cn ! Masc ;
  N = \n -> uttCN (useN n) ! Masc ;
  VP = \vp -> uttVP vp ! Masc ;

}
