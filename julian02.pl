#!/usr/bin/perl -w
##===================================================================================#
##
## SERVICE    : ITC/PRI/PIL
## APPLICATION:  
## VERSION    : V 1.0
## AUTEUR     : 
## DESCRIPTION: 
## FREQUENCE  :
##
##===================================================================================#
##
## Arguments  : 
##  - date du jour (SSAAMMJJ)
## 
##===================================================================================#
##
## Historique :
##   
##===================================================================================#

use strict;
use warnings;
use lib "$ENV{DATA_COMMON_NM}";
use SG_Interface;
use File::Path;

## 1. passage de parametres au script => s'il y en a, decommenter et adapter les lignes ci-dessous
# my $mode = $ARGV[0] || die "Parametre (mode) manquant: $?. Merci de le passer ('NORMA' / 'DEBUG').\n";

# 2. initialisations des chemins et variables utilises par l'executable cobrun
my $cmd_exe = "cobrun";
my $cmd_cat = "cat";

# ==> cette variable a adapter, liste les librairies dans l'ordre avec lequel cobrun doit trouver les fichiers .so
my $cobpath_list = "swift;std;stdgide";

my ($DATA_HOME,$cobpath,$ld_lib_path,$nm_default_param,$path_jv) = sg_init_procedure($0,$cobpath_list);

$ENV{'COBPATH'} = $cobpath;
$ENV{'LD_LIBRARY_PATH'} = $ld_lib_path.":".$ENV{'LD_LIBRARY_PATH'};
$ENV{'NM_DEFAULT_PARAMETERS'}= $nm_default_param."/natural.cfg";

# 3. reconstruction des chemins absolus des repertoires data, jv et logs => pointe vers la production
my $path_data = $DATA_HOME."/data/dflt";

# 4. gestion du code retour de chaque STEP
my $step_cod_ret = 0;

my @path_elements = split('/',$0);
my $script_name = $path_elements[$#path_elements];

my $cmd_pgm = "dacscls1.so";
my $cod_ret = system $cmd_exe." ".$cmd_pgm;

