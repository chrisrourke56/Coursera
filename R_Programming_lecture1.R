x <- c(0.5, 0.6) ## numeric
x <- c(TRUE, FALSE) ## logical
x <- c(T, F) ## logical
x <- c("a", "b", "c") ## character
x <- 9:29 ## integer
x <- c(1+0i, 2+4i) ## complex

x <- vector("numeric", length = 10)

x <- 0:6
class(x)
#[1] "integer"
as.numeric(x)
#[1] 0 1 2 3 4 5 6
as.logical(x)
#[1] FALSE TRUE TRUE TRUE TRUE TRUE TRUE
as.character(x)
#[1] "0" "1" "2" "3" "4" "5" "6"

x <- list(1, "a", TRUE, 1 + 4i)


############################
m <- matrix(nrow = 2, ncol = 3)
dim(m)
attributes(m)

m <- 1:10
dim(m) <- c(2, 5)

x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x, y)


############################
x <- factor(c("yes", "yes", "no", "yes", "no"))
table(x)
unclass(x)
x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))


############################
#is.na()
#is.nan()
x<-c(1,2,NA,10,3)
is.na(x)
is.nan(x)
x<-c(1,2,NaN,NA,4)
is.na(x)
is.nan(x)

###########################
#Data Frame
#Special list where every element of the list has to have the same length
#Each element as a column
#length of each element of the list as # rows

x<-data.frame(foo=1:4,bar=c(T,T,F,F))
x
nrow(x)
ncol(x)

##########################
x<-1:3
names(x)
names(x)<-c("foo","bar","norf")
x
names(x)

x<-list(a=1,b=2,c=3)
x

m<-matrix(1:4,nrow=2,ncol=2)
dimnames(m)<-list(c("a","b"),c("c","d"))
m

##########################
#atomic classes - numeric, logical, char, integer, complex
#vectors, lists
#factors
#mising values
#data frames
#names


#########################
#help(read.table) #Read it, especially for large datasets
data<-read.table("foo.txt")
data<-read.csv("foo.csv")

initial<-read.table("datatable.txt",nrows=100)
classes<-sapply(initial,class)
tabAll<-read.table("datatable.txt",
                   colClasses=classes)
#can set colClasses = "numeric" if all numeric

#dump and dput - preserve metadata
y<-data.frame(a=1,b="a")
y
dput(y)
dput(y,file="y.R")
new.y<-dget("y.R")
new.y

x<-"foo"
y<-data.frame(a=1,b="a")
dump(c("x","y"),file="data.R")
rm(x,y)
source("data.R")
y
x

#######################
str(file)
con<-file("foo.txt","r")
data<-read.csv(con)
close(con)
#equivalent to
data<-read.csv("foo.txt")

con<-gzfile("words.gz")
x<-readLines(con,10)
x

con<-url("http://www.jhsph.edu","r")
x<-readLines(con)
head(x)

######################
x<-c("a","b","c","c","d","a")
x[1]
x[2]
x[1:4]
x[x>"a"]
u<-x>"a"
u
x[u]

#####################
x<-list(foo=1:4,bar=0.6)
x[1]#<--Returns list with 1-4
x[[1]]#<--Returns 1-4
x$bar#<-- equivalent to [["bar"]]
x[["bar"]]
x["bar"]#<-- Returns list

x<-list(foo=1:4,bar=0.6,baz="hello")
x[c(1,3)]
name<-"foo"
x[[name]]
x$name
x$foo

x<-list(a=list(10,12,14),b=c(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]


########################
x<-matrix(1:6,2,3)
x[1,2]
x[2,1]
x[1,]
x[,2]
x[1,2,drop=FALSE]
x[1, ,drop=FALSE]

########################
x<-list(aardvark=1:5)
x$a
x[["a"]]
x[["a",exact=FALSE]]

########################
x<-c(1,2,NA,4,NA,5)
bad<-is.na(x)
x[!bad]

y<-c("a","b",NA,"d",NA,"f")
good<-complete.cases(x,y)
good
x[good]
y[good]


#######################
x<-1:4;y<-6:9
x+y
x * y
x / y

x<-matrix(1:4,2,2);y<-matrix(rep(10,4),2,2)
x * y
x / y
x %*% y #true matrix multiplication




####################
#Quiz
x<-4L
class(x)
x<-c(4,TRUE)
class(x)
x<-c(1,3,5)
y<-c(3,2,10)
cbind(x,y)

x<-list(2,"a","b",TRUE)
x[[2]]
y<-x[[2]]
class(y)
is.vector(y)
is.list(y)

x<-1:4
y<-2
x+y
z<-x+y
class(z)

data<-read.csv("hw1_data.csv")
names(data)
data
data[1:2,]
nrow(data)
tail(data,n=2)
data[152:153,]
data[47,"Ozone"]
summary(data,na.rm=true)
help(mean)
mean(data[,"Ozone"],na.rm=TRUE)
sub_data<-subset(data,"Ozone">31 & Temp > 90,na.rm=true)
sub_data[!is.na(sub_data),]
!is.na(sub_data)
summary(sub_data[!is.na(sub_data),])
names(data)
sub_data<-subset(data,Month==6)
sub_data
summary(sub_data)

sub_data<-subset(data,Month==5)
summary(sub_data)
