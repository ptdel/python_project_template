#!/usr/bin/env bash

read -r -d '' usage <<-'EOF'
     usage: ./start [-h] -e <email> -p <proj> -d "<desc>" -k "<keywords>"\n\n

     Turn this repository into a new Python project.\n\n

     positional arguments:\n
       -e the developer's email\n
       -p the name to give the project.\n
       -d a one-sentence description of the project. (in quotes!)\n
       -k a few keywords about the project.          (in quotes!)\n

     optional arguments:\n
       -h show this help message and exit.\n\n
EOF

read -r -d '' warning <<-'EOF'
Running this script will make permanent changes to this repository.\n\n
EOF

# root directory of the repository.
topdir=$(git rev-parse --show-toplevel)

# gather arguments with getopts.
while getopts ":e:p:d:k:h:" opt; do
  case ${opt} in
    e)
      dev=$OPTARG
      ;;
    p)
      name=$OPTARG
      ;;
    d)
      desc=$OPTARG
      ;;
    k)
      keywords=$OPTARG
      ;;
    h)
	echo -ne $usage
      ;;
    \?)
	echo "Invalid Option: -$OPTARG" 1>&2
	echo -ne $usage
	exit 1
      ;;
    : )
	echo "Invalid Option: -$OPTARG requires an argument" 1>&2
	echo -ne $usage
	exit 1
      ;;
  esac
done

echo -ne $warning
read -p "Continue? (y\n):" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # change into repository root.
    cd $topdir

    echo " - Deleting .git, and re-initializing."
    rm -rf .git/ && git init .

    echo " - Overwriting setup.py"

    if [ ! -z "$dev" ]; then
	sed -e "s/PROJ_DEV/${dev}/g" setup.py > setup.py.bak
	mv setup.py.bak setup.py
    else
	echo "Needs a developer email address."
	exit 1
    fi

    if [ ! -z "$name" ]; then
	sed -e "s/PROJ_NAME/${name}/g" setup.py > setup.py.bak
	sed -e "s/PROJ_NAME/${name}/g" MANIFEST.in > MANIFEST.in.bak
	sed -e "s/PROJ_NAME/${name}/g" tox.ini > tox.ini.bak
	mv setup.py.bak setup.py
	mv MANIFEST.in.bak MANIFEST.in
	mv tox.ini.bak tox.ini
    else
	echo "Needs a project name."
	exit 1
    fi

    if [ ! -z "$desc" ]; then
	sed -e "s/PROJ_DESC/${desc}/g" setup.py > setup.py.bak
	mv setup.py.bak setup.py
    else
	echo "Needs a one-sentence description."
	exit 1
    fi

    if [ ! -z "$keywords" ]; then
	sed -e "s/PROJ_KW/${keywords}/g" setup.py > setup.py.bak
	mv setup.py.bak setup.py
    else
	echo "Needs some keywords."
	exit 1
    fi

    echo " - Overwriting README.md (make sure to write one.)"
    echo "# ${name}" > README.md

    echo " - Renaming the project/ directory."
    mv $topdir/PROJ_NAME $topdir/$name
fi
