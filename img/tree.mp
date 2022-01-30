outputformat := "png";
outputtemplate := "%j-%c.%o";
color yellow; yellow := red + green;

beginfig(0);
  % pair z[];
  numeric u; u := 1pc;
  z[0] = (0,0);     % b
  z[1] = (-2u,-2u); % a
  z[2] = (2u, -2.5u); % z
  z[3] = (-4u,-4.5u); % x
  z[4] = (0u,-4.5u); % y
  color lightblue; lightblue := 0.5[white,blue]; % x
  color lightorange; lightorange := 0.5[white, (1, 0.6, 0)]; % y
  color lightpurple; lightpurple := 0.5[white, 0.5[red,blue]]; % z
  color pink; pink := 0.25[red,white]; % b
  color lightgreen; lightgreen := 0.5[white,green]; % a
  path triangle;
  triangle = u*(cosd(-30),sind(-30)) -- (0,u) -- u*(cosd(210),sind(210)) -- cycle;
  fill fullcircle scaled u shifted z0 withcolor pink;
  fill fullcircle scaled u shifted z1 withcolor lightgreen;
  fill triangle shifted z2 withcolor lightpurple;
  fill triangle shifted z3 withcolor lightblue;
  fill triangle shifted z4 withcolor lightorange;
  label(btex $b$ etex, z[0]);
  label(btex $a$ etex, z[1]);
  label(btex $z$ etex, z[2]);
  label(btex $x$ etex, z[3]);
  label(btex $y$ etex, z[4]);
  draw fullcircle scaled u shifted z0;
  draw fullcircle scaled u shifted z1;
  draw triangle shifted z2;
  draw triangle shifted z3;
  draw triangle shifted z4;
  draw (z0 - .5u*(cosd(45),sind(45))) -- (z1 + .5u*(cosd(45),sind(45)));
  draw (z0 + u*(2.0/sqrt(41.0),-2.5/sqrt(41.0))) -- (z2 + u*(0,1));
  draw (z1 - u*(2.0/sqrt(41.0), 2.5/sqrt(41.0))) -- (z3 + u*(0,1));
  draw (z1 + u*(2.0/sqrt(41.0),-2.5/sqrt(41.0))) -- (z4 + u*(0,1));
endfig;
beginfig(1);
  hppp := 0.50;
  vppp := 0.50;
  % pair z[];
  numeric u; u := 1pc;
  z[0] = (0,0);     % b
  z[1] = (-2u,-2u); % a
  z[2] = (2u, -2.5u); % z
  z[3] = (-4u,-4.5u); % x
  z[4] = (0u,-4.5u); % y
  color lightblue; lightblue := 0.25[white,blue]; % x
  color lightorange; lightorange := 0.5[white, (1, 0.6, 0)]; % y
  color lightpurple; lightpurple := 0.5[white, 0.5[red,blue]]; % z
  color pink; pink := 0.25[red,white]; % b
  color lightgreen; lightgreen := 0.5[white,green]; % a
  path triangle;
  triangle = u*(cosd(-30),sind(-30)) -- (0,u) -- u*(cosd(210),sind(210)) -- cycle;
  fill fullcircle scaled u shifted z0 withcolor pink;
  fill fullcircle scaled u shifted z1 withcolor lightgreen;
  fill triangle shifted z2 withcolor lightpurple;
  fill triangle shifted z3 withcolor lightblue;
  fill triangle shifted z4 withcolor lightorange;
  label(btex $b$ etex, z[0]);
  label(btex $a$ etex, z[1]);
  label(btex $z$ etex, z[2]);
  label(btex $x$ etex, z[3]);
  label(btex $y$ etex, z[4]);
  draw fullcircle scaled u shifted z0;
  draw fullcircle scaled u shifted z1;
  draw triangle shifted z2;
  draw triangle shifted z3;
  draw triangle shifted z4;
  draw (z0 - .5u*(cosd(45),sind(45))) -- (z1 + .5u*(cosd(45),sind(45)));
  draw (z0 + u*(2.0/sqrt(41.0),-2.5/sqrt(41.0))) -- (z2 + u*(0,1));
  draw (z1 - u*(2.0/sqrt(41.0), 2.5/sqrt(41.0))) -- (z3 + u*(0,1));
  draw (z1 + u*(2.0/sqrt(41.0),-2.5/sqrt(41.0))) -- (z4 + u*(0,1));
  pair dz; dz := (10u,0);
  z[5] = (2u,-2u) + dz; % b
  z[6] = (0,0u) + dz; % a
  z[7] = (4u, -4.5u) + dz; % z
  z[8] = (-2u,-2.5u) + dz; % x
  z[9] = (0u,-4.5u) + dz; % y
  fill fullcircle scaled u shifted (z5) withcolor pink;
  fill fullcircle scaled u shifted (z6) withcolor lightgreen;
  fill triangle shifted (z7) withcolor lightpurple;
  fill triangle shifted (z8) withcolor lightblue;
  fill triangle shifted (z9) withcolor lightorange;
  label(btex $b$ etex, z[5]);
  label(btex $a$ etex, z[6]);
  label(btex $z$ etex, z[7]);
  label(btex $x$ etex, z[8]);
  label(btex $y$ etex, z[9]);
  draw fullcircle scaled u shifted (z5);
  draw fullcircle scaled u shifted (z6);
  draw triangle shifted (z7);
  draw triangle shifted (z8);
  draw triangle shifted (z9);
  draw (z6 + .5u*(cosd(45),-sind(45))) -- (z5 + .5u*(-cosd(45),sind(45)));
  draw (z5 + u*(2.0/sqrt(41.0),-2.5/sqrt(41.0))) -- (z7 + u*(0,1));
  draw (z6 - u*(2.0/sqrt(41.0), 2.5/sqrt(41.0))) -- (z8 + u*(0,1));
  draw (z5 - u*(2.0/sqrt(41.0),2.5/sqrt(41.0))) -- (z9 + u*(0,1));

  drawarrow (3u,0)--(8u,0) withpen pencircle scaled 1.2;
  drawarrow (8u,-u)--(3u,-u) withpen pencircle scaled 1.2;
  label.top(btex Right etex, (5.5u,0));
  label.bot(btex Left etex, (5.5u,-u));
