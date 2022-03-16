# 패키지 설치함수
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}
pak <- c('readxl','openxlsx','writexl','psych') # 필요 패키지 벡터
ipak(pak)

# target matrix
target <- read_excel('C:/Users/Jay/Desktop/gangseo/dataset/target_matrix.xlsx') 

# 다중 상관분석 
corr.test(target[2:52], adjust='none') # adjust = none 중요, 도움말 참고
pvalue <- corr.test(target[2:52], adjust='none') # 행정동 컬럼 제외
pval <- as.data.frame(pvalue$p) # 상관분석 결과 중 p값만 따로 저장
mode(pval) # 자료형 확인
write_xlsx(pval, 'C:/Users/Jay/Desktop/R_basic/pval.xlsx') # 엑셀로 저장
