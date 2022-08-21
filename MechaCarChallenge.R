library(dplyr) #import dplyr library

# Deliverable 1

mpg_table <- read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F) #read in the mpg data

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD ,data=mpg_table) #create multiple linear model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD ,data=mpg_table)) #generate summary statistics

# Deliverable 2

suspension_table <- read.csv('Suspension_Coil.csv',check.names = F,stringsAsFactors = F) #read in the suspension data

total_summary <- suspension_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table with multiple columns)
head(total_summary)

lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table with multiple columns grouped by lot)
head(lot_summary)

# Deliverable 3

t.test(suspension_table$PSI,mu=1500) #compare sample versus population means


t.test(subset(suspension_table, Manufacturing_Lot=="Lot1")$PSI,mu=1500) #Lot 1 t-test

t.test(subset(suspension_table, Manufacturing_Lot=="Lot2")$PSI,mu=1500) #Lot 2 t-test

t.test(subset(suspension_table, Manufacturing_Lot=="Lot3")$PSI,mu=1500) #Lot 3 t-test
       