endfig;
beginfig(2);
  hppp := 0.50;
  vppp := 0.50;
  numeric j;
  numeric u; u := 1pc;
  for j=0 upto 4:
    % label(btex j etex, j*(u,u));
    draw fullcircle scaled u shifted (2j*u,-2j*u);
    draw unitsquare scaled u shifted (2j*(u,-u) - (2u, 2u));
    draw (2j*u-2u,-2j*u-2u)--(2j*u - 1u, -2j*u - 1u);
    draw ((j*2u,-j*2u)+(-.5u,0))..((j*2u,-j*2u)+(-0.75u,0))..(j*2u-1.5u,-j*2u-u);
  endfor;
  draw ((4*2u,-4*2u)+(.5u,0))..((4*2u,-4*2u)+(0.75u,0))..(4*2u+1.5u,-4*2u-u);
  for j=0 upto 3:
    draw ((j*2u,-j*2u)+.5u*(cosd(45),-sind(45)))--((j*2u+2u,-j*2u-2u)-.5u*(cosd(45),-sind(45)));
  endfor;
  label(btex 1 etex, (0,0));
  label(btex 2 etex, (2u,-2u));
  label(btex 3 etex, (4u,-4u));
  label(btex 4 etex, (6u,-6u));
  label(btex 5 etex, (8u,-8u));
  draw unitsquare scaled u shifted(9u,-10u);
  draw (8u+2u,-8u-u)--(8u+u,-8u-2u);
