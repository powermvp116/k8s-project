echo "���͸��� �����մϴ�."
mkdir c:\inetpub\wwwroot\sales.studykorea.kr
mkdir c:\inetpub\wwwroot\tech.studykorea.kr
mkdir c:\inetpub\wwwroot\www.studykorea.kr

echo "html ������ �����մϴ�."
copy sales_index.htm c:\inetpub\wwwroot\sales.studykorea.kr\index.htm
copy tech_index.htm c:\inetpub\wwwroot\tech.studykorea.kr\index.htm
copy www_index.htm c:\inetpub\wwwroot\www.studykorea.kr\index.htm

echo "������ ���� �Ǿ����� Ȯ���ϼ���."
c:
cd c:\inetpub\wwwroot\
dir
dir sales.studykorea.kr
pause "wait..."