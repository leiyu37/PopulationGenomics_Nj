cat /gxfs_work/geomar/smomw353/zjspeciation/04_ncAnalyses/06_pairwise/*_pairwise.txt >00_combine.txt

head -1 00_combine.txt >header.txt
cat 00_combine.txt | awk '!/^Sample/' >contents.txt
cat header.txt contents.txt >01_results_ready.txt
rm ./header.txt 
rm ./contents.txt 

