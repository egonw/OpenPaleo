# Using R to visualise Paleontology publications in PLOS ONE through time

# Install package from within R
install.packages("rplos")

# Load package from library
library("rplos")

# setwd("C:/Users/PC/Documents/GitHub")

# Search for the term 'paleontology'
plos_data<-searchplos('paleontology', 'id,publication_date', limit = 10000)

# Export file as a csv to your working directory
write.csv(plos_data, file = "PLOS_data.csv")


# So there's a lot of data..
# Let's try plotting it!

# Plot results through time, no limit on data
plot_throughtime(terms='paleontology',limit=10000)

# You can try this with any field really
plot_throughtime(terms='paleontology',limit=3000)

