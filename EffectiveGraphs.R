
library(ggplot2)
#install.packages("xkcd")
library(xkcd)
countries<-c("Rwanda","South Africa","Norway","Swaziland","Brazil")
hdf<-droplevels(subset(read.delim(file="http://tiny.cc/gapminder"),
                       country %in% countries))
direct_label<-data.frame(year=2009,
                         lifeExp=hdf$lifeExp[hdf$year==2007],
                         country=hdf$country[hdf$year==2007])
set.seed(123)
ggplot()+
  geom_smooth(data=hdf,aes(x=year,y=lifeExp,group=country,linetype=country),
              se=F,color="black")+
  geom_text(aes(x=year+2.5,y=lifeExp+3,label=country),data=direct_label,
            hjust=1,vjust=1,family="xkcd",size=7)+
  theme(legend.position="none")+
  ylab("Life Expectancy")+
  xkcdaxis(c(1952,2010),c(20,83))
