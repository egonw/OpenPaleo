# Using R to visualise Paleontology publications in PLOS ONE through time

# Install package from CRAN
install.packages("rplos")

# Load package from library
library("rplos")

# Search for the term 'paleontology'
PLOS_data<-searchplos('paleontology', fl=c('id','publication_date','author','copyright',
                                           'counter_total_all','financial_disclosure','pagecount',
                                           'title','volume'), limit = 10000)

# Export file as a csv to your working directory
write.csv(PLOS_data, file = "PLOS_data.csv")

# So there's a lot of data..
# Let's try plotting it!

# Plot results through time, no limit on data
plot_throughtime(terms='paleontology',limit=10000)

