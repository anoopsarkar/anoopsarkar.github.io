%verbatimtex %&latex
%\documentclass[11pt]{article}
%\usepackage{txfonts}
%\begin{document}
%etex

input boxes;
input trees;

def_nonterminal(N, btex \strut N etex);
def_nonterminal(NP, btex \strut NP etex);
def_nonterminal(PP, btex \strut PP etex);
def_nonterminal(V, btex \strut V etex);
def_nonterminal(P, btex \strut P etex);
def_nonterminal(VP, btex \strut VP etex);
def_nonterminal(ADV, btex \strut ADV etex);
def_nonterminal(S, btex \strut S etex);
def_nonterminal(SPRIME, btex \strut S' etex);
def_nonterminal(WH, btex \strut WH etex);
def_nonterminal(SBAR, btex \strut SBAR etex);

def_nonterminal(perr, btex \strut per-r etex);
def_nonterminal(per, btex \strut per etex);
def_nonterminal(comma, btex \strut , etex);
def_nonterminal(perdescof, btex \strut per-desc-of etex);
def_nonterminal(whnp, btex \strut whnp etex);
def_nonterminal(advp, btex \strut advp etex);
def_nonterminal(perdescptr, btex \strut per-desc-ptr etex);
def_nonterminal(perdescr, btex \strut per-desc-r etex);
def_nonterminal(perdesc, btex \strut per-desc etex);
def_nonterminal(empof, btex \strut emp-of etex);
def_nonterminal(orgr, btex \strut org-r etex);
def_nonterminal(org, btex \strut org etex);
def_nonterminal(vl, btex \strut v etex);

beginfig(1);

  perr.root(per(btex \strut Nance etex),
    comma(btex \strut , etex),
    perdescof(whnp(btex \strut who etex),
      perdescptr(vl(btex \strut is etex),
	advp(btex \strut also etex),
	perdescr(perdesc(leaf.sub(btex \strut a paid consultant etex)),
	  empof(vl(btex \strut to etex),
	    orgr(org(btex \strut ABC etex),
	      org(btex \strut News etex)))))));

  sub.edge := "drawroof";
  drawtrees(root);

endfig;

def_nonterminal(VPI, btex \strut VP({\it ended}) etex);
def_nonterminal(PI, btex \strut P({\it with}) etex);
def_nonterminal(PII, btex \strut P({\it of}) etex);
def_nonterminal(PPI, btex \strut PP({\it with}) etex);
def_nonterminal(PPII, btex \strut PP({\it of}) etex);
def_nonterminal(NPI, btex \strut NP({\it loss}) etex);
def_nonterminal(NPII, btex \strut NP({\it cents}) etex);

beginfig(2);

  VPI.root((btex \strut ended etex),
    PPI((btex \strut with etex),
      NPI(NPI(btex \strut a loss etex),
	PPII((btex \strut of etex),
	  NPII(btex \strut 7 cents etex)))));

  drawtrees(root);

endfig;


def_nonterminal(SI, btex \strut S({\it indicated}) etex);
def_nonterminal(VI, btex \strut V({\it indicated}) etex);
def_nonterminal(PI, btex \strut P({\it in}) etex);
def_nonterminal(PII, btex \strut P({\it of}) etex);
def_nonterminal(PIII, btex \strut P({\it between}) etex);
def_nonterminal(NPI, btex \strut NP({\it trials}) etex);
def_nonterminal(NPII, btex \strut NP({\it difference}) etex);
def_nonterminal(NPIII, btex \strut NP({\it level}) etex);
def_nonterminal(NPIV, btex \strut NP({\it hypoglycemia}) etex);
def_nonterminal(NPV, btex \strut NP({\it users}) etex);
def_nonterminal(PPI, btex \strut PP({\it in}) etex);
def_nonterminal(PPII, btex \strut PP({\it of}) etex);
def_nonterminal(PPIII, btex \strut PP({\it between}) etex);
def_nonterminal(VPI, btex \strut VP({\it indicated}) etex);

beginfig(3);

  SI.root(NPI(leaf.sub(btex \strut
	    the company 's clinical trials $\ldots$%
            etex)),
         VPI(VI(btex \strut indicated etex),
	   NPII(btex \strut no difference etex),
   	     PPI(PI(btex \strut in etex),
		NPIII(leaf.sub2(btex \strut the level of $\ldots$ etex)))));
%		NPIII((btex \strut the level etex),
%                    PPII(PII(btex \strut of etex),
%     	                NPIV(btex \strut hypoglycemia etex)),
%                      PPIII(PIII(btex \strut between etex),
%     		        NPV(leaf.sub2(btex \strut users of either product etex))))));

	    sub.edge := "drawroof";
	    sub2.edge := "drawroof";
	    drawtrees(root);

