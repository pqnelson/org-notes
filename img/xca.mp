%outputformat := "svg";
%outputformat := "png";
outputformat := "mps";
outputtemplate := "%j-%c.%o";
numeric u;
u := if outputformat = "png": 1pc else: 1pc fi;
%prologues := 3;

beginfig(0)
  path outer_circle, inner_circle, segmentum;
  numeric i;
  z[0] = (0,0);
  z[1] = 3u*(cosd(45),sind(45));
  z[2] = 9u*(cosd(45),sind(45));
  z[3] = 3u*(cosd(45),-sind(45));
  z[4] = 9u*(cosd(45),-sind(45));
  outer_circle = fullcircle scaled 18u;
  inner_circle = fullcircle scaled 6u;
  fill outer_circle withcolor 0.25[white,black];
  fill inner_circle withcolor white;
  fill buildcycle(outer_circle,z2--z0,inner_circle,z0--z4) withcolor white;
  draw inner_circle;
  draw outer_circle;

  for i=0 upto 4:
    label(btex $\bullet$ etex, z[i]);
  endfor;
  label.lft(btex $O$ etex, z[0]);
  label.top(btex $A$ etex, z[1]);
  label.lft(btex $B$ etex, z[2]);
  label.bot(btex $C$ etex, z[3]);
  label.lft(btex $D$ etex, z[4]);
  draw z0--z4;
  draw z0--z2;
  draw (unitsquare scaled .5u) rotated -45;
endfig;
end;