# 👩‍💻2차 프로젝트 <무비 라이크 : TVOD OTT 플랫폼>
## TVOD OTT : 컨텐츠별 단품 결제 후 시청할 수 있는 OTT의 종류
![image](https://github.com/imyeji2/movieLike/assets/137904402/ea4142eb-63c4-4470-868d-7e3b1547daa2)


## 📌목차
[1. 기획 의도 및 목표](#%EF%B8%8F-기획의도-및-목표)

[2. 제작 일정](#%EF%B8%8F제작-일정2023-6-26--2023-7-14)

[3. 개발 환경](#%EF%B8%8F개발-환경)

[4. DB 설계](#%EF%B8%8Fdb설계)

[5. 핵심 구현 기능](#%EF%B8%8F핵심-구현-기능)

[6. 멤버 및 역할 분담](#%EF%B8%8F멤버-및-역할-분담)

[7. 메뉴 구성](#%EF%B8%8F메뉴-구성)

[8.전체 기능 소개](#%EF%B8%8F전체-기능-소개)

[9. 프로젝트 개선 방향](#%EF%B8%8F프로젝트-개선-방향)


## ✔️ 기획의도 및 목표
   - 서비스할 영화를 등록해 사용자에게 제공하여 원하는 영화를 구매하고 구매한 상품에 대한 리뷰를 작성할 수 있도록 한다.
   - [왓챠피디아](https://pedia.watcha.com/ko-KR/), [시리즈온](https://serieson.naver.com/), [키노라이츠](https://serieson.naver.com/)를 벤치마킹하여 실제 서비스 되는 사이트와 최대한 비슷하게 구현한다.
   - 영화 진흥원 API를 활용하여 제공된 정보를 검색해 영화를 등록할 수 있도록 한다.


## ✔️제작 일정(2023. 6. 26 ~ 2023. 7. 14)
![image](https://github.com/imyeji2/movieLike/assets/137904402/3d670aa1-adfb-4c85-b744-099d62c6c02c)





## ✔️개발 환경
![image](https://github.com/imyeji2/movieLike/assets/137904402/d99b2b6e-70cc-4293-ab0c-5ebc98a18316)





## ✔️DB설계
### 📍논리
![image](https://github.com/imyeji2/movieLike/assets/137904402/9d292ba0-42dd-4b0c-9328-fce41ff409e2)


### 📍물리
![image](https://github.com/imyeji2/movieLike/assets/137904402/002aa47a-2463-48a8-b886-003b1df44f7b)





## ✔️핵심 구현 기능

#### ⭐ 이메일 주소로 중복체크 후 회원 가입
#### ⭐ 벤치마킹한 웹 사이트와 최대한 비슷하게 디자인(부트스트랩 활용)
#### ⭐ 영화 진흥원 API를 이용하여 영화 등록
#### ⭐ 배우/감독 등록시 Ajax를 이용하여 동명이인을 체크 후 등록
#### ⭐ 등록된 영화로 컬랙션을 만들어 고객에게 제공
#### ⭐ 포인트(팝콘)을 충전해 상품 구매
#### ⭐ 원하는 영화 찜하기
#### ⭐ 구매한 상품에 대한 리뷰 작성 및 관리
#### ⭐ Chart.js의 오픈 소스를 활용하여 통계의 그래프화
#### ⭐ CKEditor API를 활용한 공지사항/FAQ 작성



## ✔️멤버 및 역할 분담
👩‍💻이예지(팀장)
- [메인페이지](#%EF%B8%8F메인페이지)
- [영화 리스트 페이지](#%EF%B8%8F영화-리스트-페이지)
- [영화 디테일 페이지](#%EF%B8%8F영화-디테일-페이지)
- [영화 검색 페이지](#%EF%B8%8F영화-검색-페이지)
- [관리자 메뉴](#%EF%B8%8F관리자-메뉴)
- [관리자 영화 관리](#%EF%B8%8F관리자-영화-관리)
- [관리자 컬렉션 관리](#%EF%B8%8F관리자-컬렉션-관리)

  
👩‍💻서다희
- [로그인](#%EF%B8%8F로그인)
- [회사위치](#%EF%B8%8F회사-위치)
- [관리자 회원 관리](#%EF%B8%8F관리자-회원-관리)

  

👩‍💻나타미
- [관리자 공지/FAQ 관리](#%EF%B8%8F관리자-공지faq-관리)
- [관리자 리뷰 관리](#%EF%B8%8F관리자-리뷰-관리)



👨‍💻조상혁
- [마이페이지](#%EF%B8%8F마이페이지)
- [관리자 통계 관리](#%EF%B8%8F관리자-통계-관리)

  
👪공통    
- 자료조사, PPT작성, DB설계 및 작성




## ✔️메뉴 구성
### 📍 사용자 메뉴
![image](https://github.com/imyeji2/movieLike/assets/137904402/4f013527-b4e8-488d-b062-538c29b2b6ca)


### 📍 관리자 메뉴
![image](https://github.com/imyeji2/movieLike/assets/137904402/38c03d4b-ba18-4aff-835a-2302234ecf7b)


## ✔️전체 기능 소개

### ▶️메인페이지
![image](https://github.com/imyeji2/movieLike/assets/137904402/3833a67e-0c45-4dad-b683-f56c7524f6ec)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---


### ▶️영화 리스트 페이지
![image](https://github.com/imyeji2/movieLike/assets/137904402/237971c1-3d05-4558-91b5-6954497772c1)
![image](https://github.com/imyeji2/movieLike/assets/137904402/8eb64328-4e30-46ce-9e17-4801edb3feef)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---


### ▶️영화 디테일 페이지
![image](https://github.com/imyeji2/movieLike/assets/137904402/81de70d2-37f4-4991-82dd-ec8c8c8c69bb)
![image](https://github.com/imyeji2/movieLike/assets/137904402/6527e68a-ace3-45e6-865e-8d1d99f9cfaa)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---


### ▶️영화 검색 페이지
![image](https://github.com/imyeji2/movieLike/assets/137904402/e72c1a8b-26a4-473e-aa46-cb4a79135f85)
![image](https://github.com/imyeji2/movieLike/assets/137904402/67392564-ed47-41d4-9207-010182059349)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---


### ▶️로그인
![image](https://github.com/imyeji2/movieLike/assets/137904402/d5f44ba7-0ba8-4a93-86d2-253565e3aef5)
![image](https://github.com/imyeji2/movieLike/assets/137904402/5d0afb0f-d607-4c7e-bb49-4606c719fa12)
![image](https://github.com/imyeji2/movieLike/assets/137904402/c6801a71-8d56-4b75-8b4a-f752da5a7a6b)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---

### ▶️마이페이지
![image](https://github.com/imyeji2/movieLike/assets/137904402/227c5cac-6964-4f5d-b3f6-cafbdc55fdf5)
![image](https://github.com/imyeji2/movieLike/assets/137904402/809b6dda-9da1-45e0-ba6d-eb4f76d4cdeb)
![image](https://github.com/imyeji2/movieLike/assets/137904402/5d66511c-95f7-4229-b597-7792211db5c8)
![image](https://github.com/imyeji2/movieLike/assets/137904402/8c78e369-c017-4db1-84c6-b783d0745130)
![image](https://github.com/imyeji2/movieLike/assets/137904402/6bcef8e3-37dd-42f2-8a3b-605d0002f62e)
![image](https://github.com/imyeji2/movieLike/assets/137904402/6bf6f3fa-43ed-4149-a04a-3b989c962b67)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---

### ▶️회사 위치
![image](https://github.com/imyeji2/movieLike/assets/137904402/086fc118-b1d8-4262-b96c-d2efcd258fb9)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---


### ▶️관리자 메뉴
![image](https://github.com/imyeji2/movieLike/assets/137904402/12f81e49-65ef-4a93-a4f2-82ac994e6717)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---


### ▶️관리자 영화 관리
![image](https://github.com/imyeji2/movieLike/assets/137904402/6aebf6a0-0542-4fc8-a6f3-e4f0651770ac)
![image](https://github.com/imyeji2/movieLike/assets/137904402/b4aedf04-f04b-4415-b81d-073dbe0f1373)
![image](https://github.com/imyeji2/movieLike/assets/137904402/3b6c7694-62ee-4444-bac9-4a5e585aec3c)
![image](https://github.com/imyeji2/movieLike/assets/137904402/240bd73a-c970-434f-990c-b620f6428946)
![image](https://github.com/imyeji2/movieLike/assets/137904402/321da407-bd9f-414b-b087-06d682bb3a79)
![image](https://github.com/imyeji2/movieLike/assets/137904402/48f5e165-13aa-4edf-9724-c689e73aa7d4)
![image](https://github.com/imyeji2/movieLike/assets/137904402/fc0579a4-921d-4167-ae4e-639383cb48ac)
![image](https://github.com/imyeji2/movieLike/assets/137904402/413be9fc-4a4a-4629-8ef4-d3f1046d27ab)
![image](https://github.com/imyeji2/movieLike/assets/137904402/139a1e93-2f5f-437b-9ae0-43e99dc8582d)
![image](https://github.com/imyeji2/movieLike/assets/137904402/6dd43a34-52d7-4e20-8ab4-fca0fd7dacb7)
![image](https://github.com/imyeji2/movieLike/assets/137904402/f3b4a88e-f289-4792-baf0-6c89d21a6ee8)
![image](https://github.com/imyeji2/movieLike/assets/137904402/4436751b-235c-432f-a5e7-6057147acf95)




###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---


### ▶️관리자 컬렉션 관리
![image](https://github.com/imyeji2/movieLike/assets/137904402/0abe03a6-d581-4ac3-8c99-8ff503531572)
![image](https://github.com/imyeji2/movieLike/assets/137904402/361c7e62-c68d-4d93-8dff-3c4088e2c9a1)
![image](https://github.com/imyeji2/movieLike/assets/137904402/94c88bcc-39fd-4a80-a844-a55ff45c6405)
![image](https://github.com/imyeji2/movieLike/assets/137904402/43be6ee8-b525-41ec-a394-1554611f2a42)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---


### ▶️관리자 회원 관리
![image](https://github.com/imyeji2/movieLike/assets/137904402/de348240-6fdf-4551-8780-ce3c218efdee)
![image](https://github.com/imyeji2/movieLike/assets/137904402/bc91b90c-d163-4e80-856f-9e43b4777863)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---


### ▶️관리자 공지/FAQ 관리
![image](https://github.com/imyeji2/movieLike/assets/137904402/79ead2af-38f6-46c7-9829-ebf7356e149b)
![image](https://github.com/imyeji2/movieLike/assets/137904402/f4ee1d45-769b-4797-9649-1c7b48d55483)
![image](https://github.com/imyeji2/movieLike/assets/137904402/004b204f-6fa3-4bf2-9a06-4014f1e9f07c)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---


### ▶️관리자 리뷰 관리
![image](https://github.com/imyeji2/movieLike/assets/137904402/1be56204-3e7e-4958-a80b-c1e085c502fb)



###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---



### ▶️관리자 통계 관리
![image](https://github.com/imyeji2/movieLike/assets/137904402/fb8d6d90-d60a-47eb-aa3d-36b3b5b57d3b)


###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---




## ✔️프로젝트 개선 방향
    ☑️ 전반적인 기능 수정 및 추가
     - 기획과 주제 모두 마음에 들었지만 디자인 구현에 대한 시간 분배가 미숙하여 개발 기간이 짧아 구현하지 못한 부분이 많다.
     - DB와 부족한 기능적인 부분을 포함하여 프로젝트 전체를 SpringBoot를 사용하여 MVC2 패턴으로 수정 할 예정이다.










