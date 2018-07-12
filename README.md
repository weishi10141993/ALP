# ALP Private MC in MG5
Similar to [MSSMD recipe](https://github.com/weishi10141993/DarkSUSY_MC_MG5/blob/master/README.md).

## Create a directory and upload the package to the directory

    mkdir ~/MadGraph5
    cd ~/MadGraph5
    cp /afs/cern.ch/cms/generators/www/MG5_aMC_v2.6.1.tar.gz ./
    tar -xzf MG5_aMC_v2.6.1.tar.gz

## Get UFO model 
Go to the folder `MG5_aMC_v2_6_1/models`. Copy the UFO model there and unzip it to folder `MSSMD_UFO`:

    wget --no-check-certificate https://github.com/weishi10141993/ALP/raw/master/ALP.tar.gz
    tar xavf ALP.tar.gz
    
## Set up ggH processes
Copy the proc_card.dat to directory `MG5_aMC_v2_6_1`:
    
    wget 
    
Run `./bin/mg5_aMC proc_card.dat` and a folder called `ALP` will be generated. 