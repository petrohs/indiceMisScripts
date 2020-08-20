#!/bin/bash
ayuda() { echo '                                                               
                      * carga gist *
 DESCRIPCION:  Carga scripts al gist

         USO:  cargaGist /ruta/archivo.bash ["descripcion del proceso" [00.01]] 
               cargaGist [-h|-?|--help|--ayuda] [-v]
    OPCIONES:  /ruta    Ruta y nombre del script
               desc     Descripcion breve del proceso
	       00.01    version
               -h       Ayuda
               -v       Version 
               --docu   Leer la documentacion incluida.t2t
DEPENDENCIAS:  gist-paste
        BUGS:  ---
       NOTAS:  ---
   VERSIONES:  20200819   0.0.2    petrohs/   Ajuste.
               20200819   0.0.1    petrohs/   Creacion.
         URL:  https://github.com/petrohs/indiceMisScripts/blob/master/cargaGist.bash
';}

#ayuda y version
 if [[ "$1" = "" ]] || [[ "$1" = "-h" ]] || [[ "$1" = "--help" ]] || [[ "$1" = "-?" ]] || [[ "$1" = "--ayuda" ]]; then ayuda; exit 1;
 elif [[ "$1" = "--docu" ]]; then sed -n $(($(grep -En "^-{80}ð" ${0} | cut -d: -f1) + 1)),$(cat ${0}|wc -l)p ${0} | less; exit 1;
 elif [[ "$1" = "-v" ]] || [[ "$1" = "--version" ]]; then ayuda | grep VERSIONES | cut -d: -f2 | cut -d/ -f1; exit 1; fi;

##
 cArch="${1}";
 cDesc="${2}";
 if [[ -z "${3}" ]]; then cVers="00.00.01"; else cVers="${3}"; fi;
 bArch="$(basename ${cArch})";
 aArch="${bArch%.*}";

 #liga=$(gist-paste -o -d "${aArch}¦ ${cDesc}" -f "${bArch}" "${cArch}");
 liga=$(gist-paste -d "${aArch}¦ ${cDesc}" -f "${bArch}" "${cArch}");
 echo "* [${bArch}](${liga})_(v${cVers})_ ${cDesc}." >> README.md

#Ser cultos para ser libres 
 exit 0;	   
 
--------------------------------------------------------------------------------ðtxt2tags,20200819,0.0.1 de 0.0.1
%ejecutar utileria «extraerDocuFinalDeScript.bash»

= cargaGist =
El script **«cargaGist»** en su version __0.0.1__ sube a gist.github el script 
indicado, usando la descripción y se actualiza el indice en el readme.md
 

