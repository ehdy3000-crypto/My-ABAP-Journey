이 폴더는 SAP의 핵심 모듈인 MM(자재관리)과 PP(생산관리)에서 사용하는 자재 마스터 데이터를 직접 설계하고 구현한 내용을 담고 있습니다.

## 🛠 실습 내용
1. **테이블 설계 (`ZMATT_T`)**: 실무 표준인 `MANDT`, `MATNR` 등을 활용한 구조 설계
2. **데이터 핸들링**: `MODIFY` 구문을 통한 데이터 생성 및 업데이트 로직 구현
3. **리포트 출력**: `WRITE` 문과 디자인 명령어(`COLOR`, `ULINE` 등)를 활용한 결과 화면 구성

## 📸 실행 화면

### 1. 테이블 구조 (SE11)
<img width="1485" height="965" alt="20260129 TableInfo" src="https://github.com/user-attachments/assets/73b7b5fd-32a0-47ab-a4c0-5dfac9d73cb7" />
<img width="1485" height="965" alt="20260129 TableContents" src="https://github.com/user-attachments/assets/7ed93f1e-a7a5-43e3-97b9-b02908078236" />


### 2. 데이터 추가 및 조회 결과 (SE80)
<img width="1485" height="965" alt="20260129 CodeInfo" src="https://github.com/user-attachments/assets/446884c2-0827-4812-82ef-a6c1c489b698" />


## 🔗 관련 파일
- [ABAP 소스 코드](./z_material_master.abap)
