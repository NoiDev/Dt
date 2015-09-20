
# Reuseable component which resolves the path to and existance of the Dconfig.sh file.
#
# Scripts should allow users to pass in a path to a config file outside the current working
# directory by filling out the variable CONFIG_FILE_PATH, usually with $1, and should then source
# this file to handle the resolution.
# 
# Scripts are responsible for checking for the existance of the porperties they require within
# the Dconfig.sh file.

# Example Code:

#    # Get the path to the source file directory.
#    SOURCE_DIR="$(dirname "$(readlink "$0")")"
#
#    # Load the configuration file.
#    CONFIG_FILE_PATH=$1
#    . "$SOURCE_DIR/Dget_config.sh"
#
#    # Confirm the existance of the desired properties.
#    if [ -z "$D_SSH_HOST_URL" ] || [ -z "$D_SSH_HOST_NAME" ]
#    then
#        echo "Invalid Configuration File: $CONFIG_FILE_PATH"
#        echo 'Exiting...'
#        exit 1;
#    fi


# echo 'Getting path to Dconfig...'

if [ -z "$CONFIG_FILE_PATH" ]
then
    CONFIG_FILE_PATH="$PWD/Dconfig.sh"
elif [ -d $CONFIG_FILE_PATH ]
then
    CONFIG_FILE_PATH+='Dconfig.sh'
elif [ ! -f $CONFIG_FILE_PATH ]
then 
    echo "Invalid path to Dconfig.sh: $CONFIG_FILE_PATH"
    echo 'Exiting...'
    exit 1;
fi


#echo 'Looking for Dconfig...'

if [ ! -f "$CONFIG_FILE_PATH" ]
then
    echo "Dconfig.sh not found at path: $CONFIG_FILE_PATH"
    echo 'Exiting...'
    exit 1;
fi


#echo 'Loading settings from Dconfig.sh...'

. "$CONFIG_FILE_PATH"
