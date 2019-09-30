install.packages("Rcpp")
library(Rcpp)
#
cppFunction('int addC(int x, int y) {
  int sum = x + y;
  return sum;
  }')
addC(1,2)
#No inputs, scalar output
cppFunction('int oneC() {
              return 1;
            }')
oneC()
#Scalar input, scalar output 
cppFunction('int signC(int x) {
              if (x > 0) {
                return 1;
              } else if (x == 0) {
                return 0;
              } else {
                return -1;
              }
            }')
signC(1)
#Vector input, scalar output 
cppFunction('double sumC(NumericVector x) {
              int n = x.size();
              double total = 0;
              for(int i = 0; i < n; ++i) {
                total += x[i];
              }
              return total;
            }')
#Vector input, vector output 
cppFunction('NumericVector pdistC(double x, NumericVector ys) {
              int n = ys.size();
              NumericVector out(n);
               
              for(int i = 0; i < n; ++i) {
                out[i] = sqrt(pow(ys[i] - x, 2.0));
              }
              return out;
            }')
#Matrix input, vector output
cppFunction('NumericVector rowSumsC(NumericMatrix x) {
              int nrow = x.nrow(), ncol = x.ncol();
              NumericVector out(nrow);
            
              for (int i = 0; i < nrow; i++) {
                double total = 0;
                for (int j = 0; j < ncol; j++) {
                  total += x(i, j);
                }
                out[i] = total;
              }
a<-matrix(1:6,2,3)
a
getwd()
            
