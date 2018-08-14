# ALP Private MC in MG5
Be sure to cite the [ALP paper](https://arxiv.org/pdf/1708.00443.pdf).
The recipe below is similar to [MSSMD recipe](https://github.com/weishi10141993/DarkSUSY_MC_MG5/blob/master/README.md).

## Create a directory and upload the package to the directory

    mkdir ~/MadGraph5
    cd ~/MadGraph5
    #cp /afs/cern.ch/cms/generators/www/MG5_aMC_v2.6.1.tar.gz ./
    cp /afs/cern.ch/cms/generators/www/MG5_aMC_v2.4.2.tar.gz ./
    #tar -xzf MG5_aMC_v2.6.1.tar.gz
    tar -xzf MG5_aMC_v2.4.2.tar.gz

## Get UFO model 
Go to the folder `MG5_aMC_vXXX/models`. Copy the UFO model there and unzip it to folder `ALP`:

    wget --no-check-certificate https://github.com/weishi10141993/ALP/raw/master/ALP.tar.gz
    tar xavf ALP.tar.gz
    
## Set up processes
Copy the proc_card.dat to directory `MG5_aMC_vXXX`:
    
    rm proc_card.dat 
    wget https://raw.githubusercontent.com/weishi10141993/ALP/master/proc_card.dat
    
Run `./bin/mg5_aMC proc_card.dat` and a folder called `ALP` will be generated. 

Then go to `ALP/Cards` folder and modify the ALP mass to '2.500000e-01'(0.25GeV) in the `param_card.dat`. To generate the events:

    cd ALP
    ./bin/generate_events

When the prompt shows `Do you want to edit a card (press enter to bypass editing)?`, type:

    set WALP auto

to enable automatic calculation of the ALP width for the required couplings. A `lhe.gz` file will be generated under `ALP/Events/run_01` directory.

Unzip the file to get the .lhe file:

    gunzip -d *.lhe.gz
    
To validate the LHE file, use:

    wget https://raw.githubusercontent.com/weishi10141993/ALP/master/LHE_read.py
    wget https://raw.githubusercontent.com/weishi10141993/DarkSUSY_MC_MG5/master/MSSMDarkSector/tdrStyle.py
    python LHE_read.py
