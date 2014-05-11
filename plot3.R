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

##plot3.png
png(filename="plot3.png")
plot(EPC2$Datetime,EPC2$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering")
points(EPC2$Datetime,EPC2$Sub_metering_1,type="l")
points(EPC2$Datetime,EPC2$Sub_metering_2,type="l", col="red")
points(EPC2$Datetime,EPC2$Sub_metering_3,type="l", col="blue")
legend("topright", lty=1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
