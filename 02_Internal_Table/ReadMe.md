# 📚 인터널 테이블 심화 (Internal Table Advanced) 실습

프로그램 내에서 다건의 데이터를 동적으로 핸들링하고, 정렬(Sort) 및 통계(Total/Avg) 산출 로직을 실습한 기록입니다.

## ✍️ 학습 내용
- **VALUE # 문법**: 신규 문법(Inline Declaration)을 활용하여 구조체 거치지 않고 효율적으로 데이터를 `APPEND` 하는 방법 숙지
- **SORT**: `BY score DESCENDING` 구문을 이용한 데이터 정렬 처리
- **CASE ... ENDCASE**: 다중 조건문으로 점수대별 로직 분기 및 리포트 색상(COLOR) 제어
- **READ TABLE**: 특정 조건을 만족하는 데이터를 인터널 테이블에서 검색하고 결과(`SY-SUBRC`)를 확인하는 로직 구현
- **Aggregate Logic**: 데이터의 개수(`lines`)와 합계를 이용한 평균값 산출

## 🔗 SE80 화면
<img width="1485" height="965" alt="itab Code 1" src="https://github.com/user-attachments/assets/ccf837c9-7bd7-43da-818c-a9e06a15b97f" />
<img width="1485" height="965" alt="itab Code 2" src="https://github.com/user-attachments/assets/f4bd33f4-a126-41de-a870-2874ca994fa7" />


## 🖼 실행 결과
<img width="1485" height="965" alt="itab Result" src="https://github.com/user-attachments/assets/14c6a7aa-b506-4f4b-b4c2-17d3423e2046" />

## 💻 ABAP 코드 전문
```abap
REPORT Z_ITAB_ADVANCED_YOUTAEK.

* 1. 구조체 및 인터널 테이블 선언
TYPES: BEGIN OF ty_data,
         id    TYPE n LENGTH 4,
         name  TYPE string,
         score TYPE i,
       END OF ty_data.

DATA: gt_student TYPE TABLE OF ty_data,
      gs_student TYPE ty_data,
      lv_total   TYPE i,
      lv_avg     TYPE p DECIMALS 2.

* 2. 데이터 추가 (APPEND) - YOUTAEK과 친구들
APPEND VALUE #( id = '0001' name = 'YOUTAEK'   score = 100 ) TO gt_student.
APPEND VALUE #( id = '0002' name = 'HYUNWOONG' score = 90 )  TO gt_student.
APPEND VALUE #( id = '0003' name = 'JEYOUNG'   score = 85 )  TO gt_student.
APPEND VALUE #( id = '0004' name = 'DOKYUNG'   score = 95 )  TO gt_student.
APPEND VALUE #( id = '0005' name = 'KYEONGMIN' score = 88 )  TO gt_student.
APPEND VALUE #( id = '0006' name = 'CHANYOUNG' score = 92 )  TO gt_student.

* 3. 데이터 정렬 (성적 높은 순서대로)
SORT gt_student BY score DESCENDING.

* 4. 데이터 조회 및 출력
WRITE: /(10) 'ID', (20) 'NAME', (10) 'SCORE' COLOR 1.
ULINE.

LOOP AT gt_student INTO gs_student.
  " 점수에 따라 색상 다르게 표시
  CASE gs_student-score.
    WHEN 100.
      WRITE: / gs_student-id, gs_student-name, gs_student-score COLOR 3. " Perfect
    WHEN 90 OR 92 OR 95.
      WRITE: / gs_student-id, gs_student-name, gs_student-score COLOR 5. " Great
    WHEN OTHERS.
      WRITE: / gs_student-id, gs_student-name, gs_student-score COLOR 2. " Good
  ENDCASE.
  
  lv_total = lv_total + gs_student-score.
ENDLOOP.

* 5. 전체 통계 출력
ULINE.
lv_avg = lv_total / lines( gt_student ).
WRITE: / 'Total Score:', lv_total COLOR 4,
       / 'Average:', lv_avg COLOR 4.

* 6. 특정 인물 검색 (READ TABLE 활용)
READ TABLE gt_student INTO gs_student WITH KEY name = 'HYUNWOONG'.
IF sy-subrc = 0.
  SKIP 1.
  WRITE: / '[Search Result] 현웅님은 현재 전체', sy-tabix, '위입니다.' COLOR 6.
ENDIF.
