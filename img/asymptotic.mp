outputformat := "png";
outputtemplate := "%j-%c.%o";
numeric u;
u := if outputformat = "png": 3pc else: 1pc fi;
prologues := 3;
hppp := 1/2;
vppp := 1/2;
beginfig(0);
  path p[];
  numeric i;
  color c;
  pen pn;
  % draw axes
  for i:= 1 upto 5:
    if 0=i mod 4:
      pn := pencircle scaled 1.2;
      c := 0.5white;
    else:
      pn := pencircle scaled 1;
      c := 0.9white;
    fi;
    draw (-u, i*0.75u) -- (7u, i*0.75u) withpen pn withcolor c;
  endfor;
  draw (-u, -0.75u) -- (7u, -0.75u) withcolor 0.9white;
  for i:= 1 upto 9:
    if 0=i mod 4:
      pn := pencircle scaled 1.2;
      c := 0.5white;
    else:
      pn := pencircle scaled 1;
      c := 0.9white;
    fi;
    draw (0.75u*i, -u)--(0.75u*i, 4u) withpen pn withcolor c;
  endfor;
  draw (-0.75u, -u)--(-0.75u, 4u) withcolor 0.9white;

  drawdblarrow (0,-u) -- (0, 4u) withpen pencircle scaled 2;
  drawdblarrow (-u, 0)--(7u,0) withpen pencircle scaled 2;
  % plot the curve
  p0 := (0, 3u)
    for i:=2 step 2 until 72:
    .. (3i, 3u*mexp(-256*((i/36)**4)))
  endfor;
  draw p0 withpen pencircle scaled 2;

  label.ulft(btex $1$ etex, (0, 3u));
  label.lrt(btex $1$ etex, (3u, 0));
  label.lrt(btex $2$ etex, (6u, 0));
  label.top(btex $y$ etex, (0, 4u));
  label.bot(btex $x$ etex, (7u, -3));
endfig;
end;
