# TODO: Add comment
# 
# Author: Claudio
###############################################################################

home <- "W:"

setwd(home)

getFileNames <- function() {
	# return the name of the files in the current working directory
	# getwd()

	fileNames <- list.files()
	fileInfos <- file.info(fileNames)
	return(fileNames[!fileInfos[,"isdir"]])
}

copyFileNames <- function(fileNames) {
	# this function copies the file in fileNames in the directory 
	# processed and prefixes the names with date and time labels

	for (fileName in fileNames) {
		# copy the file in the directory processed
		dateTimeLabel <- as.character(Sys.time())
		fileNameNew <- gsub(":","-",paste(dateTimeLabel,fileName))	
		file.copy(from=file.path(getwd(),fileName),to=file.path(getwd(),"processed",fileNameNew),overwrite=TRUE)
	}
}



# Process the bonds folder
directory <- "bonds"
setwd(file.path(home,directory))
fileNames <- getFileNames()
nbFiles <- length(fileNames)

if (nbFiles>0) {
	copyFileNames(fileNames)

	# start to execute the files in the correct order
	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Bonds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Bonds\\LegalEntity.P15'
		if (grepl("LegalEntity.P15",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}
	
	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Bonds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Bonds\\LegalEntity.P50'
		if (grepl("LegalEntity.P50",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}
	
	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Bonds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Bonds\\LegalEntityClassifiers.P42'
		if (grepl("LegalEntityClassifiers.P42",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}
	
	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Bonds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Bonds\\Bonds.P01'
		if (grepl("Bonds.P01",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}

	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Bonds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Bonds\\Bond.P41'
		if (grepl("Bond.P41",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}

	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Bonds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Bonds\\Bonds.P52'
		if (grepl("Bonds.P52",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}

	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Bonds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Bonds\\Bond.P03'
		if (grepl("Bond.P03",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}

	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Bonds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Bonds\\LegalEntityHolding.P50'
		if (grepl("LegalEntityHolding.P50",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}

	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Bonds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Bonds\\Timeseries_data.P06'
		if (grepl("Timeseries_data.P06",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}

	fileNames <- getFileNames()

	nbFiles <- length(fileNames)
	if (nbFiles>0) {
		copyFileNames(fileNames)
		file.remove(fileNames)
	}
}	




# Process the equities folder
directory <- "equities"
setwd(file.path(home,directory))
fileNames <- getFileNames()
nbFiles <- length(fileNames)

if (nbFiles>0) {
	copyFileNames(fileNames)
	
	# start to execute the files according to the correct order
	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Equities\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Equities\\LE.P15'
		if (grepl("LE.P15",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}
	
	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Equities\\logImportTest.txt -S Allocare_Prod  -loadfile W:\\Equities\\Equity.P01'
		if (grepl("Equity.P01",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}
	
	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Equities\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Equities\\Equity.P52'
		if (grepl("Equity.P52",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}

	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Equities\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Equities\\LegalEntityHolding.P50'
		if (grepl("LegalEntityHolding.P50",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}
	
	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Equities\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Equities\\Timeseries_data.P06'
		if (grepl("Timeseries_data.P06",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}

	fileNames <- getFileNames()

	nbFiles <- length(fileNames)
	if (nbFiles>0) {
		copyFileNames(fileNames)
		file.remove(fileNames)
	}
}	

# Process the funds folder
directory <- "funds"
setwd(file.path(home,directory))
fileNames <- getFileNames()
nbFiles <- length(fileNames)

if (nbFiles>0) {
	copyFileNames(fileNames)
	
	# start to execute the files according to the correct order
	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Funds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Funds\\LE.P15'
		if (grepl("LE.P15",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}
	
	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Funds\\logImportTest.txt -S Allocare_Prod  -loadfile W:\\Funds\\Equity.P01'
		if (grepl("Equity.P01",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}
	
	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Funds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Funds\\Equity.P52'
		if (grepl("Equity.P52",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}

	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Funds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Funds\\LegalEntityHolding.P50'
		if (grepl("LegalEntityHolding.P50",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}
	
	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Funds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Funds\\Timeseries_data.P06'
		if (grepl("Timeseries_data.P06",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}

	for (file in fileNames) {
		command <- 'Z:\\AlcInt.exe -run -logon -U DataLoadOc -P \"\" -L W:\\Funds\\logImportTest.txt -S Allocare_Prod -loadfile W:\\Funds\\LEInd.P42'
		if (grepl("LEInd.P42",file)) shell(command,wait=TRUE,mustWork=TRUE)
	}

	fileNames <- getFileNames()

	nbFiles <- length(fileNames)
	if (nbFiles>0) {
		copyFileNames(fileNames)
		file.remove(fileNames)
	}
}	
