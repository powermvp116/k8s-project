dsadd ou   "OU=서울본사,DC=studykorea,DC=kr"

dsadd group  "CN=사장,OU=서울본사,DC=studykorea,DC=kr"
dsadd group  "CN=부장,OU=서울본사,DC=studykorea,DC=kr"

dsadd group  "CN=기술부부장,OU=서울본사,DC=studykorea,DC=kr"
dsadd group  "CN=기술부사원,OU=서울본사,DC=studykorea,DC=kr"
dsadd group  "CN=영업부부장,OU=서울본사,DC=studykorea,DC=kr"
dsadd group  "CN=영업부사원,OU=서울본사,DC=studykorea,DC=kr"
dsadd group  "CN=총무부부장,OU=서울본사,DC=studykorea,DC=kr"
dsadd group  "CN=총무부사원,OU=서울본사,DC=studykorea,DC=kr"
dsadd group  "CN=회계부부장,OU=서울본사,DC=studykorea,DC=kr"
dsadd group  "CN=회계부사원,OU=서울본사,DC=studykorea,DC=kr"

dsadd group  "CN=서울전체사원,OU=서울본사,DC=studykorea,DC=kr" -memberof  "CN=기술부사원,OU=서울본사,DC=studykorea,DC=kr" "CN=영업부사원,OU=서울본사,DC=studykorea,DC=kr" "CN=총무부사원,OU=서울본사,DC=studykorea,DC=kr" "CN=회계부사원,OU=서울본사,DC=studykorea,DC=kr" "CN=사장,OU=서울본사,DC=studykorea,DC=kr" "CN=부장,OU=서울본사,DC=studykorea,DC=kr"