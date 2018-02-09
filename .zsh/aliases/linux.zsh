# various handy utils
alias diskusage='iostat -d 2 -m'
alias diskdropcache='free && sync && echo 3 > /proc/sys/vm/drop_caches && free'
