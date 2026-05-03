2 for i = 8192 to 8335
4 read a : poke i,a : c=c+a
6 next i
8 if c <> 17934 then print "checksum error";c:end
10 data 169,127,141, 13,221,169,217,174
12 data 166,  2,224,  1,240,  2,169,254
14 data 141,  4,221,169,  3,141,  5,221
16 data 169,255,141,  6,221,141,  7,221
18 data 169, 81,141, 15,221, 96, 96,120
20 data 173, 33,208,141,253, 32,169,  1
22 data 141, 25,208,169, 50,141, 18,208
24 data 173, 17,208, 41,127,141, 17,208
26 data 173, 25,208, 41,  1,240,249,169
28 data  17,141, 14,221,173, 18,208,201
30 data  50,144, 10,201, 66,176,  6,238
32 data  33,208, 76, 99, 32,173,253, 32
34 data 141, 33,208,173,  1,220,201,239
36 data 208,226,169,  0,141, 14,221,173
38 data   6,221, 73,255,141,254, 32,173
40 data   7,221, 73,255,141,255, 32,173
42 data 253, 32,141, 33,208, 88,184, 80
44 data 143,  0,  0,  0,  0,  0,  0,  0
80 sys 8192
85 dim d(20):print chr$(147)
90 for i=1to20:print chr$(147);i
95 t=300+rnd(0)*300
100 for x=1 to t
105 if peek(203)<>64 then 100
110 next x
115 sys 8231
120 d(i)=peek(8447)*256+peek(8446)
125 next i
130 print chr$(147)
135 s=0:min=d(1):max=d(1):f1=0:f2=0
140 for i=1 to 20
145 if d(i)<min then min=d(i)
150 if d(i)>max then max=d(i)
155 next
160 for i=1 to 20
165 print "measure";i;":";d(i);"ms";
170 if (d(i)=min) and (f1=0) then print " min (excluded)";:f1=1:d(i)=0
175 if (d(i)=max) and (f2=0) then print " max (excluded)";:f2=1:d(i)=0
180 print
185 s=s+d(i)
190 next i
195 m=s/18:s=0
200 for i=1 to 20
205 if d(i)>0 then s=s+(d(i)-m)^2
210 next i
215 m=int(m+0.5):e=int(sqr(s/17)+0.5)
220 print "mean delay:";m;"+/-";e;"ms"