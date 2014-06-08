power_consumption <- read.table("./household_power_consumption.txt",
                                skip=66637, nrows=2880, sep=";",
                                na.strings="?",
                                col.names=c("Date", "Time",
                                            "Global_active_power",
                                            "Global_reactive_power",
                                            "Voltage",
                                            "Global_intensity",
                                            "Sub_metering_1",
                                            "Sub_metering_2",
                                            "Sub_metering_3")
)

power_consumption$Time <- strptime(paste(power_consumption$Date, 
                                         power_consumption$Time, sep=", "),
                                   format = "%d/%m/%Y, %H:%M:%S")
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")


png("plot2.png", width=480, height=480)
with(power_consumption,
     plot(Time[!is.na(Global_active_power)],
          Global_active_power[!is.na(Global_active_power)], 
          xlab="",
          ylab="Globa Active Power (killowatts)",
          type="l")
)
dev.off()