endfig;

beginfig(4);

  VPI.root(VI(btex \strut $\ldots$ etex),
	   NPII(btex \strut $\ldots$ etex),
   	     PPI(leaf.sub2(btex \strut $\ldots$ etex)));

	   sub2.edge := "drawroof";
	   drawtrees(root);

endfig;

beginfig(5);

  VP.root((btex \strut $\ldots$ etex),
    VP((btex \strut VB etex),
      (btex \strut NP etex),
      (btex \strut PP etex)));

  drawtrees(root);

endfig;

beginfig(6);

  VP.root((btex \strut $\ldots$ etex),
    VP((btex \strut VB etex),
      (btex \strut NP etex)),
    (btex \strut PP etex));

  drawtrees(root);

endfig;

beginfig(7);

  VP.root((btex \strut VB etex),
    (btex \strut NP etex));

  drawtrees(root);

endfig;

beginfig(8);

  VP.root((btex \strut VB etex),
    (btex \strut PP etex),
    (btex \strut NP etex));

  drawtrees(root);

endfig;

beginfig(9);

  S.a1(S(btex \strut a etex),
    (btex \strut S\rlap{$\downarrow$} etex));
  S.a2((btex \strut S\rlap{$\downarrow$} etex),
    S(btex \strut a etex));
  S.a3(btex \strut a etex);
  S.a4(S(S(leaf.sub1(btex $\vdots$ etex)),
      S(leaf.sub2(btex $\vdots$ etex))),
    S(S(leaf.sub3(btex $\vdots$ etex)),
      S(leaf.sub4(btex $\vdots$ etex))));

  sub1.edge := "drawroof";
  sub2.edge := "drawroof";
  sub3.edge := "drawroof";
  sub4.edge := "drawroof";

  a1.c = (0,0);
  a2.c = a1.c + (60pt,0);
  a3.c = a2.c + (60pt,0);
  a4.c = a3.c + (80pt,0);

  drawtrees(a1);
  drawtrees(a2);
  drawtrees(a3);
  drawtrees(a4);

  label.lft(btex $\alpha_1$: etex, a1.w);
  label.lft(btex $\alpha_2$: etex, a2.w);
  label.lft(btex $\alpha_3$: etex, a3.w);

endfig;

