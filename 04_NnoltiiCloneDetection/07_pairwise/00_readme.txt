check Nsh > 3000.
NhomoDiff, SH

cat /Users/lyu/projectZJ_final_v2/01_ncAnalyses/02_ZNgenotype/07_pairwise/01_pairwise/00_results/*_pairwise.txt >00_results.txt
(base) ev-nb026mc:00_results lyu$ head -1 00_results.txt >header.txt
(base) ev-nb026mc:00_results lyu$ cat 00_results.txt | awk '!/^Sample/' >contents.txt
(base) ev-nb026mc:00_results lyu$ cat header.txt contents.txt >01_results_ready.txt
(base) ev-nb026mc:00_results lyu$ rm ./header.txt 
(base) ev-nb026mc:00_results lyu$ rm ./contents.txt 
(base) ev-nb026mc:02_count lyu$ rm ./00_results.txt
