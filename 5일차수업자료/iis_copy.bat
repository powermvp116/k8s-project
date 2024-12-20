echo "디렉터리를 생성합니다."
mkdir c:\inetpub\wwwroot\sales.studykorea.kr
mkdir c:\inetpub\wwwroot\tech.studykorea.kr
mkdir c:\inetpub\wwwroot\www.studykorea.kr

echo "html 파일을 복사합니다."
copy sales_index.htm c:\inetpub\wwwroot\sales.studykorea.kr\index.htm
copy tech_index.htm c:\inetpub\wwwroot\tech.studykorea.kr\index.htm
copy www_index.htm c:\inetpub\wwwroot\www.studykorea.kr\index.htm

echo "파일이 복사 되었는지 확인하세요."
c:
cd c:\inetpub\wwwroot\
dir
dir sales.studykorea.kr
pause "wait..."