outputformat := "png";
outputtemplate := "%j-%c.%o";
numeric u;
u := if outputformat = "png": 3pc else: 1pc fi;
prologues := 3;

beginfig(0)
  path p[];
  p[0] := (u, u)
    for x=0.05 step 0.05 until 4:
    .. (u+x*u, 0.75u + 0.5u/(1 + mexp(-256*x)))
  endfor;
  p[1] := (-5u, 0.1u){right}
    for x=(-5+0.05) step 0.05 until 5:
    .. (x*u, 0.1u + 1.75u/(1 + mexp(-256*x)))
  endfor;
  p[2] := (-5u, 0.5u){right}
    for x=(-5+0.05) step 0.05 until 5:
    .. (x*u, 0.5u + 1.875u/(1 + mexp(-256*x)))
  endfor;
  p[3] := (-5u, u){right}
    for x=(-5+0.05) step 0.05 until 5:
    .. (x*u, u + 1.75u/(1 + mexp(-256*x)))
  endfor;
  path body;
  body = fullcircle scaled 2u shifted (u,0);
  path fluid;
  fluid = p[3] -- (reverse p[0]) -- (halfcircle rotated 90 scaled 2u shifted (u,0)) -- (p[0] reflectedabout((-5u,0), (5u,0))) -- reverse (p[3] reflectedabout((-5u,0), (5u,0))) -- cycle;
  % fluid = p[3]--p[0]--(halfcircle rotated 90 scaled 2u shifted (u,0))--(p[0] reflectedabout((-5u,0), (5u,0)))--(p[3] reflectedabout((-5u,0), (5u,0)))--cycle;
  fill fluid withcolor 0.3[blue, white];

  fill body withcolor 0.8white;
  draw body withpen pencircle scaled 1;

  ahlength := 8bp;
  for i=0 step 1 until 3:
    drawarrow subpath(0, 0.5*length(p[i])) of p[i] withpen pencircle scaled 1;
    drawarrow subpath(0, 0.5*length(p[i])) of (p[i] reflectedabout((-5u,0), (5u, 0))) withpen pencircle scaled 1;
    draw p[i] withpen pencircle scaled 1;
    draw (p[i] reflectedabout((-5u,0), (5u, 0))) withpen pencircle scaled 1;
  endfor;
endfig;

beginfig(1)
  path p[];
  p[0] := (u, u)
    for x=0.05 step 0.05 until 4:
    .. (u+x*u, 0.75u + 0.5u/(1 + mexp(-256*x)))
  endfor;
  p[1] := (-5u, 0.1u){right}
    for x=(-5+0.05) step 0.05 until 5:
    .. (x*u, 0.1u + 1.75u/(1 + mexp(-256*x)))
  endfor;
  p[2] := (-5u, 0.5u){right}
    for x=(-5+0.05) step 0.05 until 5:
    .. (x*u, 0.5u + 1.875u/(1 + mexp(-256*x)))
  endfor;
  p[3] := (-5u, u){right}
    for x=(-5+0.05) step 0.05 until 5:
    .. (x*u, u + 1.75u/(1 + mexp(-256*x)))
  endfor;
  path body;
  body = (reverse p[0]) -- (halfcircle rotated 90 scaled 2u shifted (u,0)) -- (p[0] reflectedabout((-5u,0), (5u,0))) -- cycle;
  path fluid;
  fluid = p[3] -- (reverse p[0]) -- (halfcircle rotated 90 scaled 2u shifted (u,0)) -- (p[0] reflectedabout((-5u,0), (5u,0))) -- reverse (p[3] reflectedabout((-5u,0), (5u,0))) -- cycle;

  fill fluid withcolor 0.3[blue, white];

  fill body withcolor 0.8white;
  % draw hatch?

  draw body withpen pencircle scaled 1;

  ahlength := 8bp;
  drawarrow (-5u,0)--(-4bp,0) withpen pencircle scaled 1;
  for i=0 step 1 until 3:
    drawarrow subpath(0, 0.5*length(p[i])) of p[i] withpen pencircle scaled 1;
    drawarrow subpath(0, 0.5*length(p[i])) of (p[i] reflectedabout((-5u,0), (5u, 0))) withpen pencircle scaled 1;
    draw p[i] withpen pencircle scaled 1;
    draw (p[i] reflectedabout((-5u,0), (5u, 0))) withpen pencircle scaled 1;
  endfor;

  label(btex $\bullet$ etex, (0, 0)) scaled 2;
  label.rt(btex $S$ etex, (0, 0)) scaled 2;
endfig;
end;