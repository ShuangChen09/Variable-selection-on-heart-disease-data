## column chart
dd=datadist(data)
options(datadist=dd)
noml<-nomogram(modellassolrm,fun=plogis,fun.at = c(0.001,0.01,0.05,seq(0.1,0.9,by=0.1),0.95,0.99,0.999)
               ,lp=F,funlabel = "HeartDisease rate")
plot(noml)

## forest chart
rs_forest=read.csv('C:\\Users\\LX\\Desktop\\senlin.csv',header = FALSE)
forestplot(labeltext=as.matrix(rs_forest[,1:2]),mean=rs_forest$V3,lower=rs_forest$V4,
           upper=rs_forest$V5,zero=1,
           boxsize=0.15,
           lineheight = unit(7,'mm'),
           colgap=unit(2,'mm'),
           lwd.zero=2.5,
           lwd.ci=2.5, 
           col=fpColors(box='#458B00',
                        summary='#8B008B',
                        lines = 'red',
                        zero = '#7AC5CD'),
           xlab="OR",
           lwd.xaxis =2,
           txt_gp = fpTxtGp(ticks = gpar(cex =0.9),
                            xlab  = gpar(cex =0.9),
                            cex = 1),
           lty.ci = "solid",
           title = "Forestplot", 
           line.margin = 0.08,
           graph.pos=2)