endfig;
beginfig(3);
  hppp := 0.50;
  vppp := 0.50;
  % pair z[];
  numeric u; u := 1pc;
  z[0] = (0,0);        % a
  z[1] = (2u,-2u);     % c
  z[2] = (0,-4u);      % b
  z[3] = (-2u, -2.5u); % x
  z[4] = (-2u, -6.5u); % y_{0}
  z[5] = (2u,-6.5u);   % y_{1}
  z[6] = (4u, -4.5u);  % z
  color lightpurple; lightpurple := 0.5[white, 0.5[red,blue]]; % a
  color lightred; lightred := 0.75[red,white]; % x & z
  color lightgreen; lightgreen := 0.5[white,green]; % b
  color lightblue; lightblue := 0.25[white,blue]; % x
  color lightyellow; lightyellow := 0.5[white,yellow]; % y_{0}
  color lightorange; lightorange := 0.5[white, 0.5[red,yellow]]; % c
  path triangle;
  triangle = u*(cosd(-30),sind(-30)) -- (0,u) -- u*(cosd(210),sind(210)) -- cycle;
  fill fullcircle scaled u shifted z0 withcolor lightpurple;
  fill fullcircle scaled u shifted z2 withcolor lightgreen;
  fill fullcircle scaled u shifted z1 withcolor lightorange;
  fill triangle shifted z3 withcolor lightred;
  fill triangle shifted z4 withcolor lightblue;
  fill triangle shifted z5 withcolor lightyellow;
  fill triangle shifted z6 withcolor lightred;
  label(btex $a$ etex, z[0]);
  label(btex $c$ etex, z[1]);
  label(btex $b$ etex, z[2]);
  label(btex $x$ etex, z[3]);
  label(btex $y_{0}$ etex, z[4]);
  label(btex $y_{1}$ etex, z[5]);
  label(btex $z$ etex, z[6]);
  draw fullcircle scaled u shifted z0;
  draw fullcircle scaled u shifted z1;
  draw fullcircle scaled u shifted z2;
  draw triangle shifted z3;
  draw triangle shifted z4;
  draw triangle shifted z5;
  draw triangle shifted z6;
  draw (z0 + .5u*(cosd(45),-sind(45))) -- (z1 + .5u*(-cosd(45),sind(45)));
  draw (z1 - .5u*(cosd(45),sind(45))) -- (z2 + .5u*(cosd(45),sind(45)));
  draw (z0 - u*(2.0/sqrt(41.0),2.5/sqrt(41.0))) -- (z3 + u*(0,1));
  draw (z2 - u*(2.0/sqrt(41.0), 2.5/sqrt(41.0))) -- (z4 + u*(0,1));
  draw (z2 + u*(2.0/sqrt(41.0),-2.5/sqrt(41.0))) -- (z5 + u*(0,1));
  draw (z1 + u*(2.0/sqrt(41.0),-2.5/sqrt(41.0))) -- (z6 + u*(0,1));

  z[7] = (13u,-2u);        % a
  z[8] = (19u,-2u);     % c
  z[9] = (16u,0);      % b
  z[10] = (11u, -4.5u); % x
  z[11] = (15u, -4.5u); % y_{0}
  z[12] = (17u,-4.5u);   % y_{1}
  z[13] = (21u, -4.5u);  % z
  fill fullcircle scaled u shifted z7 withcolor lightpurple;
  fill fullcircle scaled u shifted z9 withcolor lightgreen;
  fill fullcircle scaled u shifted z8 withcolor lightorange;
  fill triangle shifted z10 withcolor lightred;
  fill triangle shifted z11 withcolor lightblue;
  fill triangle shifted z12 withcolor lightyellow;
  fill triangle shifted z13 withcolor lightred;
  label(btex $a$ etex, z[7]);
  label(btex $c$ etex, z[8]);
  label(btex $b$ etex, z[9]);
  label(btex $x$ etex, z[10]);
  label(btex $y_{0}$ etex, z[11]);
  label(btex $y_{1}$ etex, z[12]);
  label(btex $z$ etex, z[13]);
  draw fullcircle scaled u shifted z7;
  draw fullcircle scaled u shifted z8;
  draw fullcircle scaled u shifted z9;
  draw triangle shifted z10;
  draw triangle shifted z11;
  draw triangle shifted z12;
  draw triangle shifted z13;
  draw (z9 + .5u*(cosd(45),-sind(45))) -- (z8 + .5u*(-cosd(45),sind(45)));
  draw (z9 - .5u*(cosd(45),sind(45))) -- (z7 + .5u*(cosd(45),sind(45)));
  draw (z7 - u*(2.0/sqrt(41.0),2.5/sqrt(41.0))) -- (z10 + u*(0,1));
  draw (z7 + u*(2.0/sqrt(41.0),-2.5/sqrt(41.0))) -- (z11 + u*(0,1));
  draw (z8 - u*(2.0/sqrt(41.0),2.5/sqrt(41.0))) -- (z12 + u*(0,1));
  draw (z8 + u*(2.0/sqrt(41.0),-2.5/sqrt(41.0))) -- (z13 + u*(0,1));

  drawarrow (5u,-2u)--(10u,-2u) withpen pencircle scaled 1.2;
  label.top(btex Double Left etex, (7.5u,-2u));
endfig;

