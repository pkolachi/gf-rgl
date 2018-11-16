concrete VerbAra of Verb = CatAra ** open Prelude, ResAra, ParamX in {

  flags optimize=all_subs ;

  lin
    UseV = predV ;

    SlashVV vv vps = vps ** predV vv ; ----IL

    -- TODO: --c3 is for verb, c2 is for dir.obj
    --SlashV2V : V2V -> VP -> VPSlash ;  -- beg (her) to go
    --SlashV2VNP : V2V -> NP -> VPSlash -> VPSlash ; -- beg me to buy

    SlashV2a = slashV2 ;
    Slash3V3 v np = insertObj np (slashV2 v) ** {c2 = v.c3};

    ComplSlash vp np = insertObj np vp ;

    -- : VV  -> VP -> VP ;  -- want to run
    ComplVV vv vp = let vvVP = predV vv in -- IL
      vp ** {
        s = \\pgn,vpf => vvVP.s ! pgn ! vpf
                      ++ vv.c2.s  -- أَنْ
                      ++ vp.s ! pgn ! VPImpf Cnj ;
        isPred = False ;
        sc = vv.sc
      } ;

    -- : VS -> S -> VP ;  -- say that she runs
    ComplVS vs s = predV vs ** { -- IL
      obj = emptyObj ** {s = s.s ! Subord} 
      } ;

    -- : VQ -> QS -> VP ;  -- wonder who runs
    ComplVQ vq qs = predV vq ** { -- IL
      obj = emptyObj ** {s = qs.s ! QIndir}
      } ;

    -- : VA -> AP -> VP ;  -- they become red
    ComplVA v ap = predV v ** {comp = CompAP ap} ;

--    ComplV2A v np ap =
--      insertObj (\\_ => v.c2 ++ np.s ! Acc ++ ap.s ! np.a) (predV v) ;
--
    UseComp xabar =
      case xabar.isNP of {
        False => kaan xabar ;
        True  => predV copula ** {obj = xabar.obj ; isPred=True} 
      } ;

    UseCopula = predV copula ;

    AdvVP vp adv = insertStr adv.s vp ;

--    AdVVP adv vp = insertAdV adv.s vp ;
--
--    ReflV2 v = insertObj (\\a => v.c2 ++ reflPron ! a) (predV v) ;
--
    PassV2 = passPredV ;
--
--    UseVS, UseVQ = \vv -> {s = vv.s ; c2 = [] ; isRefl = vv.isRefl} ; -- no

    CompAP ap = {s   = \\agr,c => ap.s ! Hum ! agr.g ! agr.n ! Indef ! c ; --FIXME
                 obj = emptyObj ; isNP = False} ;
    CompAdv a = {s   = \\_,_ => a.s ;
                 obj = emptyObj ; isNP = False} ;

    CompCN cn = {s = \\agr,c => cn2str cn agr.n Indef Nom ;
                 obj = emptyObj ; isNP = False} ;
    CompNP np = {s = \\_,_ => [] ; obj = np ** {s = np.s ! Nom} ; isNP = True} ;
--
--
}
