%outputformat := "svg";
outputformat := "png";
outputtemplate := "%j-%c.%o";
numeric u;
u := if outputformat = "png": 1pc else: 1pc fi;
prologues := 3;

beginfig(0)
  numeric H, W;
  path EM, thermo, mechanics;
  color yellow, orange, purple;
  yellow := red + green;
  orange := red + .5green;
  purple := red + blue;
  H := 15u;
  W := 15u;

  z[0] = (0, .5H);
  z[1] = z[0] - (H/sqrt(2),H/sqrt(2));
  z[2] = z[1] + (.5W + H/sqrt(2), -.5W - H/sqrt(2));
  z[3] = z[2] + (H/sqrt(2),H/sqrt(2));

  z[4] = (W,.5H);
  z[5] = z[4] + (H/sqrt(2),-H/sqrt(2));
  z[6] = z[2] + (-H/sqrt(2),H/sqrt(2));

  mechanics := (0,0)--(W,0)--(W,H)--(0,H)--cycle;
  EM := z0--z1--z2--z3--cycle;
  thermo := z4--z5--z2--z6--cycle;

  fill mechanics withcolor 0.5[yellow,white]; 
  fill EM withcolor 0.25[blue,white];
  fill thermo withcolor 0.25[red,white];
  fill z0--(.5W,0)--(0,0)--cycle withcolor 0.5[green,white];
  fill z4--(.5W,0)--(W,0)--cycle withcolor 0.5[orange,white];
  fill z3--z2--z6--(.5W,0)--cycle withcolor 0.25[purple,white];
  draw mechanics;
  draw EM;
  draw thermo;

  picture lab_em, lab_qm, lab_term;
  lab_em := thelabel.rt(btex Electromagnetism etex, z1 + (u,0));
  lab_qm := thelabel(btex Quantum Mechanics etex, 0.5[z2,(.5W,0)]);
  lab_term := thelabel.lft(btex Thermodynamics etex, z5 + (-u,0));
  unfill bbox lab_em;
  unfill bbox lab_qm;
  unfill bbox lab_term;
  draw lab_em;
  draw lab_qm;
  draw lab_term;
  label(btex Mechanics etex, (.5W,.5H));
  % label.rt(btex Electromagnetism etex, z1 + (u,0));
  % label.lft(btex Thermodynamics etex, z5 + (-u,0));
  
  label.rt(btex Special etex, (u,2u));
  label.rt(btex Relativity etex, (u,u));

  label.lft(btex Brownian etex, (W-u, 2u));
  label.lft(btex Motion etex, (W-u,u));
endfig;

beginfig(1)
  numeric H, W;
  path EM, thermo, mechanics;
  color yellow, orange, purple;
  yellow := red + green;
  orange := red + .5green;
  purple := red + blue;
  H := 15u;
  W := 15u;

  z[0] = (0, .5H);
  z[1] = z[0] - (H/sqrt(2),H/sqrt(2));
  z[2] = z[1] + (.5W + H/sqrt(2), -.5W - H/sqrt(2));
  z[3] = z[2] + (H/sqrt(2),H/sqrt(2));

  z[4] = (W,.5H);
  z[5] = z[4] + (H/sqrt(2),-H/sqrt(2));
  z[6] = z[2] + (-H/sqrt(2),H/sqrt(2));

  mechanics := (0,0)--(W,0)--(W,H)--(0,H)--cycle;
  EM := z0--z1--z2--z3--cycle;
  thermo := z4--z5--z2--z6--cycle;

  fill mechanics withcolor 0.5[yellow,white]; 
  fill EM withcolor 0.5[blue,white];
  fill thermo withcolor 0.5[red,white];
  fill z0--(.5W,0)--(0,0)--cycle withcolor 0.5[green,white];
  fill z4--(.5W,0)--(W,0)--cycle withcolor 0.5[orange,white];
  fill z3--z2--z6--(.5W,0)--cycle withcolor 0.5[purple,white];
  draw mechanics;
  draw EM;
  draw thermo;

  label(btex Mechanics etex, (.5W,.5H));
  label.rt(btex Electromagnetism etex, z1 + (u,0));
  label.lft(btex Thermodynamics etex, z5 + (-u,0));
  label(btex Quantum Mechanics etex, 0.5[z2,(.5W,0)]);
  label.rt(btex Special etex, (u,2u));
  label.rt(btex Relativity etex, (u,u));

  label.lft(btex Brownian etex, (W-u, 2u));
  label.lft(btex Motion etex, (W-u,u));
endfig;

end;