outputformat := "svg";
outputtemplate := "%j-%c.%o";
numeric u;
u := if outputformat = "png": 3pc else: 1pc fi;
prologues := 3;



beginfig(0);
  numeric cellWidth; cellWidth := 15u;
  numeric cellHeight; cellHeight := 2u;
  numeric tagWidth; tagWidth := 3u;
  vardef cell(expr dy) =
    draw (0,dy)--(cellWidth, dy)--(cellWidth, dy + cellHeight)--(0, dy + cellHeight)--cycle;
    draw (tagWidth, dy)--(tagWidth, cellHeight + dy);
    draw (2tagWidth, dy)--(2tagWidth, cellHeight + dy);
  enddef;
  numeric i;
  numeric prefixDy;
  numeric bodyDy;
  numeric suffixDy;

  prefixDy := -8cellHeight;
  for i=0 upto 1:
    cell(prefixDy + i*cellHeight);
  endfor;
  label.top(btex cdr etex, (0.5tagWidth, prefixDy + cellHeight + u));
  label.top(btex code etex, (0.5tagWidth, prefixDy + cellHeight));
  label.top(btex cmp etex, (1.5tagWidth, prefixDy + cellHeight + u));
  label.top(btex fn etex, (1.5tagWidth, prefixDy + cellHeight));
  label.top(btex 32-bit address etex, (0.5[2tagWidth,cellWidth], prefixDy + 1.25cellHeight));

  label.top(btex cmp etex, (0.5tagWidth, prefixDy + u));
  label.top(btex fn etex, (0.5tagWidth, prefixDy));
  label.top(btex hdr-i etex, (1.5tagWidth, prefixDy + 0.25cellHeight));
  label.top(btex suffix size etex, (2tagWidth + 2u, prefixDy + 0.25cellHeight));
  label.top(btex total size etex, (2tagWidth + 6.5u, prefixDy + 0.25cellHeight));
  draw (2/3[0,cellWidth], prefixDy + cellHeight)--(2/3[0,cellWidth], prefixDy);

  label.lft(btex $\lbrace$ etex xscaled 2 yscaled (2cellHeight/u), (-0u, prefixDy + cellHeight));
  label.lft(btex prefix etex, (-u, prefixDy + cellHeight));

  bodyDy := -2cellHeight;
  for i=0 upto 8:
    cell(bodyDy + i*cellHeight);
    label.top("instr " & decimal(2*(i+1)), (2tagWidth + 2u, bodyDy + (i + 0.25)*cellHeight));
    label.top("instr " & decimal(2*i+1), (2tagWidth + 6.5u, bodyDy + (i + 0.25)*cellHeight));
    draw (1/2[2tagWidth,cellWidth], bodyDy + i*cellHeight)--(1/2[2tagWidth,cellWidth], bodyDy + (i+1)*cellHeight);
  endfor;
  % pointer arrow from prefix to body
  drawarrow (0.5[2tagWidth,cellWidth], prefixDy + 2cellHeight) -- (0.5[2tagWidth,cellWidth], prefixDy + 4cellHeight) -- (0.5tagWidth, prefixDy + 4cellHeight) -- (0.5tagWidth, bodyDy);

  label.lft(btex $\lbrace$ etex xscaled 3 yscaled 9.5(cellHeight/u), (-0u, 0.5[bodyDy, bodyDy + 9cellHeight]));
  label.lft(btex body etex, (-1.5u,  0.5[bodyDy, bodyDy + 9cellHeight]));


  suffixDy := bodyDy + 8cellHeight + 4cellHeight;
  cell(suffixDy);
  label.top(btex cdr etex, (0.5tagWidth, suffixDy + u));
  label.top(btex nil etex, (0.5tagWidth, suffixDy));
  label.top(btex list etex, (1.5tagWidth, suffixDy + 0.25cellHeight));
  label.top(btex 32-bit address etex, (0.5[2tagWidth,cellWidth], suffixDy + 0.25cellHeight));

  label.lft(btex $\lbrace$ etex xscaled 1.2 yscaled (cellHeight/u), (-0u, suffixDy + 0.5cellHeight));
  label.lft(btex suffix etex, (-u, suffixDy + 0.5cellHeight));
endfig;
end;
