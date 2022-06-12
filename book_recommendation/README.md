# 교보문고 책 추천시스템 팀 프로젝트

## 0. 팀 프로젝트

- 주제 : 교보문고 책 추천시스템
- 기여도 : 20% (총원 5명)
- 담당 부분 : 데이터 수집 (크롤링 코드 작성), 데이터 분석 및 시각화, 추천시스템(CBF, CF) 

- 프로젝트 진행기간 : 2022/2/9 ~ 2022/2/14
- 결과 : 추천시스템 프로젝트 발표회 2등 (데이터분석 부트캠프 과정)

## 1. 프로젝트 개요

- 추천시스템 기반 프로젝트 - 교보문고 책 추천시스템
- 분야별 베스트셀러 시각화 및 분석
- 책 추천시스템 CBF, CF, MF
  
## 2. Workflow

### 2.1 프로젝트 기획

- 분야별 베스트셀러 현황 시각화
- 분야별 베스트셀러의 키워드 분석을 통한 출판 시장의 인사이트 도출
- 책 추천시스템 구현  
  베스트셀러 키워드 픽 제공 : CBF 추천알고리즘 적용  
  사용자 리뷰와 별점 제공 : CF 추천 알고리즘 적용

### 2.2 데이터 수집
  
- 타겟데이터 : 교보문고 분야별 베스트 셀러

- 데이터수집 : 책 제목, 키워드, 사용자 리뷰와 해당 아이디(masking처리), 사용자 별점 

- 크롤링 코드 작성  
  ```python
  ## 전처리 함수 완성 ## 
def preprocessing(total):
    k_total = int(re.sub('\D','',total))
    return k_total

def keyword_pre(keywords):
    for keyword in keywords:
        keyword_list.append(keyword.text)

def id_pre(ids):
    for id in ids:
        id_list.append(id.text)
        
def klovers_pre(klovers):
    for klover in klovers:
        klover_list.append(klover.text)
        
def comments_pre(comments):
    for comment in comments:
        comment_list.append(comment.text)
```

## 3. 기술 스택

- 크롤링 : BeautifulSoup, Selenium, request

- 전처리 : pandas, re, pyproj 
- 시각화 : matplotlib, seaborn, folium
- 상관 분석 : R(psych, PerformanceAnalytics, corrgram)
- 시나리오 앱 : powerpoint

## 4. 상세 내용
