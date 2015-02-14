dnl
dnl Macro version of the 4.0.dict file.
dnl
dnl The comment delimiter for link-grammar data files is %
changecom(`%')dnl
 %***************************************************************************%
 %                                                                           %
 % Experimental prototype Hebrew dictionary                                  %
 %       Copyright (C) 2014  Amir Plivatsky                                  %
 %                                                                           %
 % Based on en/tiny.dict,                                                    %
 %       Copyright (C) 1991-1998  Daniel Sleator and Davy Temperley          %
 %                                                                           %
 %  See file "LICENSE" for information about commercial use of this system   %
 %                                                                           %
 %***************************************************************************%

% Demo Hebrew dictionary, for initial checks. [ap]
%
% Its origin is the English tiny.dict, in which I translated some words
% and added a few more, for the purpose of checking:
% - tokenizing, including multi-prefix split
% - the resolver behavior with multi-prefix linkages
% - result printing
% The old English definitions are commented out.
%
% Much of the grammar here is still mainly the English one,
% so it is incorrect for Hebrew.
% By now several changes have been done to handle Hebrew correctly.
% Subject/verb/adjective, gender, and single/plural etc. agreements are not
% done yet.  Most of the Hebrew grammatical constructs are not supported
% here.

% Dictionary version number is 5.3.0 (formatted as V5v3v0+)
<dictionary-version-number>: V5v3v0+;

% The empty word.
EMPTY-WORD.zzz: ZZZ-;

%#dog cat woman man park yard bone neighbor store street bird hammer nose
%#party friend house movie brother sister diner student exam:
%# ({@A+} or D-) & {@M+ or (R+ & Bs+)} &
%# (J- or Os- or (Ss+ & (({@CO-} & {C-}) or R-)) or SIs-);
כלב חתול אישה איש פארק חצר עצם שכן חנות רחוב ציפור פטיש אף
מסיבה חבר בית סרט אח אחות ארוחה סטודנט מבחן ניסוי לב ורד:
 ({@A+} or {D-}) & {@M+ or (R+ & Bs+) or (D- & RB+)} &
 (J- or Os- or ((Ss+ or P+) & (({@CO-} & {C-}) or R-)) or SIs-);

%#dogs cats women men
%#parks yards bones neighbors stores streets birds hammers noses
%#parties friends houses movies brothers sisters diners students exams
%#wars winters actions laws successes:
%#{@A+} & {D-} & {@M+ or (R+ & Bp+)} &
%# (J- or Op- or (Sp+ & (({@CO-} & {C-}) or R-)) or SIp-);
כלבים חתולים נשים גברים פארקים חצרות עצמות שכנים חנויות רחובות ציפורים פטישים אפים
מסיבות חברים בתים סרטים אחים אחיות ארוחות סטודנטים מבחנים:
({@A+} or D-) & {@M+ or (R+ & Bp+)} &
 (J- or Op- or (Sp+ & (({@CO-} & {C-}) or R-)) or SIp-);

%#water anger money politics trouble:
%#{@A+} & {D-} & {@M+ or (R+ & Bs+)} &
%#(J- or Os- or (Ss+ & (({@CO-} & {C-}) or R-)) or SIs-);
מים כעס כסף פוליטיקה:
({@A+} or D-) & {@M+ or (R+ & Bs+)} &
(J- or Os- or (Ss+ & (({@CO-} & {C-}) or R-)) or SIs-);

%#law winter action war success:
%#{@A+} & {D-} & {@M+ or (R+ & Bs+)} &
%#(J- or Os- or (Ss+ & (({@CO-} & {C-}) or R-)) or SIs-);
חוק חורף פעולה מלחמה הצלחה:
({@A+} or D-) & {@M+ or (R+ & Bs+)} &
(J- or Os- or (Ss+ & (({@CO-} & {C-}) or R-)) or SIs-);

%#she he: (Ss+ & (({@CO-} & {C-}) or R-)) or SIs-;
%#me him them us: J- or O-;
אותי אותו אותה אותם אותנו: J- or O-;
%#her: D+ or J- or O-;
%#its my your their our: D+;
%#his: D+;
שלה שלו שלי שלך שלהם שלנו: Mp-;

% May need a J- variant in order to invalidate "של הוא", etc.
%#you they we I: J- or O- or (Sp+ & (({@CO-} & {C-}) or R-)) or SIp-;
אתם אתן הם הן אנחנו אני: J- or O- or (Sp+ & (({@CO-} & {C-}) or R-)) or SIp-;
%#it: J- or O- or (Ss+ & (({@CO-} & {C-}) or R-)) or SIs-;
%# lines 2-3 are from "is" [ap]
היא הוא: {J- or O- or ({Ss+} & (({@CO-} & {C-}) or R-)) or SIs-}
 & {(({Ss-} or (RS- & Bs-) or ({Q-} & SIs+))
 & (((O+ or B-) & {@MV+}) or P+ or AF-))};

%#this: (J- or O- or (Ss+ & (({@CO-} & {C-}) or R-)) or SIs-) or D+;
זה: (J- or O- or ((Ss+ or Os+) & (({@CO-} & {C-}) or R-)) or SIs-) or D+;
%#these: (J- or O- or (Sp+ & (({@CO-} & {C-}) or R-)) or SIp-) or D+;
אלו: (J- or O- or (Sp+ & (({@CO-} & {C-}) or R-)) or SIp-) or D+;
%#those: (D+) or (({P+} or {{C+} & Bp+}) &
%#(J- or O- or (Sp+ & (({@CO-} & {C-}) or R-)) or SIp- or Xb-));
הללו: (D+) or (({P+} or {{C+} & Bp+}) &
(J- or O- or (Sp+ & (({@CO-} & {C-}) or R-)) or SIp- or Xb-));
%#the: D+;
% Need both R and B to nouns, hence invented here RB
ה=: D+ or (RB- & P+);
%#a: D+;

%#did: ({Q-} & SI+ & I+) or ({@E-} & (S- or
%#(RS- & B-)) & (((B- or O+) & {@MV+}) or I+));
%#do: (SIp+ & I+) or ({@E-} & (Sp- or
%#(RS- & Bp-) or I-) &
%#(((B- or O+) & {@MV+}) or I+));
%#does: ({Q-} & SIs+ & I+) or ({@E-} & (Ss- or (RS- & Bs-)) &
%#(((B- or O+) & {@MV+}) or I+));
%#done: {@E-} & (Pv- or M- or (PP- & (B- or O+) & {@MV+}));
%#doing: {@E-} & (Pg- or Mg-) & (O+ or B-) & {@MV+};

%#has: ({Q-} & SIs+ & PP+) or ({@E-} & (Ss- or (RS- & B-)) &
%#(TO+ or ((B- or O+) & {@MV+}) or PP+));
%#have: ({Q-} & SIp+ & PP+) or ({@E-} & (Sp- or
%#(RS- & Bp-) or I-) &
%#(TO+ or ((B- or O+) & {@MV+})));
%#had: ({Q-} & SI+ & PP+) or ({@E-} & (S- or (RS- & B-) or PP-) &
%#(TO+ or ((B- or O+) & {@MV+}) or PP+));
%#having: {@E-} & (M- or Pg-) & (TO+ or ((B- or O+) & {@MV+}) or PP+);

%#is was: ((Ss- or (RS- & Bs-) or ({Q-} & SIs+))
%# & (((O+ or B-) & {@MV+}) or P+ or AF-));
הנו היה: ((Ss- or (RS- & Bs-) or ({Q-} & SIs+))
 & (((O+ or B-) & {@MV+}) or P+ or AF-));
%#are were am: ((Sp- or (RS- & Bp-) or ({Q-} &
%#SIp+)) & (((O+ or B-) & {@MV+}) or P+ or AF-));
הנם היו הנני: ((Sp- or (RS- & Bp-) or ({Q-} &
SIp+)) & (((O+ or B-) & {@MV+}) or P+ or AF-));
%#be: I- & (((O+ or B-) & {@MV+}) or P+ or AF-);
%#been: PP- & (((O+ or B-) & {@MV+}) or P+ or AF-);
%#being: {@E-} & (M- or Pg-) & (((O+ or B-) & {@MV+}) or P+ or AF-);

%#will can.v may must could should would might: (({Q-} &
%#SI+) or S- or (RS- & B-)) & I+;

%#run come: {@E-} & (Sp- or (RS- & Bp-) or I- or W- or PP-) & {@MV+};
רצים באים הולכים: {@E-} & (Sp- or (RS- & Bp-) or I- or W- or PP-) & {@MV+};
%#runs comes goes: {@E-} & (Ss- or (RS- & Bs-)) & {@MV+};
רץ רצה בא באה הולך: {@E-} & (Ss- or (RS- & Bs-)) & {@MV+};
%#ran came went: {@E-} & (S- or (RS- & B-)) & {@MV+};
%#go: {@E-} & (Sp- or (RS- & Bp-) or I-) & {@MV+};
%#gone: {@E-} & PP- & {@MV+};
%#going: {@E-} & (Pg- or M-) & {TO+} & {@MV+};
%#running coming: {@E-} & (Pg- or M-) & {@MV+};

%#talk arrive die:
%#   {@E-} & (Sp- or (RS- & Bp-) or I-) & {@MV+};
מדבר מגיע מת:
   {@E-} & (Sp- or (RS- & Bp-) or I-) & {@MV+};
%#talks.v arrives dies:
%#   {@E-} & (Ss- or (RS- & Bs-)) & {@MV+};
%#talked arrived died:
%#   {@E-} & (S- or (RS- & B-) or PP-) & {@MV+};
%#talking arriving dying:
%#   {@E-} & (Pg- or M-) & {@MV+};

%#see meet chase invite arrest:
%#   {@E-} & (Sp- or (RS- & Bp-) or I-) & (O+ or B-) & {@MV+};
%#sees meets chases invites arrests:
%#   {@E-} & (Ss- or (RS- & Bs-)) & (O+ or B-) & {@MV+};
%#met chased invited arrested:
%#{@E-} & (M- or Pv- or ((S- or (RS- & B-) or PP-) & (B- or O+))) & {@MV+};
פגש רדף הזמין אסר:
{@E-} & (M- or Pv- or ((S- or (RS- & B-) or PP-) & (B- or O+))) & {@MV+};
%#saw: {@E-} & (S- or (RS- & B-)) & (B- or O+) & {@MV+};
%#seen: {@E-} & (Pv- or M- or (PP- & (B- or O+))) & {@MV+};
%#seeing meeting chasing inviting arresting:
%#{@E-} & (Pg- or M-) & (O+ or B-) & {@MV+};

%#tell: {@E-} & (Sp- or (RS- & Bp-) or I-) & ((O+ or B-) &
%#{TH+ or C+ or QI+ or @MV+});
מספרים: {@E-} & (Sp- or (RS- & Bp-) or I-) & ((O+ or B-) &
{TH+ or C+ or QI+ or @MV+});
%#tells: {@E-} & (Ss- or (RS- & Bs-)) & ((O+ or B-) & {TH+ or C+
%#or QI+ or @MV+});
מספר: {@E-} & (Ss- or (RS- & Bs-)) & ((O+ or B-) & {TH+ or C+
or QI+ or @MV+});
%#told: {@E-} & (M- or Pv- or ((S- or (RS- & B-) or PP-) & (O+ or B-))) &
%#{TH+ or C+ or QI+ or @MV+};
%#telling: {@E-} & (Pg- or M-) & ((O+ or B-) & {TH+ or C+ or QI+ or
%#@MV+});

%#recently sometimes soon gradually specifically generally initially
%#ultimately already now sadly broadly:
%#E+ or MV-;
לאחרונה לפעמים בקרוב בהדרגה במיוחד באופן_כללי בתחילה
לבסוף כבר עכשיו בעצבות בהרחבה:
E+ or MV-;

%#from with at against behind between below above
%#without under for in across through
%#by out up down along like.p on over into about:
%#J+ & (Mp- or MV- or Pp-);
% This doesn't consider the difference between "ב=" with or without a
% definite article included in it. Trying to do so leads to extremely
% complex expression (the same for ל= elsewhere here).
מ= עם ב= מול מאחור בין מלמטה מעל
בלי מתחת בשביל בתוך עבור מעבר דרך ליד חוץ למעלה למטה לאורך כ= על לתוך בערך:
J+ & (Mp- or MV- or Pp-);

%#of: J+ & Mp-;
של: J+ & Mp-;

%#here there: MV- or Mp- or Pp-;
כאן שם: J- or (MV- or Mp- or Pp-);

%#that: (C+ & TH-)
%#or D+ or (R- & (C+ or RS+)) or SIs- or (Ss+ &
%#{{@CO-} & {C-}}) or J- or O-;
ש=: (C+ & TH-)
or D+ or (R- & (C+ or RS+)) or SIs- or (Ss+ &
{{@CO-} & {C-}}) or J- or O-;

%#to: (I+ & TO-) or ((MV- or Mp- or Pp-) & J+);
ל=: (I+ & TO-) or ((MV- or Mp- or Pp-) & J+);

%#who: (R- & (C+ or RS+)) or S+ or B+;
מי: (R- & (C+ or RS+)) or S+ or B+;
%#what: S+ or B+;
מה: S+ or B+;
%#which: (R- & (C+ or RS+)) or S+ or B-;
איזה: (R- & (C+ or RS+)) or S+ or B-;

%#because unless though although: (C+ & (({Xc+} & CO+) or MV-));
מפני בגלל מפאת
אילולי למרות_ש= למרות: (C+ & (({Xc+} & CO+) or MV-));
%#after before since until: (C+ or J+) & (({Xc+} & CO+) or MV- or Mp-);
אחרי לפני מאז עד: (C+ or J+) & (({Xc+} & CO+) or MV- or Mp-);
%#if: C+ & (({Xc+} & CO+) or MV-);
אם: C+ & (({Xc+} & CO+) or MV-);

%#when: (QI- & C+) or Q+ or (C+ & (({Xc+} & CO+) or MV-));
כאשר כש=: (QI- & C+) or Q+ or (C+ & (({Xc+} & CO+) or MV-));
%#where:(QI- & C+) or Q+;
איפה:(QI- & C+) or Q+;
%#how:  (QI- & (C+ or EA+)) or Q+ or EA+;
איך:  (QI- & (C+ or EA+)) or Q+ or EA+;

%#fast slow short long black white big small beautiful ugly tired angry:
%#  {EA-} & (A- or ((Pa- or AF+) & {@MV+}));
מהיר אטי קצר ארוך שחור לבן גדול קטן יפה מכוער עייף כועס:
   {EA-} & (A- or ((Pa- or AF+) & {@MV+}));

%#glad afraid scared.a fortunate unfortunate lucky unlucky certain sure:
%#{EA-} & (A- or ((Pa- or AF+) & {@MV+} & {C+ or TO+ or TH+}));
שמח שמחה מפחד מפחדת מפוחד מפוחדת בר_מזל בת_מזל ביש_מזל בטוח בטוחה:
 {EA-} & (A- or ((Pa- or AF+) & {@MV+} & {C+ or TO+ or TH+}));

%#very: EA+;
מאד: EA+;

%#but and: MV- & C+;
אבל ו=: MV- & C+;

",": Xc-;

% No actual definition yet - defined here because they appear as possible
% prefixes in 4.0.affix.
לכש= ככ= מב= מל= מש=: ();

% prefix stripping tests
שכבה כבה בה: ();

% With the following line in the dictionary, the parser will simply
% skip over (null-link) unknown words. If you remove it, the parser
% will output an error for any unknown words.
UNKNOWN-WORD: XXX+;
