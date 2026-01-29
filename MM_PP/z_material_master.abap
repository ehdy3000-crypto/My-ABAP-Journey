REPORT z_material_master.

DATA: gt_matt TYPE TABLE OF zmatt_t,
      gs_matt TYPE zmatt_t.

* 1. 샘플 데이터 생성 
gs_matt-mandt = sy-mandt.
gs_matt-matnr = 'APP-002'.
gs_matt-maktx = 'iPhone 17 Pro Max Case'.
gs_matt-meins = 'EA'.
gs_matt-matkl = 'PRM'.
gs_matt-ersda = sy-datum.
gs_matt-ernam = 'YOU_TAEK'.

* DB에 데이터 넣기
MODIFY zmatt_t FROM gs_matt.

* 2. 데이터 조회
CLEAR gt_matt.
SELECT * FROM zmatt_t
  INTO TABLE gt_matt.

* 3. 결과 출력 
WRITE: / '--- [MM/PP] 자재 마스터 조회 결과 ---' COLOR 1.
ULINE.

IF sy-subrc = 0.
  LOOP AT gt_matt INTO gs_matt.
    WRITE: / sy-vline,
             (10) gs_matt-matnr, sy-vline,
             (20) gs_matt-maktx, sy-vline,
             (05) gs_matt-meins, sy-vline,
             (10) gs_matt-ersda, sy-vline,
             (10) gs_matt-ernam, sy-vline.
  ENDLOOP.
  ULINE.
ELSE.
  WRITE: '데이터가 없습니다.' COLOR 6.
ENDIF.
