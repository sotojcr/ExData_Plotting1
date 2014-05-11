##Importa os dados
EPC <- read.csv2("household_power_consumption.txt",as.is = T)
##Prepara os dados
#Converte EPC$Date de texto para date
EPC$Date <- as.Date(EPC$Date,"%d/%m/%Y")
#Elimina "?" como marcador de mising e converte os valores para numeric 
EPC$Global_active_power   <- as.numeric(EPC$Global_active_power)
EPC$Global_reactive_power <- as.numeric(EPC$Global_reactive_power)
EPC$Voltage               <- as.numeric(EPC$Voltage)
EPC$Global_intensity      <- as.numeric(EPC$Global_intensity)
EPC$Sub_metering_1        <- as.numeric(EPC$Sub_metering_1)
EPC$Sub_metering_2        <- as.numeric(EPC$Sub_metering_2)

##Filtra as datas 2007-02-01 and 2007-02-02
EPC2 <- EPC[EPC$Date>="2007-02-01" & EPC$Date<="2007-02-02",c(1:9)]

##plot2.png
EPC2$Datetime <- NULL
EPC2$Datetime <- strptime(paste(EPC2$Date, EPC2$Time), format='%Y-%m-%d %H:%M:%S')
Sys.setlocale("LC_TIME", "English")
png(filename="plot2.png")
plot(EPC2$Datetime,EPC2$Global_active_power, xlab="",ylab="Global Active Power (kilowatts)", type="l")
dev.off()