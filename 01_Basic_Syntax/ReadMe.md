# 📚 ABAP 기초 문법 (Basic Syntax) 실습

ABAP 개발의 가장 기본이 되는 변수 선언, 데이터 출력, 그리고 기초 연산 방식을 학습한 기록입니다.

## ✍️ 학습 내용
- **DATA 선언**: 변수 타입(String, I, P 등)의 이해와 초기값 할당 방법 학습
- **WRITE 구문**: 데이터를 화면에 출력하고 `COLOR`, `ULINE`, `SY-VLINE` 등을 활용한 리포트 디자인
- **산술 연산**: 기본적인 사칙연산 처리 및 결과값 핸들링
- **조건문 (IF...ELSE)**: 논리 조건에 따른 로직 분기 처리 기초 습득


## 🔗 SE80 화면
<img width="1485" height="965" alt="BasicCalCCode" src="https://github.com/user-attachments/assets/4865216d-803b-47cf-815b-225bb2bdeba8" />


## 🖼 실행 결과
<img width="1485" height="965" alt="BasicCalCResult" src="https://github.com/user-attachments/assets/8224e0da-22ff-4581-bc42-8f4c5df3ef4c" />

## ABAP 코드 전문
REPORT Z_BASIC_CALC_YOUTAEK.

* 1. 데이터 선언 (Data Declaration)
DATA: lv_name  TYPE string VALUE 'YOUTAEK',
      lv_val1  TYPE i      VALUE 100,
      lv_val2  TYPE i      VALUE 50,
      lv_res   TYPE i.

* 2. 산술 연산 (Arithmetic Operation)
lv_res = lv_val1 + lv_val2.

* 3. 화면 출력 (Basic Output)
WRITE: 'Hello, SAP World! I am', lv_name COLOR 4.
ULINE.
WRITE: / 'Value 1  :', lv_val1,
       / 'Value 2  :', lv_val2,
       / 'Total    :', lv_res COLOR 3.

* 4. 조건문 맛보기 (IF Statement)
IF lv_res >= 100.
  WRITE: / 'Result is over 100.' COLOR 5.
ELSE.
  WRITE: / 'Result is under 100.' COLOR 6.
ENDIF.
