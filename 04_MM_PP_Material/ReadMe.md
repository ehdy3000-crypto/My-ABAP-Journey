# 📦 MM/PP 자재 마스터(Material Master) 설계 및 관리

SAP의 핵심 모듈인 MM(자재관리)과 PP(생산관리)에서 사용되는 자재 마스터 데이터를 직접 설계하고, 관리 프로그램을 구현한 실습 기록입니다.

## ✍️ 학습 내용
- **Material Table 설계**: 실무 표준(MARA)을 참고하여 `MATNR`(Key), `MAKTX`, `MATKL`, `MEINS` 등 필수 자재 필드 정의
- **Domain & Data Element**: 자재 번호 및 자재 그룹 등에 대한 기술적 속성 정의 및 재사용성 확보
- **Data Handling**: `MODIFY` 구문을 사용하여 자재 정보의 신규 등록 및 기존 정보 업데이트 로직 구현
- **Report UI**: `COLOR`, `ULINE` 등을 활용하여 자재 리스트를 시각적으로 구분하기 쉬운 리포트 화면 구성

## 🔗 SE11 테이블 구조
<img width="1485" height="965" alt="MM Tableinfo_SE11" src="https://github.com/user-attachments/assets/e1105567-e4f4-4621-8255-dfc3050fabe4" />

## 🔗 SE80 화면
<img width="1485" height="965" alt="MM Code _SE80" src="https://github.com/user-attachments/assets/80995d0d-2033-4ae2-8ce8-f8f2cca8b7e1" />
<img width="1485" height="965" alt="MM Code _SE80_2" src="https://github.com/user-attachments/assets/9027db59-1d1d-4e5d-8ce8-61813d65f1d9" />
<img width="1485" height="965" alt="MM Code Result" src="https://github.com/user-attachments/assets/634320e5-be13-400b-a346-6de6d40ad5fa" />

## 🖼 실행 결과 (SE16)
<img width="1485" height="965" alt="MM Table Contents_SE16" src="https://github.com/user-attachments/assets/eae770cd-fa1c-4ffe-b2f4-02a82b52f03b" />

## 💻 ABAP 코드 전문
```abap
REPORT Z_MATERIAL_MASTER_YOUTAEK.

* 1. 데이터 선언
DATA: gt_mat TYPE TABLE OF zmatt_t,
      gs_mat TYPE zmatt_t.

* 2. 자재 데이터 준비 (YOUTAEK의 실습 데이터)
APPEND VALUE #( mandt = sy-mandt matnr = 'APP-001' maktx = 'iPhone 15' matkl = 'ELEC' meins = 'EA' ) TO gt_mat.
APPEND VALUE #( mandt = sy-mandt matnr = 'APP-002' maktx = 'MacBook Pro' matkl = 'ELEC' meins = 'EA' ) TO gt_mat.

* 3. DB 테이블 반영
MODIFY zmatt_t FROM TABLE gt_mat.

IF sy-subrc = 0.
  WRITE: '자재 마스터 데이터가 성공적으로 반영되었습니다.' COLOR 5.
  COMMIT WORK.
ELSE.
  WRITE: '데이터 반영 실패' COLOR 6.
  ROLLBACK WORK.
ENDIF.

* 4. 데이터 확인 출력
ULINE.
WRITE: /(15) 'Material No', (30) 'Description', (10) 'Group'.
ULINE.

LOOP AT gt_mat INTO gs_mat.
  WRITE: / gs_mat-matnr, gs_mat-maktx, gs_mat-matkl.
ENDLOOP.
