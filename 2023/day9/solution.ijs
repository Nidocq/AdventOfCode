#!/usr/local/bin/jconsole
p =: 0". each cutopen toJ fread'test.txt'
d =. 3 : '(**)}:y-}.y,0'
dmat =. d^:/:&.>p NB. Make boxed matrix of the algorigthm
id =. (2&#$1,$&0) NB. inb identity matrix
NB. echo +/+/(|.(2&#$1,$&0) #dmat) 
NB. echo (|.(id 6))
NB. echo +/+/(>{.dmat)*(|.id 6)
iddmat =. (|.(id 6))&*&.>dmat
echo +/>(+/each+/each iddmat)
NB. echo (d^:/: &.> p) NB. |.(2&#$1,$&0)  NB.*".(d^:/: &.> p)
NB. echo id 6 *>(d^:/: &.> p)
NB.echo &.>p
exit''
