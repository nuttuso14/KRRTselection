#include <iostream>
#include <cstdlib>
#include <time.h> 
#include <cmath>
#include <fstream>
#include <string>
#include <sstream>
#include <iomanip> // setprecision
#include <vector>
#include <random>

using namespace std;

default_random_engine eng{static_cast<long unsigned int>(time(0))};
uniform_real_distribution<double> distribution(0.0,1.0);
int DEBUG=0;

class RandomNumber{

    private:
    double rate;
    double GenExpo(double u)
    {
        double randomNum = distribution(eng);
        //cout <<"rr: " <<randomNum << endl;
        return (-(double)1/u)*log(randomNum);
    }

    int chooseNumber(double p[],int size)
    {
        double randomNum = distribution(eng);
        double r = randomNum;
        int nums = 0;
        double pi = 0;
        //cout << "r=" << r <<endl;
        for(int i=0;i<size;i++)
        {
            //cout << "P["<<i<<"]="<<p[i] <<endl;
            pi +=p[i];
            //cout << "r=" <<r << ", pi="<<pi <<endl;
            if(r<=pi)
            {
                nums = i;
                break;
            }
        }
        return nums;
    }

    public:
    double mean;
    double ranNumber;
    
    RandomNumber()
    {
        rate = -1;
    }

    RandomNumber(double mean)
    {
        rate = 1/mean;
    }
    double getMean()
    {
        return mean;
    }
    double getRate()
    {
        return rate;
    }
    double getRandomExpo()
    {
        return GenExpo(rate);
    }
    int getNumbers(double p[],int size)
    {
        return chooseNumber(p,size);
    }

};
void sendingPacket(double n_sim, double meanTf,double meanTc,double ploss,int R, int L)
{
    RandomNumber r1(meanTf),r2(meanTc),choose;
    double pi[2];
    double tf=0,tc=0;
    int countR=0,countL=0;

    vector<int> ni;
    pi[0] = ploss;
    pi[1] = 1-ploss;
    double NfailureDetect =0;
    double NtrueDetect =0;
    int faildetect = 0;
    for(int i =0; i<n_sim;i++)
    {
        //cout << r1.getRandomExpo() <<endl;
        countR=0;
        faildetect = 0;
        tf = r1.getRandomExpo();
        if(DEBUG)
        {
            cout << "tf=" << tf << endl;
            cout << "==============================" << endl;
        }
        
        int m = 0;
        tc =0;
        do
        {
            
            countL=0;
            tc+=r2.getRandomExpo();
            if(tc<tf)
            {
                if(DEBUG)
                {
                    cout << "Packet-"<<m+1<<"th=" << tc;
                }
                
                int sendpacket = choose.getNumbers(pi,2);
                // check acknowledgement
                if(!sendpacket) // send fail ~
                {
                    if(DEBUG)
                    {
                        cout << " 1st: fail ";
                    }
                    countL++;
                    if(L>1)
                    {
                        for(int ll=1;ll<=L;ll++)
                        {
                            //cout << "countL =" <<  countL << endl;
                            sendpacket = choose.getNumbers(pi,2);
                            if(!sendpacket)
                            {
                                countL++;
                                //cout << "countL =" <<  countL << endl;
                                if(DEBUG)
                                {
                                    cout << (ll+1)  << "-th fail ";
                                }
                                if(countL==L){
                                    break;
                                }
                            }
                            else
                            {
                                if(DEBUG)
                                {
                                    cout << (ll+1)  << "-th success ";
                                }
                                //cout << " Fuck " <<endl;
                                countL = 0;
                                countR = 0;
                                break;
                            }
                        } 
                    }
                    //cout << " countL=" << countL << " & L=" << L<<endl;
                    if(countL == L)
                    {
                        //check Repeat
                        countR++;
                        if(DEBUG)
                        {
                            cout << " R="<< countR;
                        }
                        if(countR==R){
                            if(DEBUG)
                            {
                                cout << " : Failure Detected!" ;
                                cout<<endl;
                            }
                            if(faildetect==0)
                            {
                                NfailureDetect++;
                                faildetect++;
                            }
                            
                            //break;
                        }

                        if(DEBUG)
                        {
                            cout<<endl;
                        }
                    }
                    else
                    {
                        if(DEBUG)
                        {
                            cout << endl;
                        }
                        countR=0;
                    }
                                   
                }
                else
                {
                    if(DEBUG)
                    {
                        cout << endl;
                    }
                    countR=0;
                }

                
            }
            else
            {
                if(faildetect==0){
                    NtrueDetect++;
                    break;
                }
                
            }
            m++;          
        }while(tc<tf);
        ni.push_back(m);
        if(DEBUG)
        {
            cout << "==============================" << endl;
        }
    }
    //cout << ni.size()<<endl;
    int sumn = 0;
    for(int i=0;i<ni.size();i++)
    {
        sumn += ni[i];
        //cout << "ni=" << ni[i] << endl;
    }
    if(1)
    {
        cout << "N[True failure detected]=" << NtrueDetect <<endl;
        cout << "N[False failure detected]=" << NfailureDetect <<endl;  
        cout << "P[True failure detected] = " << NtrueDetect/n_sim <<endl;
        cout << "P[False failure detected] = " << NfailureDetect/n_sim <<endl;
        cout << "Average  sending Packet E[n] : " << (double)sumn/(double)ni.size() <<endl;
    }
    
}
int main(int argc, char *argv[]) {
    
    int N_sim = 100000;

    double tf = 500;
    double tc = 50;
    double ploss = 0.1;
    int round = 2;
    int attempt = 1;
    

    sendingPacket(N_sim,tf,tc,ploss,round,attempt);
    cout << "printf" <<endl;
}