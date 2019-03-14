concrete NounPes of Noun = CatPes ** open ResPes, Prelude in {

  flags optimize=all_subs ;

  lin
    DetCN det cn = cn ** {
      s = \\m =>
        let num : Number = case det.isNum of {
              True  => Sg ; -- noun modified by a number is invariably singular
              False => det.n } ;
            mod : Mod = case <cn.isCmpd,det.mod> of {
              <IsCmpd,Poss> => Ezafe ; -- If CN is compound and Det is poss.pron, don't use poss.suff but Ezafe and full form of pronoun
              _           => det.mod } ;
            detStr : Str = case cn.isCmpd of {
              NotCmpd => det.s ; -- possessive suffix
              IsCmpd  => det.sp } ; -- full form
         in case mod of {
              Bare => detStr ++ cn.s ! num ! m ; -- det doesn't require a special form, keep the Mod=>Str table
              x    => cn.s ! num ! x ++ detStr } ; -- det requires a special form
      a = agrP3 det.n ;
      compl = cn.compl ! det.n
      } ;

    UsePN pn = emptyNP ** pn ** {s = \\_ => pn.s} ;
    UsePron p = emptyNP ** p ** {s = \\_ => p.s ; animacy = Animate} ;

    PredetNP pred np = np ** {
      s = \\ez => pred.s ++ np.s ! ez
      } ;

    PPartNP np v2 = np ** {
      s = \\ez => np.s ! ez ++ partNP v2
      } ;

    RelNP np rs = np ** {
      s = \\ez => np.s ! ez ++ rs.s ! np.a
      } ;

    AdvNP np adv = np ** {
      s = \\ez => np.s ! Ezafe ++ adv.s
      } ;

    DetQuantOrd quant num ord = {
      s = quant.s ! num.n ! NotCmpd ++ num.s ++ ord.s ;
      sp = quant.s ! num.n ! IsCmpd ++ num.s ++ ord.s ;  -- only matters for PossPron
      isNum = orB num.isNum ord.isNum ;
      mod = quant.mod ;
      n = num.n
      } ;

    DetQuant quant num = {
      s = quant.s ! num.n ! NotCmpd ++ num.s ;
      sp = quant.s ! num.n ! IsCmpd ++ num.s ; -- only matters for PossPron
      isNum = num.isNum;
      mod = quant.mod ;
      n = num.n
      } ;

    DetNP det = {
      s = \\_ => det.sp ;
      a = agrP3 det.n ;
      hasAdj = False ;
      animacy = Inanimate ;
      compl = []
      } ;

    PossPron p = {
       s = \\_ => table {
              NotCmpd => BIND ++ p.ps ;
              IsCmpd  => p.s } ; -- is a compound
       a = p.a ;
       mod = Poss} ; -- make into Ezafe if DetCN if N is compound

    NumSg = {s = [] ; n = Sg ; isNum = False} ;
    NumPl = {s = [] ; n = Pl ; isNum = False} ;
-- from here
    NumCard n = n ** {isNum = True} ;

    NumDigits n = n ** {s = n.s ! NCard; isNum = True} ;
    OrdDigits n = n ** {s = n.s ! NOrd ; isNum = True} ;

    NumNumeral n = n ** {s = n.s ! NCard; isNum = True} ;
    OrdNumeral n = n ** {s = n.s ! NOrd ; isNum = True} ;
-- to here
    AdNum adn num = num ** {s = adn.s ++ num.s} ;

    OrdSuperl a = {s = a.s ! Bare ++ taryn; n = Sg ; isNum=False} ; -- check the form of adjective

    DefArt = {s = \\_,_ => [] ; mod = Bare} ;
    IndefArt = {s = table {Sg => \\_ => IndefArticle ; Pl => \\_ => []} ; mod = Bare} ;

    MassNP cn = cn ** {
      s = cn.s ! Sg ;
      a = agrP3 Sg ;
      compl = cn.compl ! Sg
      } ;

    UseN,
    UseN2 = useN ;

    Use2N3 n3 = useN n3 ** {
      c2 = n3.c2 ;
      compl = []
      } ;

    Use3N3 n3 = useN n3 ** {
      c2 = n3.c3 ;
      compl = []
      } ;

    ComplN2 n2 np = n2 ** {
      s = \\n,m => n2.s ! n ! Ezafe ;
      compl = \\_ => n2.compl ++ n2.c2 ++ np.s ! Bare ;
      hasAdj = False
     };

    ComplN3 n3 np = n3 ** {
      s = \\n,m => n3.s ! n ! Ezafe ;
      compl = n3.c2 ++ np.s ! Bare ;
      c = n3.c3;
      } ;

    AdjCN ap cn = cn ** {
      s = \\n,ez => cn.s ! n ! Ezafe ++ ap.s ! ez ;
      hasAdj = True
     } ;

    RelCN cn rs = cn ** {
      s = \\n,ez => cn.s ! n ! Clitic ;
      compl = \\n => rs.s ! agrP3 n ;
      } ;

    AdvCN cn ad = cn ** {s = \\n,m => cn.s ! n ! Ezafe ++ ad.s} ;

    SentCN cn sc = cn ** {compl = \\n => sc.s} ;

    -- correct for /city Paris/, incorrect for /king John/
    -- ApposNP in ExtendPes works for /king John/ (no ezafe).
    ApposCN cn np = cn ** {s = \\n,m => cn.s ! n ! Ezafe ++ np.s ! m} ;

}
