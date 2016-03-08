#My second func
complete <- function(directory, id = 1:332){
        path <-paste(getwd(),"/", directory, sep = "")
        filelist <- as.list(list.files(path))
        nobs <- c()
        idlist <- c()
        
        for(i in id){
                filepath <-paste(path,"/",filelist[[i]], sep = "")      
                file <- read.csv(filepath)
                nacheck <- as.data.frame(file)
                goodtest <- complete.cases(nacheck)
                good <- nacheck[goodtest,]
                y <- length(good$ID)
                
                idlist <- append(id, i, length(id))
                nobs <- append(nobs, y, length(nobs))
                
        }
        data.frame(id, nobs)
}

t <- complete("specdata", id = 1:30)
t
class(t)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)