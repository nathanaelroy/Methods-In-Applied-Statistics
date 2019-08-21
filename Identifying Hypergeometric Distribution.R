"
A sample of size n=25 units is drawn without replacement from a population of size N=500. 
Each sampled unit is inspected and x=1 defective unit is observed. Within a probabilistic risk
level of size alpha, what is the highest number of defects in the population that could be expected.
"

"
For this probem we model the population as a hypergeometric distribution with 
N = d + nd, the number of defective units versus the number of non-defective units. 
We want the probability of getting only 1 defective unit or less to be low
"
#We start m at 50 defective units and find that the Probability of getting 0 or 1 defective
#units is still well above .05.
#we then increment by 1 until we get equal to or below alpha

N=500
k=25


m1=1 #Number of defective units
m2=1 #Number of defective units
m3=1 #Number of defective units

p1 = 1
p2 = 1
p3 = 1
alpha1 = .01
alpha2 = .05
alpha3 = .1

while(p1>alpha1){
  m1=m1+1
  p1 = phyper(1,m1,N-m1,k)
}


while(p2> alpha2){
  m2=m2+1
  p2 = phyper(1,m2,N-m2,k)
}

while(p3>alpha3){
  m3=m3+1
  p3 = phyper(1,m3,N-m3,k)
}

m1
m2
m3