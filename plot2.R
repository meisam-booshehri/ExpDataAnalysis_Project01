initialization <- function()
{
#create a new directory for the downloaded repository
if (!file.exists("meisam-booshehri-repo"))
{ 
dir.create("meisam-booshehri-repo")
}

#check whether the dataset has been downloaded or not; if not, the file will be downloaded and unzipped
if (!file.exists("./meisam-booshehri-repo/household_power_consumption.txt"))   
{
fileUrl<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./meisam-booshehri-repo/ExtData_Assignment1.zip")
unzip("./meisam-booshehri-repo/ExtData_Assignment1.zip",exdir="./meisam-booshehri-repo",overwrite = TRUE)
}

}

plot2 <- function()
{
initialization()
ElectricPowerConsumption <- read.table("./meisam-booshehri-repo/household_power_consumption.txt", skip=1, 
			                           col.names=(c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
				                       ,header = FALSE, sep = ";",
                                        na.strings = "?"
                                       )
							
tmp1<-ElectricPowerConsumption[as.character(ElectricPowerConsumption$Date) %in% c("1/2/2007","2/2/2007"),]	

X1<-strptime(paste(tmp1$Date,tmp1$Time), format="%d/%m/%Y %H:%M:%S" )
X2<-tmp1$Global_active_power
plot(X1,X2, type='l', ylab="Global Active Power(kilowatts)", xlab="")	

dev.copy(png, file="plot2.png")
dev.off()
		
}
