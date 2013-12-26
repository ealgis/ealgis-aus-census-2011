#!/bin/bash

if [ ! -d "2011 Datapacks BCP_IP_TSP_PEP_ECP_WPP_ERP_Release 3" ]; then
    if [ ! -f '2011 Datapacks BCP_IP_TSP_PEP_ECP_WPP_ERP_Release 3.7z' ]; then
        wget -O datapacks.tmp https://dl.dropboxusercontent.com/u/10671102/census/2011%20Datapacks%20BCP_IP_TSP_PEP_ECP_WPP_ERP_Release%203.7z &&
            mv datapacks.tmp '2011 Datapacks BCP_IP_TSP_PEP_ECP_WPP_ERP_Release 3.7z'
    fi
    7zr x '2011 Datapacks BCP_IP_TSP_PEP_ECP_WPP_ERP_Release 3.7z'
fi

echo "loading the 2011 Australian Census"
ealgis set projected_srid 3112 && 
ealgis set map_srid 3857 && 
ealgis run aus_census_2011.py
echo 'VACUUM ANALYZE;' | psql ealgis

