# Airpolution task (my first research)
pollutantmean <- function(directory, polluntant, id = 1:332) {
        path <-paste(getwd(),"/", directory, sep = "")
        filelist <- as.list(list.files(path))
        meanvector <- c()
                for(i in id){
                        filepath <-paste(path,"/",filelist[[i]], sep = "")        
                        file <- read.csv(filepath)
                        polvector <- file[!is.na(file[,polluntant]), polluntant]
                        meanvector <- append(meanvector, polvector, length(meanvector))
                }
        result <- mean(meanvector)
        round(result, 3)
}

pollutantmean("specdata", "sulfate", id=1:332)
pollutantmean("specdata", "sulfate", id=1:10)
pollutantmean("specdata", "nitrate", id=1:30)

