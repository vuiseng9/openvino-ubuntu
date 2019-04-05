#!/usr/bin/env bash

# This scripts help to traverse through a directory recursively
# to locate Caffe models and
# generate corresponding Model Optimizer commandline to
# translate models to IR format

# e.g
# $ gen_mo_caffe . >> run_mo_caffe.sh
# Then set the variable at the beginning of the generated bash script

function gen_mo_caffe() {
for filepath in "$1"/*
do
    if [ ! -d "${filepath}" ] ; then
        if [[ $filepath == *.caffemodel ]]; then
            fullpath=$(realpath $filepath)
            fulldir=$(dirname ${fullpath})
            dir=$(dirname ${filepath})
            file=$(basename ${filepath})
            
            mdl=$file
            proto=$(basename ${file} .caffemodel).prototxt

            if [ -f $dir/$proto ]; then
                # echo "$dir; $mdl and $proto exists"
                printf "\noutdir=\$OUTROOT/$dir && mkdir -p \$outdir\n"
                printf "cd $fulldir && \\n\t python3 \$MO_SCRIPT --input_proto $proto --input_model $mdl --output_dir \$outdir\n"
            fi
        fi
    else
        #echo "entering recursion with: ${filepath}"
        gen_mo_caffe "${filepath}"
    fi
done
}

