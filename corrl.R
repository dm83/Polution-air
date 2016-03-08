#my corr function:
corr <- function(directory, threshold = 0){
        path <-paste(getwd(),"/", directory, sep = "")
        filelist <- as.list(list.files(path))
        completetables <- complete(directory, id = 1:length(filelist))
        survtables <- subset(completetables, completetables$nobs >= threshold)
        corrvector <- c()
        
        for(i in survtables$id){
                filepath <-paste(path,"/",filelist[[i]], sep = "")      
                file <- read.csv(filepath)
                nacheck <- as.data.frame(file)
                goodtest <- complete.cases(nacheck)
                good <- nacheck[goodtest,]
                good
                var <- round(cor(good$sulfate, good$nitrate),5)
                corrvector <- append(corrvector, var, length(corrvector))
        }
        corrvector
}

cr <- corr("specdata", 150)
head(cr)

