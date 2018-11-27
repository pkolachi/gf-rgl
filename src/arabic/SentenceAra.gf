--# -path=.:abstract:common:prelude

concrete SentenceAra of Sentence = CatAra ** open
  ResAra,
  Prelude,
  ResAra,
  TenseX,
  ParamX,
  CommonX in {


  flags optimize=all_subs ; coding=utf8 ;

  lin
{-
    PredVP np vp =
      { s = \\t,p,o =>
          case o of {
            Verbal =>
              case vp.comp.a.isPron of {
                False => vp.s ! t ! p ! Verbal ! np.a ++ np.s ! Nom ++ vp.comp.s ! Acc ;
                True  => vp.s ! t ! p ! Verbal ! np.a ++ vp.comp.s ! Acc ++ np.s ! Nom
              };
            Nominal =>
              np.s ! Nom ++ vp.s ! t ! p ! Nominal ! np.a ++ vp.comp.s ! Acc
          }
      };
-}
    PredVP = predVP ;

--    PredSCVP sc vp = mkClause sc.s (agrP3 Sg) vp ;

    ImpVP vp = {
      s = \\p,g,n =>
        case p of {
          Pos =>          vp.s ! Per2 g n ! VPImp ;
          Neg => "لَا" ++ vp.s ! Per2 g n ! VPImpf Jus
        } ++ vp.obj.s  ++ vp.pred.s ! {g=g;n=n} ! Acc ++ vp.s2 
      };

--
--    SlashV2 np v2 =
--      mkClause (np.s ! Nom) np.a (predV v2) ** {c2 = v2.c2} ;
--
--    SlashVVV2 np vv v2 =
--      mkClause (np.s ! Nom) np.a
--        (insertObj (\\a => infVP vv.isAux (predV v2) a) (predVV vv))  **
--        {c2 = v2.c2} ;

-- ClSlash

    SlashVP = predVPSlash ;
    AdvSlash slash adv = slash ** { s2 = slash.s2 ++ adv.s } ;

-- : Cl -> Prep -> ClSlash
--    SlashPrep cl prep = TODO

--  SlashVS np vs sslash = TODO


--    EmbedS  s  = {s = conjThat ++ s.s} ;
--    EmbedQS qs = {s = qs.s ! QIndir} ;
--    EmbedVP vp = {s = infVP False vp (agrP3 Sg)} ; --- agr
--

    UseCl t p cl =
      {s = \\o => t.s ++ p.s ++
         case <t.t,t.a> of { --- IL guessed tenses
             <Pres,Simul>  => cl.s ! Pres ! p.p ! o ;
             <Pres,Anter>  => cl.s ! Past ! p.p ! o ;
             <x   ,_    >  => cl.s ! x ! p.p ! o
           }
      };

    UseQCl t p qcl =
      {s = \\q => t.s ++ p.s ++
         case <t.t,t.a> of { --- IL guessed tenses
           <Pres,Simul>  => qcl.s ! Pres ! p.p ! q ;
           <Pres,Anter>  => qcl.s ! Past ! p.p ! q ;
           <x   ,_    >  => qcl.s ! x ! p.p ! q
         }
      };

    UseRCl t p cl = {s = \\agr,c => t.s ++ p.s ++ cl.s ! t.t ! p.p ! agr ! c} ;

    UseSlash t p cl = UseCl t p (complClSlash cl) ;

    AdvS adv s = s ** {s = \\o => adv.s ++ s.s ! o} ;
}
