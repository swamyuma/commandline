# functions to be included in .bashrc

# get running job id's and sort it in reverse order
function sq() { showq| grep Running|awk '{ print $2}'| sort| uniq -c| sort -n -r; }

# get the count of state of nodes where jobs are running successfully 
function mrun() { mdiag -n | grep R| wc -l; }

# get the count of busy nodes
function mbusy() { mdiag -n | grep Busy| wc -l; }

# get the count of PBS jobs that are running
function qs() { qstat| grep [[:blank:]]R[[:blank:]]|wc -l; }

# get the node name of a specified job
function get_host() { qstat -f "$@" | grep exec_host | cut -d"=" -f2; }
