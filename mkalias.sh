#!/bin/bash 
#-x

usage() { 
	echo "#############################################################################"
	echo "#  Usage for mkalias or however you call this script. 	                    #"
	echo "#############################################################################"
	echo ""
	echo " gen    -generates an alias  mkalias gen \"aliasname\" \"command\" \"description\""
	echo " rem    -removes an alias    mkalias rem \"aliasname\"			       "
	echo " show   -shows an alias      mkalias show \"aliasname\"			       "
}

generate() {
	echo "alias $2='$3' # $4" >> ~/.bash_aliases
	echo "source ~/bash_aliases"
	exit 0
	}

show() {
	if [[ $2 ]]; then
		grep $2 ~/.bash_aliases
	else
		cat ~/.bash_aliases
	fi
}

remove() {
	grep $2 ~/.bash_aliases
	sed -i /$2/d  ~/.bash_aliases

}


case "$1" in 
   gen)
      generate "$1" "$2" "$3" "$4"
      ;;
   show)
      show "$1" "$2"
      ;;
   rem)
      remove "$1" "$2"
      ;;
   *)
    usage
    RETVAL=1
esac

exit $RETVAL
