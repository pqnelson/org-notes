outputformat := "png";
outputtemplate := "%j-%c.%o";
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
end;
