# Metacritic Pokemon S/S 리뷰 분석 프로젝트
![metacritic_poke](/metacritic_pokemon/images/metacritic_poke.jpg)

## 1. 프로젝트 개요
- 데이터 분석 부트캠프 두번째 프로젝트
- 닌텐도 스위치 타이틀 포켓몬스터 소드&실드의 metacritic 리뷰 분석
- 게임 개발사 데이터 분석가의 입장에서 리뷰 분석을 통해 포켓몬스터 신작에 대한 유저 반응을 알아 본다.
- 극단적으로 나뉠 수 있는 본작의 평가에 대해 감성 분석 머신러닝 알고리즘을 적용한다.

## 2. Workflow
- Metacritic 리뷰 크롤링 : 포켓몬스터 소드 & 실드
- 데이터 전처리  
  1. 특정 문장, 단어 제거 이슈 : 이모지, Collapse, This review contains spoilers
  2. 정규 표현식을 이용한 특수 문자 제거
  3. 영어 외 다른 언어에 대한 전처리 : 포르투갈어, 스페인어, 일본어, 중국어 등
- 키워드 시각화 : barplot, pie chart, box plot, wordcloud
- 결과 분석
- 감성 분석 : 전처리, logistic regression 모델 적용
  

## 3. 기술 스택
- 크롤링 : BeautifulSoup, Selenium
- 전처리 : pandas, nltk, re, Counter, langid
- 시각화 : matplotlib, seaborn, WordCloud
- 감성분석 : sklearn

## 4. 상세 내용
- [블로그 바로가기](https://jaydatum.tistory.com/category/Jay%27s%20Project/metacritic%20%ED%8F%AC%EC%BC%93%EB%AA%AC%20%EC%86%8C%EB%93%9C%26%EC%8B%A4%EB%93%9C%20%EB%A6%AC%EB%B7%B0%20%EB%B6%84%EC%84%9D)
