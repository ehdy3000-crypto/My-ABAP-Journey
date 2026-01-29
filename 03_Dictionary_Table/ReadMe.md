# 📚 학생 관리 테이블 (Dictionary Table) 설계 및 활용

SAP Data Dictionary(SE11)를 통해 직접 DB 테이블을 설계하고, ABAP 프로그램을 이용해 데이터를 영구적으로 저장하는 로직을 실습했습니다.

## ✍️ 학습 내용
- **SE11 Table Creation**: `MANDT`를 포함한 Key 필드 설정 및 기술적 속성(Technical Settings) 정의
- **Data Element & Domain**: 데이터의 기술적 특성과 의미적 특성을 분리하여 관리하는 개념 이해
- **Open SQL (MODIFY)**: 인터널 테이블의 데이터를 실제 DB 테이블(`ZSTUDENT_T`)에 일괄 저장하는 로직 구현
- **Transaction Control**: `COMMIT WORK`와 `ROLLBACK WORK`를 통한 데이터 무결성 관리

## 🔗 SE11 테이블 구조
<img width="1485" height="965" alt="Student TableInfo_SE11_1" src="https://github.com/user-attachments/assets/23ecaac6-fb4e-4fdb-b85b-aa5db6b871ca" />

## 🔗 SE80 화면
<img width="1485" height="965" alt="Student Table_SE80" src="https://github.com/user-attachments/assets/d4651f3e-b248-4d1d-9fb9-0b0beb4a87b8" />
<img width="1485" height="965" alt="Student Table_SE80_Result" src="https://github.com/user-attachments/assets/64133446-09f0-40b7-a4b5-00b4e0362068" />

## 🖼 실행 결과 (SE16)
<img width="1485" height="965" alt="Student TableInfo_SE16" src="https://github.com/user-attachments/assets/0c49c9e1-e1db-4566-9f8f-09564fab38b5" />

## 💻 ABAP 코드 전문
```abap
REPORT Z_SAVE_STUDENTS_YOUTAEK.

DATA: gt_student TYPE TABLE OF zstudent_t,
      gs_student TYPE zstudent_t.

* 1. 데이터 준비 
APPEND VALUE #( mandt = sy-mandt stu_id = '20260001' stu_name = 'YOUTAEK'   stu_age = 25 stu_dept = 'ABAP' ) TO gt_student.
APPEND VALUE #( mandt = sy-mandt stu_id = '20260002' stu_name = 'HYUNWOONG' stu_age = 26 stu_dept = 'MM'   ) TO gt_student.
APPEND VALUE #( mandt = sy-mandt stu_id = '20260003' stu_name = 'JEYOUNG'   stu_age = 24 stu_dept = 'PP'   ) TO gt_student.
APPEND VALUE #( mandt = sy-mandt stu_id = '20260004' stu_name = 'DOKYUNG'   stu_age = 27 stu_dept = 'FI'   ) TO gt_student.
APPEND VALUE #( mandt = sy-mandt stu_id = '20260005' stu_name = 'KYEONGMIN' stu_age = 25 stu_dept = 'SD'   ) TO gt_student.
APPEND VALUE #( mandt = sy-mandt stu_id = '20260006' stu_name = 'CHANYOUNG' stu_age = 26 stu_dept = 'BC'   ) TO gt_student.

* 2. DB 테이블에 데이터 반영 
MODIFY zstudent_t FROM TABLE gt_student.

IF sy-subrc = 0.
  WRITE: '성공적으로 DB에 저장되었습니다!' COLOR 5.
  COMMIT WORK. " 확정
ELSE.
  WRITE: '데이터 저장 실패' COLOR 6.
  ROLLBACK WORK. " 취소
ENDIF.