beginfig(10);

  S.a1(S(btex \strut a etex),
    (btex \strut S$\ast$ etex));

  S.a2((btex \strut S$\ast$ etex),
    S(btex \strut a etex));

  S.a3(btex \strut a etex);

  S.a4(S.target(btex a etex),
    S(S(btex a etex),
      S(btex a etex)));

  S.a5(S(S(btex a etex),
      S(btex a etex)),
    S(S(btex a etex),
      S(btex a etex)));

  a1.c = (0,0);
  a2.c = a1.c + (60pt,0);
  a3.c = a2.c + (60pt,0);
  a4.c = a3.c + (60pt,0);
  a5.c = a4.c + (80pt,0);

  drawtrees(a1);
  drawtrees(a2);
  drawtrees(a3);
  drawtrees(a4);
  drawtrees(a5);

  drawarrow a2.c{dir -45}..{dir 45}target.w cutbefore bpath a2 cutafter bpath target;

  label.lft(btex $\alpha_1$: etex, a1.w);
  label.lft(btex $\alpha_2$: etex, a2.w);
  label.lft(btex $\alpha_3$: etex, a3.w);
  label.lft(btex $\gamma$: etex, a4.w);
  label.lft(btex $\gamma'$: etex, a5.w);

endfig;

beginfig(11);

  NP.a1(btex \strut the store etex);

  WH.a2(btex \strut which etex);

  NP.a3(btex \strut IBM etex);

  NP.a4((leaf.nmod(btex \strut NP\rlap{$\ast$} etex)),
    SBAR((leaf.whmod(btex \strut WH\rlap{$\downarrow$} etex)),
      S((leaf.ibm(btex \strut NP\rlap{$\downarrow$} etex)),
	VP.imod((btex \strut imagined etex),
	  NP(btex \strut $\epsilon$ etex)))));

  VP.a5(leaf.vpmod(btex \strut VP$\ast$ etex),
    NP(btex \strut last week etex));
  
  a4.c = (0,0);
  a1.c = a4.c - (100pt,20pt);
  a2.c = a4.c - (70pt,90pt);
  a3.c = a4.c - (10pt,120pt);
  a5.c = a4.c + (160pt,-40pt);

  drawtrees(a1);
  drawtrees(a2);
  drawtrees(a3);
  drawtrees(a4);
  drawtrees(a5);

  drawarrow nmod.c{left}..{down}a1.c cutbefore bpath nmod cutafter bpath a1;
  drawarrow a2.c{up}..{up}whmod.c cutbefore bpath a2 cutafter bpath whmod dashed evenly;
  drawarrow a3.c{up}..{up}ibm.c cutbefore bpath a3 cutafter bpath ibm dashed evenly;
  drawarrow vpmod.c{down}..{right}imod.c cutbefore bpath vpmod cutafter bpath imod;

endfig;

beginfig(12);

  NP.a3(btex \strut IBM etex);

  NP.a4((leaf.nmod(btex \strut NP\rlap{$\ast$} etex)),
    SBAR((leaf.whmod(btex \strut WH\rlap{$\downarrow$} etex)),
      S((leaf.ibm(btex \strut NP\rlap{$\downarrow$} etex)),
	VP.imod((btex \strut bought etex),
	  NP(btex \strut $\epsilon$ etex)))));

  NP.d1((leaf(btex \strut NP\rlap{$\ast$} etex)),
    SBAR((leaf(btex \strut WH\rlap{$\downarrow$} etex)),
      S((NP(btex \strut IBM etex)),
	VP((btex \strut bought etex),
	  NP(btex \strut $\epsilon$ etex)))));

  a4.c = (0,0);
  a3.c = a4.c - (10pt,120pt);
  d1.c = a4.c + (170pt,0);

  drawtrees(a3);
  drawtrees(a4);
  drawtrees(d1);

  label.lft(btex $\alpha$: etex, a3.w);
  label.lft(btex $t$: etex, a4.w);
  label.lft(btex $\eta$: etex, ibm.w);

  drawarrow a3.c{up}..{up}ibm.c cutbefore bpath a3 cutafter bpath ibm dashed evenly;

endfig;

beginfig(13);

  NP.a4((leaf.nmod(btex \strut NP\rlap{$\ast$} etex)),
    SBAR((leaf.whmod(btex \strut WH\rlap{$\downarrow$} etex)),
      S((leaf.ibm(btex \strut NP\rlap{$\downarrow$} etex)),
	VP.imod((btex \strut bought etex),
	  NP(btex \strut $\epsilon$ etex)))));

  VP.a5(leaf.vpmod(btex \strut VP\rlap{$\ast$} etex),
    NP(btex \strut last week etex));
  
  NP.d2((leaf(btex \strut NP\rlap{$\ast$} etex)),
    SBAR((leaf(btex \strut WH\rlap{$\downarrow$} etex)),
      S((leaf(btex \strut NP\rlap{$\downarrow$} etex)),
	VP(VP((btex \strut bought etex),
	    NP(btex \strut $\epsilon$ etex)),
	  NP(btex \strut last week etex)))));

  a4.c = (0,0);
  a5.c = a4.c + (160pt,-40pt);
  d2.c = a4.c + (260pt,0);

  drawtrees(a4);
  drawtrees(a5);
  drawtrees(d2);

  label.lft(btex $\beta$: etex, a5.w);
  label.lft(btex $t$: etex, a4.w);
  label.lft(btex $\eta$: etex, imod.w);

  drawarrow vpmod.c{down}..{right}imod.c cutbefore bpath vpmod cutafter bpath imod;

endfig;

beginfig(14);

  S.root(
    NP(btex \strut Pierre Vinken etex),
    VP(
      (btex \strut will etex),
      VP(
	VP((btex \strut join etex),
	  NP(btex \strut the board etex)),
	PP(
	  (btex \strut as etex),
	  NP(btex \strut a non-executive director etex)))));

  drawtrees(root);

endfig;

beginfig(15);

  NP.a1(btex \strut Pierre etex);

  NP.a2(btex \strut Vinken etex);

  VP.a3(
    (btex \strut will etex),
    (btex \strut VP\rlap{$\ast$} etex));

  S.a4(
    (btex \strut NP\rlap{$\downarrow$} etex),
    VP(
      (btex \strut join etex),
      (btex \strut NP\rlap{$\downarrow$} etex)));

  NP.a5(btex \strut the etex);

  NP.a6(btex \strut board etex);

  VP.a7(
    (btex \strut VP\rlap{$\ast$} etex),
    PP(
      (btex \strut as etex),
      (btex \strut NP\rlap{$\downarrow$} etex)));

  NP.a8(btex \strut a etex);

  NP.a9(btex \strut non-executive etex);

  NP.a10(btex \strut director etex);


  a1.c = (0,0);
  a2.c = a1.c + (50pt,0);
  a3.c = a2.c + (80pt,0);
  a4.c = a3.c + (100pt,0);
  a5.c = a1.c + (0,-100pt);
  a6.c = a5.c + (50pt,0);
  a7.c = a6.c + (80pt,0);
  a8.c = a7.c + (90pt,0pt);
  a9.c = a8.c + (50pt,0pt);
  a10.c = a9.c + (50pt,0pt);

  drawtrees(a1);
  drawtrees(a2);
  drawtrees(a3);
  drawtrees(a4);
  drawtrees(a5);
  drawtrees(a6);
  drawtrees(a7);
  drawtrees(a8);
  drawtrees(a9);
  drawtrees(a10);

  label.lft(btex $\beta_1$: etex, a1.w);
  label.lft(btex $\alpha_2$: etex, a2.w);
  label.lft(btex $\beta_2$: etex, a3.w);
  label.lft(btex $\alpha_1$: etex, a4.w);
  label.lft(btex $\beta_3$: etex, a5.w);
  label.lft(btex $\alpha_3$: etex, a6.w);
  label.lft(btex $\beta_4$: etex, a7.w);
  label.lft(btex $\beta_6$: etex, a8.w);
  label.lft(btex $\beta_5$: etex, a9.w);
  label.lft(btex $\alpha_4$: etex, a10.w);

endfig;

def_nonterminal(join, btex \strut $\alpha_1($join$)$  etex);
def_nonterminal(vinken, btex \strut $\alpha_2($Vinken$)$  etex);
def_nonterminal(board, btex \strut $\alpha_3($board$)$  etex);
def_nonterminal(as, btex \strut $\beta_4($as$)$  etex);
def_nonterminal(director, btex \strut $\alpha_4($director$)$  etex);
def_nonterminal(nonexec, btex \strut $\beta_5($non-executive$)$  etex);

beginfig(16);

  join.root(
    vinken(btex \strut $\beta_1($Pierre$)$ etex),
    (btex \strut $\beta_2($will$)$ etex),
    board(btex \strut $\beta_3($the$)$ etex),
    as(
      director(nonexec(btex \strut $\beta_6($a$)$ etex))));
    
  drawtrees(root);
  
endfig;
  
beginfig(17);

  S.a1(
    (btex \strut NP\rlap{$\downarrow$} etex),
    VP.intmod(
      (btex \strut join etex),
      NP(btex \strut the board etex)));

  VP.a2(
    leaf.asmod(btex \strut VP\rlap{$\ast$} etex),
    PP(
      (btex \strut as etex),
      NP(btex \strut director etex)));

  VP.a3(
    leaf.timemod(btex \strut VP\rlap{$\ast$} etex),
    NP(btex \strut Nov. 29 etex));

  a1.c = (-20pt,0);
  a2.c = a1.c + (120pt,20pt);
  a3.c = a1.c + (220pt,-20pt);

  drawtrees(a1);
  drawtrees(a2);
  drawtrees(a3);

  drawarrow asmod.c{down}..{right}intmod.c
  cutbefore bpath asmod cutafter bpath intmod dashed evenly;
  drawarrow timemod.c{down}..{left}intmod.c
  cutbefore bpath timemod cutafter bpath intmod dashed evenly;

  drawarrow a3.c{up}..{left}a2.c
  cutbefore bpath a3 cutafter bpath a2;
  drawarrow a2.c{up}..{left}intmod.c
  cutbefore bpath a2 cutafter bpath intmod;

endfig;

beginfig(18);

  NP.a1(
    NP(btex \strut a program etex),
    VP(
      (btex \strut to etex),
      VP(
	(btex \strut promote etex),
	NP(
	  NP(btex \strut safety etex),
	  PP(
	    (btex \strut in etex),
	    NP(btex \strut trucks and minivans etex))))));

  NP.a2(
    NP(btex \strut a program etex),
    VP(
      (btex \strut to etex),
      VP(
	(btex \strut promote etex),
	NP(
	  NP(
	    (btex \strut safety etex),
	    PP(
	      (btex \strut in etex),
	      (btex \strut trucks etex))),
	  (btex \strut and etex),
	  NP(btex \strut minivans etex)))));

  a1.c = (0,0);
  a2.c = a1.c + (240pt,0);

  drawtrees(a1);
  drawtrees(a2);
  
endfig;

def_nonterminal(Sna, btex \strut S$_{na}$ etex);
def_nonterminal(Spia, btex \strut S$_{\pi_1}$ etex);
def_nonterminal(Spib, btex \strut S$_{\pi_2}$ etex);

beginfig(19);

  Spib.a1(btex \strut $\epsilon$ etex);
  Sna.a2(Spib((btex \strut $a$ etex),
	     (btex \strut $S^\ast_{na}$ etex)),
      (btex \strut $b$ etex));

  a1.c = (0,0);
  a2.c = a1.c + (60pt,0);

  drawtrees(a1);
  drawtrees(a2);

  label.lft(btex $\pi_1$: etex, a1.w);
  label.lft(btex $\pi_2$: etex, a2.w);

endfig;

def_nonterminal(Sga, btex \strut S$_{\gamma_2}$ etex);
def_nonterminal(Sgb, btex \strut S$_{\gamma_2}$ etex);

beginfig(20);

  Sgb.a1(btex \strut $\epsilon$ etex);
  Sna.a2((btex \strut $c$ etex),
    Sgb((btex \strut $d$ etex),
      (btex \strut $S^\ast_{na}$ etex)));

  a1.c = (0,0);
  a2.c = a1.c + (60pt,0);

  drawtrees(a1);
  drawtrees(a2);

  label.lft(btex $\gamma_1$: etex, a1.w);
  label.lft(btex $\gamma_2$: etex, a2.w);

endfig;

beginfig(21);

  NP.a1(btex \strut Calvin etex);

  NP.a3(btex \strut monsters etex);

  S.a4((leaf.nmod(btex \strut NP$_0$\rlap{$\downarrow$} etex)),
	VP.imod(V(btex \strut bought etex),
	  leaf.mons(btex \strut NP$_1$\rlap{$\downarrow$} etex)));

  VP.a5(leaf.vpmod(btex \strut VP$\ast$ etex),
    PP(P(btex \strut in etex),
	NP(btex \strut NP\rlap{$\downarrow$} etex)));

  NP.a6(leaf.npmod(btex \strut NP$\ast$ etex),
    PP(P(btex \strut in etex),
	NP(btex \strut NP\rlap{$\downarrow$} etex)));

  NP.a7(NP(btex \strut school etex));
  
  a1.c = (0,0);
  a4.c = a1.c + (100pt,0pt);
  a3.c = a4.c + (140pt,0pt);
  a5.c = a1.c + (0pt,-120pt);
  a6.c = a5.c + (100pt,0pt);
  a7.c = a6.c + (100pt,0pt);

  drawtrees(a1);
  drawtrees(a3);
  drawtrees(a4);
  drawtrees(a5);
  drawtrees(a6);
  drawtrees(a7);

  drawarrow a1.c{up}..{up}nmod.c cutbefore bpath a1 cutafter bpath nmod dashed evenly;
  drawarrow a3.c{up}..{up}mons.c cutbefore bpath a3 cutafter bpath mons dashed evenly;

  label.lft(btex $\gamma_1$: etex, a1.w);
  label.lft(btex $\gamma_2$: etex, a3.w);
  label.lft(btex $\gamma_3$: etex, a4.w);
  label.lft(btex $\gamma_4$: etex, a5.w);
  label.lft(btex $\gamma_5$: etex, a6.w);

endfig;

beginfig(22);

  S.a1(NP(leaf(btex \strut Calvin etex)),
    VP(V(btex \strut admires etex),
      NP(leaf(btex \strut who etex))));

  SPRIME.a2(NP(leaf.wh(btex \strut who etex)),
    S(NP(btex \strut Calvin etex),
      VP(V(btex \strut admires etex),	
	NP(leaf.tr(btex \strut $\epsilon$ etex)))));

  a1.c = (0,0);
  a2.c = a1.c + (140pt,0pt);

  drawtrees(a1);
  drawtrees(a2);

  drawarrow tr.c{down}..{up}wh.c cutbefore bpath tr cutafter bpath wh dashed evenly;

endfig;

beginfig(23);

  SPRIME.a3(NP(leaf(btex \strut who etex)),
    S(NP(btex \strut $\epsilon$ etex),
      VP(V(btex \strut is etex),
	VP(VP(V(btex \strut admired etex),	
	      NP(leaf(btex \strut $\epsilon$ etex))),
	   PP(P(btex \strut by etex),
              NP(btex \strut Calvin etex))))));

  drawtrees(a3);

endfig;

def_nonterminal(pia, btex \strut $\pi_1(\epsilon)$ etex);
def_nonterminal(pib, btex \strut $\pi_2[0](a_1,b_1)$ etex);
def_nonterminal(pibb, btex \strut $\pi_2[00](a_2,b_2)$ etex);

beginfig(24);

  Sna.a1(Spib((btex \strut $a_1$ etex),
	     Sna(btex \strut $\epsilon$ etex)),
      (btex \strut $b_1$ etex));

  Sna.a2(Sna(Spib((btex \strut $a_2$ etex),
                  Sna((btex \strut $a_1$ etex),
                      S(btex \strut $\epsilon$ etex))),
             (btex \strut $b_2$ etex)),
         (btex \strut $b_1$ etex));

  Sna.a3(Sna(Sna(Spib((btex \strut $a_3$ etex),
                       Sna((btex \strut $a_2$ etex),
                           Sna((btex \strut $a_1$ etex),
                               S(btex \strut $\epsilon$ etex)))),
                (btex \strut $b_3$ etex)),
            (btex \strut $b_2$ etex)),
        (btex \strut $b_1$ etex));

  a1.c = (0,0);
  a2.c = a1.c + (120pt,0);
  a3.c = a2.c + (160pt,0);

  drawtrees(a1);
  drawtrees(a2);
  drawtrees(a3);

endfig;

beginfig(25);

  pia.a4(btex \strut $\pi_2[0](a_1, b_1)$ etex);
  pia.a5(pib(btex \strut $\pi_2[00](a_2,b_2)$ etex));
  pia.a6(pib(pibb(btex \strut $\pi_2[00](a_3,b_3)$ etex)));

  a4.c = (0,0);
  a5.c = a4.c + (90pt,0);
  a6.c = a5.c + (90pt,0);

  drawtrees(a4);
  drawtrees(a5);
  drawtrees(a6);

endfig;

def_nonterminal(A, btex \strut A etex);
def_nonterminal(B, btex \strut B etex);

beginfig(26);

  Spib.a1(btex \strut $\epsilon$ etex);
  Sna.a2(A(Spib(B(btex \strut S$^\ast_{na}$ etex))));

  a1.c = (0,0);
  a2.c = a1.c + (70pt,0);

  drawtrees(a1);
  drawtrees(a2);

  label.lft(btex $\pi_1$: etex, a1.w);
  label.lft(btex $\pi_2$: etex, a2.w);

endfig;

beginfig(27);

  S.root(
    NP(btex \strut David etex),
    VP(
      VP(
        V(btex \strut likes etex),
	NP(btex \strut peanuts etex)),
	ADV(btex \strut passionately etex)));

  drawtrees(root);

endfig;

def_nonterminal(SD, btex \strut S $\rightarrow$ NP VP etex);
def_nonterminal(NPDa, btex \strut NP $\rightarrow$ David etex);
def_nonterminal(VPDa, btex \strut VP $\rightarrow$ VP ADV etex);
def_nonterminal(VPDb, btex \strut VP $\rightarrow$ V NP etex);
def_nonterminal(VD, btex \strut V $\rightarrow$ likes etex);
def_nonterminal(NPDb, btex \strut NP $\rightarrow$ peanuts etex);
def_nonterminal(ADVD, btex \strut ADV $\rightarrow$ passionately etex);

beginfig(28);

  SD.root(
    NPDa(btex \strut David etex),
    VPDa(
      VPDb(
        VD(btex \strut likes etex),
	NPDb(btex \strut peanuts etex)),
	ADVD(btex \strut passionately etex)));

  drawtrees(root);

endfig;

def_nonterminal(A, btex \strut A etex);
def_nonterminal(B, btex \strut B etex);

beginfig(29);

  S.root(
    A((btex \strut a etex), A((btex \strut a etex), A(btex \strut $\vdots$ etex))),
    B(B(B(btex \strut $\vdots$ etex), (btex \strut b etex)), (btex \strut b etex)));

  drawtrees(root);

endfig;

beginfig(30);

  S.root(
    A((btex \strut a etex), A((btex \strut a etex), A(btex \strut $\vdots$ etex))),
    A(A(A(btex \strut $\vdots$ etex), (btex \strut b etex)), (btex \strut b etex)));

  drawtrees(root);

endfig;

beginfig(31);

  A.root((btex \strut a etex), (btex \strut A etex));

  drawtrees(root);

endfig;

beginfig(32);

  A.root((btex \strut A etex), (btex \strut b etex));

  drawtrees(root);

endfig;

def_nonterminal(Aa, btex \strut A$_1$ etex);
def_nonterminal(Ab, btex \strut A$_2$ etex);
def_nonterminal(Ac, btex \strut A$_3$ etex);

beginfig(33);

  Aa.a1(Ab(Ac(btex \strut a etex),Aa(Ab(btex \strut b etex), Ac(btex \strut a etex))),Ac(btex \strut a etex));
  Aa.a2((btex \strut a etex),Aa((btex \strut b etex),Ac(btex \strut a etex)),Ac(btex \strut a etex));

  a1.c = (0,0);
  a2.c = a1.c + (120pt,0);

  drawtrees(a1);
  drawtrees(a2);

endfig;

beginfig(34);

  S.root((btex \strut A etex), (btex \strut A etex));

  drawtrees(root);

endfig;

def_nonterminal(Slink, btex \strut S\rlap{$_1$} etex);
def_nonterminal(SlinkA, btex \strut S\rlap{$_{1.1}$} etex);
def_nonterminal(SlinkB, btex \strut S\rlap{$_{1.2}$} etex);

beginfig(35);
  S.root((btex \strut a etex),Slink((btex b etex),(btex S\rlap{$\ast$} etex),(btex c etex)),(btex \strut d etex));
  drawtrees(root);
endfig;

beginfig(36);
  SlinkA.root((btex \strut a etex),SlinkB(btex S\rlap{$\ast$} etex));
  drawtrees(root);
endfig;

beginfig(37);
  S.root((btex S\rlap{$\ast$} etex),(btex \strut b etex));
  drawtrees(root);
endfig;

beginfig(38);
  Slink.root(btex \strut $\varepsilon$ etex);
  drawtrees(root);
endfig;

beginfig(39);
  SlinkA.root(SlinkB(btex \strut $\varepsilon$ etex));
  drawtrees(root);
endfig;

end;

%verbatimtex
%\end{document}
%etex

