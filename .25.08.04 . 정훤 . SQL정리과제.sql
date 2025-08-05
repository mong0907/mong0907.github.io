-- 오늘의 문제
-- 1. student 중 kor 와 eng 점수만 출력하시오
SELECT NAME AS '이름' ,kor AS '국어', eng AS '영어' FROM student;

-- 2. student 중 average가 90점 이상인 사람의 name,schoolname을 출력하시오
SELECT  st.NAME AS '이름', sc.schoolname AS '학교명'  FROM student st INNER JOIN school sc ON st.schoolcode = sc.schoolcode WHERE st.average >=90;

-- 3. student 중 eng 점수를 출력하되 그 이름을 '영어'로 하시오
SELECT NAME AS '이름', eng AS '영어' FROM student;

-- 4. 이름 가운데 자가 '공'인 사람을 모두 출력하시오
SELECT * FROM student WHERE NAME LIKE '%공%';

-- 5. 학교 이름이 충주여자고등학교인 사람의 name,total을 출력하시오
SELECT  sc.schoolname AS '학교명', st.NAME AS '이름', st.total AS '총점' FROM student st INNER JOIN school sc ON st.schoolcode = sc.schoolcode WHERE sc.schoolname = '충주여자고등학교';

-- 6. student 에서 total을 이용하여 정렬하고 성적우수자 2명만 출력하시오
SELECT NAME AS '이름' , total AS '총점'  FROM student ORDER BY total DESC  LIMIT 2;

-- 7. 학교 이름을 출력하고 학생들의 이름,총점,평균,학점을 입력된 국어 영어 수학 점수로부터 계산해서 출력하시오
SELECT  sc.schoolname AS '학교명', st.name AS '학생명' , sum(ifnull(st.kor,0)+ifnull(st.math,0)+ifnull(st.eng,0)) AS '총점', round(sum(ifnull(st.kor,0)+ifnull(st.math,0)+ifnull(st.eng,0))/3,2)AS '평균',
(if(round(sum(ifnull(st.kor,0)+ifnull(st.math,0)+ifnull(st.eng,0))/3,2)>=90,'A',
 if(round(sum(ifnull(st.kor,0)+ifnull(st.math,0)+ifnull(st.eng,0))/3,2)>=80,'B',
 if(round(sum(ifnull(st.kor,0)+ifnull(st.math,0)+ifnull(st.eng,0))/3,2)>=70,'C',
 if(round(sum(ifnull(st.kor,0)+ifnull(st.math,0)+ifnull(st.eng,0))/3,2)>=60,'D',
 'F'))))) AS '등급'
 FROM student st INNER JOIN school sc ON st.schoolcode = sc.schoolcode GROUP BY st.name;