beginfig(4);
  hppp := 0.50;
  vppp := 0.50;
  % pair z[];
  numeric u; u := 1pc;
  z[0] = (0,0);        % a
  z[1] = (2u,-2u);     % c
  z[2] = (0,-4u);      % b
  z[3] = (-2u, -2.5u); % x
  z[4] = (-2u, -6.5u); % y_{0}
  z[5] = (2u,-6.5u);   % y_{1}
  z[6] = (4u, -4.5u);  % z
  color lightpurple; lightpurple := 0.5[white, 0.5[red,blue]]; % a
  color lightred; lightred := 0.75[red,white]; % x & z
  color lightgreen; lightgreen := 0.5[white,green]; % b
  color lightblue; lightblue := 0.25[white,blue]; % x
  color lightyellow; lightyellow := 0.5[white,yellow]; % y_{0}
  color lightorange; lightorange := 0.5[white, 0.5[red,yellow]]; % c
  path triangle;
  triangle = u*(cosd(-30),sind(-30)) -- (0,u) -- u*(cosd(210),sind(210)) -- cycle;
  fill fullcircle scaled u shifted z0 withcolor lightpurple;
  fill fullcircle scaled u shifted z2 withcolor lightgreen;
  fill fullcircle scaled u shifted z1 withcolor lightorange;
  fill triangle shifted z3 withcolor lightred;
  fill triangle shifted z4 withcolor lightblue;
  fill triangle shifted z5 withcolor lightyellow;
  fill triangle shifted z6 withcolor lightred;
  label(btex $a$ etex, z[0]);
  label(btex $c$ etex, z[1]);
  label(btex $b$ etex, z[2]);
  label(btex $x$ etex, z[3]);
  label(btex $y_{0}$ etex, z[4]);
  label(btex $y_{1}$ etex, z[5]);
  label(btex $z$ etex, z[6]);
  draw fullcircle scaled u shifted z0;
  draw fullcircle scaled u shifted z1;
  draw fullcircle scaled u shifted z2;
  draw triangle shifted z3;
  draw triangle shifted z4;
  draw triangle shifted z5;
  draw triangle shifted z6;
  draw (z0 + .5u*(cosd(45),-sind(45))) -- (z1 + .5u*(-cosd(45),sind(45)));
  draw (z1 - .5u*(cosd(45),sind(45))) -- (z2 + .5u*(cosd(45),sind(45)));
  draw (z0 - u*(2.0/sqrt(41.0),2.5/sqrt(41.0))) -- (z3 + u*(0,1));
  draw (z2 - u*(2.0/sqrt(41.0), 2.5/sqrt(41.0))) -- (z4 + u*(0,1));
  draw (z2 + u*(2.0/sqrt(41.0),-2.5/sqrt(41.0))) -- (z5 + u*(0,1));
  draw (z1 + u*(2.0/sqrt(41.0),-2.5/sqrt(41.0))) -- (z6 + u*(0,1));

  z[7] = (13u,0u);        % a
  z[8] = (17u,-4u);     % c
  z[9] = (15u,-2u);      % b
  z[10] = (11u, -2.5u); % x
  z[11] = (13u, -4.5u); % y_{0}
  z[12] = (15u, -6.5u);   % y_{1}
  z[13] = (19u, -6.5u);  % z
  fill fullcircle scaled u shifted z7 withcolor lightpurple;
  fill fullcircle scaled u shifted z9 withcolor lightgreen;
  fill fullcircle scaled u shifted z8 withcolor lightorange;
  fill triangle shifted z10 withcolor lightred;
  fill triangle shifted z11 withcolor lightblue;
  fill triangle shifted z12 withcolor lightyellow;
  fill triangle shifted z13 withcolor lightred;
  label(btex $a$ etex, z[7]);
  label(btex $c$ etex, z[8]);
  label(btex $b$ etex, z[9]);
  label(btex $x$ etex, z[10]);
  label(btex $y_{0}$ etex, z[11]);
  label(btex $y_{1}$ etex, z[12]);
  label(btex $z$ etex, z[13]);
  draw fullcircle scaled u shifted z7;
  draw fullcircle scaled u shifted z8;
  draw fullcircle scaled u shifted z9;
  draw triangle shifted z10;
  draw triangle shifted z11;
  draw triangle shifted z12;
  draw triangle shifted z13;
  draw (z7 + .5u*(cosd(45),-sind(45))) -- (z9 + .5u*(-cosd(45),sind(45)));
  draw (z9 + .5u*(cosd(45),-sind(45))) -- (z8 + .5u*(-cosd(45),sind(45)));
  draw (z7 - u*(2.0/sqrt(41.0),2.5/sqrt(41.0))) -- (z10 + u*(0,1));
  draw (z9 - u*(2.0/sqrt(41.0),2.5/sqrt(41.0))) -- (z11 + u*(0,1));
  draw (z8 - u*(2.0/sqrt(41.0),2.5/sqrt(41.0))) -- (z12 + u*(0,1));
  draw (z8 + u*(2.0/sqrt(41.0),-2.5/sqrt(41.0))) -- (z13 + u*(0,1));

  drawarrow (5u,-2u)--(10u,-2u) withpen pencircle scaled 1.2;
  label.top(btex Local Right etex, (7.5u,-2u));
endfig;


end;
