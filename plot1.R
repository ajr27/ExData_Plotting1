# Declare a variable with the root directory path (EDA Project 1 folder)
root.dir <- "C:/Users/arcenis.rojas/Desktop/Exploratory Data Analysis/Project 1/"

# Set the working directory to the Project 1 folder
setwd(root.dir)

# Download the Household Power Consumption data zip file
download.file(paste0("https://d396qusza40orc.cloudfront.net/",
                     "exdata%2Fdata%2Fhousehold_power_consumption.zip"),
              "hpc.zip", mode = "wb")

# Unzip the file into the Project 1 folder
unzip("hpc.zip")

# Read in the file
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?")

# Change the format of the date variable
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc <- subset(hpc, (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Save the dataset
save(hpc, file = paste0(root.dir, "hpc_dat.Rda"))

# Paste the date and time variable
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%Y-%m-%d %H:%M:%S")

# Plot a histogram of "global_active_power" variable
png(filename = "plot1.png", width = 480, height = 480)
hist(hpc$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()




