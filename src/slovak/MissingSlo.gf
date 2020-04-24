resource MissingSlo = open GrammarSlo, Prelude in {

-- temporary definitions to enable the compilation of RGL API
oper AAnter : Ant = notYet "AAnter" ;
oper AdAdv : AdA -> Adv -> Adv = notYet "AdAdv" ;
oper AdNum : AdN -> Card -> Card = notYet "AdNum" ;
oper AdVVP : AdV -> VP -> VP = notYet "AdVVP" ;
oper AdjOrd : Ord -> AP = notYet "AdjOrd" ;
oper AdnCAdv : CAdv -> AdN = notYet "AdnCAdv" ;
oper AdvIAdv : IAdv -> Adv -> IAdv = notYet "AdvIAdv" ;
oper AdvIP : IP -> Adv -> IP = notYet "AdvIP" ;
oper AdvS : Adv -> S -> S = notYet "AdvS" ;
oper AdvSlash : ClSlash -> Adv -> ClSlash = notYet "AdvSlash" ;
oper CAdvAP : CAdv -> AP -> NP -> AP = notYet "CAdvAP" ;
oper CleftAdv : Adv -> S -> Cl = notYet "CleftAdv" ;
oper CleftNP : NP -> RS -> Cl = notYet "CleftNP" ;
oper CompCN : CN -> Comp = notYet "CompCN" ;
oper CompIAdv : IAdv -> IComp = notYet "CompIAdv" ;
oper CompIP : IP -> IComp = notYet "CompIP" ;
oper ComparA : A -> NP -> AP = notYet "ComparA" ;
oper ComparAdvAdj : CAdv -> A -> NP -> Adv = notYet "ComparAdvAdj" ;
oper ComparAdvAdjS : CAdv -> A -> S -> Adv = notYet "ComparAdvAdjS" ;
oper ComplN2 : N2 -> NP -> CN = notYet "ComplN2" ;
oper ComplN3 : N3 -> NP -> N2 = notYet "ComplN3" ;
oper ComplVA : VA -> AP -> VP = notYet "ComplVA" ;
oper ComplVQ : VQ -> QS -> VP = notYet "ComplVQ" ;
oper ComplVS : VS -> S -> VP = notYet "ComplVS" ;
oper ComplVV : VV -> VP -> VP = notYet "ComplVV" ;
oper DetNP : Det -> NP = notYet "DetNP" ;
oper DetQuantOrd : Quant -> Num -> Ord -> Det = notYet "DetQuantOrd" ;
oper EmbedQS : QS -> SC = notYet "EmbedQS" ;
oper EmbedS : S -> SC = notYet "EmbedS" ;
oper EmbedVP : VP -> SC = notYet "EmbedVP" ;
oper ExistIP : IP -> QCl = notYet "ExistIP" ;
oper ExistNP : NP -> Cl = notYet "ExistNP" ;
oper FunRP : Prep -> NP -> RP -> RP = notYet "FunRP" ;
oper GenericCl : VP -> Cl = notYet "GenericCl" ;
oper IdetCN : IDet -> CN -> IP = notYet "IdetCN" ;
oper IdetIP : IDet -> IP = notYet "IdetIP" ;
oper IdetQuant : IQuant -> Num -> IDet = notYet "IdetQuant" ;
oper ImpPl1 : VP -> Utt = notYet "ImpPl1" ;
oper ImpVP : VP -> Imp = notYet "ImpVP" ;
oper ImpersCl : VP -> Cl = notYet "ImpersCl" ;
oper OrdDigits : Digits -> Ord = notYet "OrdDigits" ;
oper OrdNumeral : Numeral -> Ord = notYet "OrdNumeral" ;
oper OrdSuperl : A -> Ord = notYet "OrdSuperl" ;
oper PPartNP : NP -> V2 -> NP = notYet "PPartNP" ;
oper PassV2 : V2 -> VP = notYet "PassV2" ;
oper PositAdvAdj : A -> Adv = notYet "PositAdvAdj" ;
oper PossPron : Pron -> Quant = notYet "PossPron" ;
oper PredSCVP : SC -> VP -> Cl = notYet "PredSCVP" ;
oper PredetNP : Predet -> NP -> NP = notYet "PredetNP" ;
oper PrepIP : Prep -> IP -> IAdv = notYet "PrepIP" ;
oper ProgrVP : VP -> VP = notYet "ProgrVP" ;
oper QuestIAdv : IAdv -> Cl -> QCl = notYet "QuestIAdv" ;
oper QuestIComp : IComp -> NP -> QCl = notYet "QuestIComp" ;
oper QuestSlash : IP -> ClSlash -> QCl = notYet "QuestSlash" ;
oper QuestVP : IP -> VP -> QCl = notYet "QuestVP" ;
oper ReflA2 : A2 -> AP = notYet "ReflA2" ;
oper ReflVP : VPSlash -> VP = notYet "ReflVP" ;
oper RelCl : Cl -> RCl = notYet "RelCl" ;
oper RelNP : NP -> RS -> NP = notYet "RelNP" ;
oper RelSlash : RP -> ClSlash -> RCl = notYet "RelSlash" ;
oper SentAP : AP -> SC -> AP = notYet "SentAP" ;
oper SentCN : CN -> SC -> CN = notYet "SentCN" ;
oper Slash2V3 : V3 -> NP -> VPSlash = notYet "Slash2V3" ;
oper Slash3V3 : V3 -> NP -> VPSlash = notYet "Slash3V3" ;
oper SlashPrep : Cl -> Prep -> ClSlash = notYet "SlashPrep" ;
oper SlashV2A : V2A -> AP -> VPSlash = notYet "SlashV2A" ;
oper SlashV2Q : V2Q -> QS -> VPSlash = notYet "SlashV2Q" ;
oper SlashV2S : V2S -> S -> VPSlash = notYet "SlashV2S" ;
oper SlashV2V : V2V -> VP -> VPSlash = notYet "SlashV2V" ;
oper SlashV2VNP : V2V -> NP -> VPSlash -> VPSlash = notYet "SlashV2VNP" ;
oper SlashVP : NP -> VPSlash -> ClSlash = notYet "SlashVP" ;
oper SlashVS : NP -> VS -> SSlash -> ClSlash = notYet "SlashVS" ;
oper SlashVV : VV -> VPSlash -> VPSlash = notYet "SlashVV" ;
oper SubjS : Subj -> S -> Adv = notYet "SubjS" ;
oper TCond : Tense = notYet "TCond" ;
oper TFut : Tense = notYet "TFut" ;
oper TPast : Tense = notYet "TPast" ;
oper Use2N3 : N3 -> N2 = notYet "Use2N3" ;
oper UseN2 : N2 -> CN = notYet "UseN2" ;
oper UseSlash : Temp -> Pol -> ClSlash -> SSlash = notYet "UseSlash" ;
oper UttCard : Card -> Utt = notYet "UttCard" ;
oper UttIAdv : IAdv -> Utt = notYet "UttIAdv" ;
oper UttIP : IP -> Utt = notYet "UttIP" ;
oper UttImpPl : Pol -> Imp -> Utt = notYet "UttImpPl" ;
oper UttImpPol : Pol -> Imp -> Utt = notYet "UttImpPol" ;
oper UttImpSg : Pol -> Imp -> Utt = notYet "UttImpSg" ;
oper UttQS : QS -> Utt = notYet "UttQS" ;
oper UttVP : VP -> Utt = notYet "UttVP" ;
oper by8agent_Prep : Prep = notYet "by8agent_Prep" ;
oper it_Pron : Pron = notYet "it_Pron" ;
oper they_Pron : Pron = notYet "they_Pron" ;
oper we_Pron : Pron = notYet "we_Pron" ;
oper whatSg_IP : IP = notYet "whatSg_IP" ;
oper which_IQuant : IQuant = notYet "which_IQuant" ;
oper whoSg_IP : IP = notYet "whoSg_IP" ;
oper youPl_Pron : Pron = notYet "youPl_Pron" ;
oper youPol_Pron : Pron = notYet "youPol_Pron" ;

}
