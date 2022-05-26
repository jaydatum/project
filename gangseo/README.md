# 강서구 빅데이터 활용 공모전 팀 프로젝트

[공모전 URL](https://www.gangseo.seoul.kr/gs040101/279539)  

[Notion 페이지](https://www.notion.so/03ee8005b9d14a5ab5af0a62f66a519f?v=cf5addc792714f3db63f1e46508cd28f)

## 0. 팀 프로젝트

- 주제 : 강서 WITH YOU : 강서구 1인 가구 종합 지원 서비스

- 기여도 : 25% (총원 4명)
- 담당 부분 : 기획, 데이터 수집, R을 활용한 통계적 검증, 데이터 모델링 : numpy를 활용한 추천시스템 알고리즘 구현

- 프로젝트 진행기간 : 2022/3/1 ~ 2022/3/24
- 결과 : 본선 진출 실패

## 1. 프로젝트 개요

- 주제 선정 : 강서구 1인 가구 종합 지원 서비스 

- 강서구 1인 가구 특성 분석

- 지역 추천 시스템
- 결과 분석 및 시사점
- 활용 방안



## 2. Workflow

- 주제선정 : 강서구 특성 분석 - 서울시 내 1인 가구 수 관악구에 이어 2위 

- 피처 선정

| 카테고리  |                          상세 내용                           |
| :-------: | :----------------------------------------------------------: |
|  가구 수  |                연령별 & 가구원 수 별 가구 수                 |
| 환경&문화 |               체육시설, 도서관, 문화시설, 공원               |
|   복지    |    장애인복지시설, 어르신 돌봄시설, 경로당, 사회복지시설     |
|   상권    | 전통시장, 백화점, 대형마트&슈퍼마켓, 편의점, 세탁소, 식당, 카페, 헬스클럽, 영화관 |
| 공공시설  | 구청/동주민센터/보건소, 공영주차장, 버스정류장, 공공자전거 대여소 |
| 안심&건강 |      파출소, 여성안심택배함, 심리상담센터, 병원, CCTV,       |
| 반려동물  |                  개 등록 수, 고양이 등록 수                  |
|  부동산   | 월세 & 전세 : 원룸, 투룸/쓰리룸, 오피스텔/도시형생활주택, 아파트 |

- 데이터 수집 : 공공데이터 포털, 네이버 지도, 강서구 테마지도, 다방 크롤링 등

- 데이터 전처리 : 카카오 맵 api를 통한 좌표 데이터 변환, 법정동에서 행정동 기준으로 데이터 취합

- 1인 가구 특성 분석 💡

  - 피처들 간 상관 분석 : 상관 행렬

  ![상관 행렬](https://user-images.githubusercontent.com/98443610/170006742-0a5114a7-be17-434f-889a-a6ae3815ec94.png)

  - R 활용 상관관계 분석 및 유의성 검정

  ![상관 분석_r](https://user-images.githubusercontent.com/98443610/170007231-3d43cdb6-15b4-4133-a3f1-f9a1b76247c2.png)
  ![유의성 검정](https://user-images.githubusercontent.com/98443610/170007257-95bf9a85-530d-4848-bad2-34dcb28fb3cc.png)

- 지역 추천 시스템 구현 💡

  - datafram scaling : robust scaler

  ```python
  from sklearn.preprocessing import RobustScaler
  scaler = RobustScaler()
  robust_trans = pd.DataFrame(scaler.fit_transform(df.iloc[:,1:]))
  robust_trans
  ```

  - numpy 활용 추천 알고리즘 구성

  ![이미지 303](https://user-images.githubusercontent.com/98443610/170008559-29b54d42-b9cd-4c15-804e-86926cafb63d.png)

  ```python
  matrix_df = robust_trans.to_numpy() # target matrix 
  weight = np.random.random((43, 1)) # weight matrix 43개 피처 난수 발생, 이후 개인화 가능
  output = np.dot(matrix_df,weight) # dot product 
  pd.DataFrame(output).sort_values(by=0, ascending=False)
  ```

- folium 활용 지도 시각화

- 시나리오 app 구현

## 3. 기술 스택

- 크롤링 : BeautifulSoup, Selenium, request

- 전처리 : pandas, re, pyproj 
- 시각화 : matplotlib, seaborn, folium
- 상관 분석 : R(psych, PerformanceAnalytics, corrgram)
- 시나리오 앱 : powerpoint

## 4. 상세 내용

- [블로그 바로가기](https://jaydatum.tistory.com/category/Jay%27s%20Project/wanted%20%EC%B1%84%EC%9A%A9%20%EA%B3%B5%EA%B3%A0%20%EB%B6%84%EC%84%9D)