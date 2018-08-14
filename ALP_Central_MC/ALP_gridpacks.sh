#!/usr/bin/expect -f

set timeout 86400
set Pass "XXXXX"
set RSAkey "XXXXX"
set ALPmassName [list 0p9 0p8 0p7 0p6 0p5]
set ALPmassValue [list 9.000000e-01 8.000000e-01 7.000000e-01 6.000000e-01 5.000000e-01]
################
spawn ssh -X -Y wshi@lxplus.cern.ch
expect "Password: "
send "$Pass\r"
expect "$ "
send "tmux\r"
expect "$ "

for { set m 0 } { $m < [llength $ALPmassName] } { incr m } {

set ALPMASSNAME [lindex $ALPmassName $m]
set ALPMASSVALUE [lindex $ALPmassValue $m]

send "cd /afs/cern.ch/work/w/wshi/public\r"
expect "$ "
send "rm -rf gridpack$ALPMASSNAME\r"
expect "$ "
sleep 2
send "mkdir gridpack$ALPMASSNAME\r"
expect "$ "
send "cd gridpack$ALPMASSNAME\r"
expect "$ "
send "git clone git@github.com:cms-sw/genproductions.git genproductions\r"
expect "Enter passphrase for key '/afs/cern.ch/user/w/wshi/.ssh/id_rsa': "
send "$RSAkey\r"
expect "$ "
send "cd genproductions/bin/MadGraph5_aMCatNLO/cards/production/2017/13TeV/ALP\r"
expect "$ "
#paramter card
send "sed -i '1s/1.000000e+00/$ALPMASSVALUE/' ALP_customizecards.dat\r"
expect "$ "

send "cd ../../../../..\r"
expect "$ "
send "rm gridpack_generation.sh\r"
expect "$ "
send "wget https://raw.githubusercontent.com/weishi10141993/ALP/master/ALP_Central_MC/gridpack_generation.sh\r"
expect "$ "
send "chmod a+x gridpack_generation.sh\r"
expect "$ "
send "./gridpack_generation.sh ALP cards/production/2017/13TeV/ALP\r"
expect "$ "
sleep 2
send "mv ALP_slc6_amd64_gcc481_CMSSW_7_1_30_tarball.tar.xz /afs/cern.ch/work/w/wshi/public/ALP_MH_125_MALP_$ALPMASSNAME\_slc6_amd64_gcc481_CMSSW_7_1_30_tarball.tar.xz\r"
expect "$ "

#end ALP mass
}

send "exit\r"
expect "$ "
