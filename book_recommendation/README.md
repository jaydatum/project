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
- 책 3,240권, 리뷰 182,115건 수집 완료
- 크롤링 코드 작성  
  https://github.com/jaydatum/project/blob/master/book_recommendation/kyobobook_crawling_auto.ipynb

### 2.3 데이터 분석
- 시각화, 분석
  https://github.com/jaydatum/project/blob/master/book_recommendation/kyobobook_analyize.ipynb

### 2.4 추천 알고리즘
  1. CBF (Contents Based Filtering)  
  - 교보문고 선정 keyword 기반 CBF 알고리즘 적용
  ```python
  from sklearn.feature_extraction.text import CountVectorizer
  # 가중평점 반영 안한 추천시스템
def find_sim_book_ver1(df_CBF, sorted_ind, title_name, top_n=10):
    
    # 인자로 입력된 movies_df DataFrame에서 'title' 컬럼이 입력된 title_name 값인 DataFrame추출
  title_book = df_CBF[df_CBF['title'] == title_name]
    
    # title_named을 가진 DataFrame의 index 객체를 ndarray로 반환하고 
    # sorted_ind 인자로 입력된 genre_sim_sorted_ind 객체에서 유사도 순으로 top_n 개의 index 추출
    title_index = title_book.index.values
    similar_indexes = sorted_ind[title_index, :(top_n)]
    
    # 추출된 top_n index들 출력. top_n index는 2차원 데이터 임.
    # dataframe에서 index로 사용하기 위해서 1차원 array로 변경
    print(similar_indexes)    
    # 2차원 데이터를 1차원으로 변환
    similar_indexes = similar_indexes.reshape(-1)
    
    return df_CBF.iloc[similar_indexes]

    # CountVectorizer로 학습시켰더니 3096개의 책에 대한 22882개의 키워드의 "키워드 매트릭스"가 생성되었다.

    count_vect = CountVectorizer(min_df=0, ngram_range=(1, 2))  # min_df: 단어장에 들어갈 최소빈도, ngram_range: 1 <= n <= 2 1단어, 2단어까지
    genre_mat = count_vect.fit_transform(df_CBF['keyword']) # 키워드 기반학습
  ```
  
  - CBF의 특성 상 중복되는 키워드의 수가 중요한 문제임  
  기존 교보문고의 키워드의 경우 해당 책 특유의 세부적인 키워드가 많아 CBF의 알고리즘 성능이 떨어지는 문제 발생 → 카테고리를 키워드로 추가
  
  ```python
  # category 추가 
df_CBF = df_keyword.join(df_best.set_index('도서명')['카테고리'], on='title')
df_CBF.rename(columns={'카테고리':'category'}, inplace=True)

# 카테고리와 장르 합친 새로운 컬럼 생성
df_CBF["keyword2"] = df_CBF['category'] + " " + df_CBF["keyword"]
# 중복데이터 제거
df_CBF =df_CBF.drop_duplicates(subset="title", keep='first', inplace=False, ignore_index=False)
df_CBF.reset_index(drop=True, inplace=True)
 ```
- 리뷰 수가 매우 적은 책의 경우 평점이 매우 높게 나타남 → 가중평점으로 재계산
```python
# 상위 50%에 해당하는 vote_count를 최소 투표 횟수인 m으로 지정
C = df_CBF['score'].mean()
m = df_CBF['total'].quantile(0.5)
def weighted_vote_average(record):
    v = record['total']
    R = record['score']
    
    return ( (v/(v+m)) * R ) + ( (m/(m+v)) * C )
# 가중평점(weighted_vote) 카테고리 추가
df_CBF['weighted_score'] = df_CBF.apply(weighted_vote_average, axis=1)
```

  

  

## 3. 기술 스택

- 크롤링 : BeautifulSoup, Selenium, request
- 전처리 : pandas, re, pyproj 
- 시각화 : matplotlib, seaborn, folium
- 상관 분석 : R(psych, PerformanceAnalytics, corrgram)
- 시나리오 앱 : powerpoint

## 4. 상세 내용
