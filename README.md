# 👩‍💻2차 프로젝트 <무비 라이크 : TVOD OTT 플랫폼>
## TVOD OTT : 컨텐츠별 단품 결제 후 시청할 수 있는 OTT의 종류
![image](https://github.com/imyeji2/ezBooks/assets/137904402/c331290c-26a9-4ebd-80ff-c81247862091)


## 📌목차
[1. 기획 의도 및 목표](#%EF%B8%8F-기획의도-및-목표)

[2. 제작 일정](#%EF%B8%8F제작-일정2023-5-22--2023-6-9)

[3. 개발 환경](#%EF%B8%8F개발-환경)

[4. DB 설계](#%EF%B8%8Fdb설계)

[5. 핵심 구현 기능](#%EF%B8%8F핵심-구현-기능)

[6. 멤버 및 역할 분담](#%EF%B8%8F멤버-및-역할-분담)

[7. 메뉴 구성](#%EF%B8%8F메뉴-구성)

[8.전체 기능 소개](#%EF%B8%8F전체-기능-소개)

[9. 프로젝트 개선 방향](#%EF%B8%8F프로젝트-개선-방향)


## ✔️ 기획의도 및 목표
   - 서비스할 영화를 등록해 사용자에게 제공하여 원하는 영화를 구매하고 구매한 상품에 대한 리뷰를 작성할 수 있도록 한다.
   - [왓챠피디아](https://pedia.watcha.com/ko-KR/),[시리즈온](https://serieson.naver.com/),[키노라이츠](https://serieson.naver.com/)를 벤치마킹하여 실제 서비스 되는 사이트와 최대한 비슷하게 구현한다.
   - 영화 진흥원 API를 활용하여 제공된 정보를 검색해 영화를 등록할 수 있도록 한다.


## ✔️제작 일정(2023. 5. 22 ~ 2023. 6. 9)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/ec7daa77-c6a2-4ed9-b8eb-d65e17f1151b)




## ✔️개발 환경
![image](https://github.com/imyeji2/ezBooks/assets/137904402/677e1442-fafd-4781-bea1-971f7c091a97)




## ✔️DB설계
### 📍논리
![image](https://github.com/imyeji2/ezBooks/assets/137904402/bd95ae70-01e4-4de3-99be-2a5fefb6c503)

### 📍물리
![image](https://github.com/imyeji2/ezBooks/assets/137904402/6a7be3c2-cef7-4c1d-9036-c0fd9ad343a6)




## ✔️핵심 구현 기능

#### ⭐ 이메일 주소로 중복체크 후 회원 가입
#### ⭐ 부트 스트랩의 캐러셀 기능을 활용하여 메인 페이지를 구현
#### ⭐ 영화 진흥원 API를 이용하여 영화 등록
#### ⭐ 배우/감독 등록시 Ajax를 이용하여 동명이인을 체크 후 등록
#### ⭐ 등록된 영화로 컬랙션을 만들어 고객에게 제공(메인화면에)
#### ⭐ 포인트(팝콘)을 충전해 상품 구매
#### ⭐ 구매한 상품에 대한 리뷰 작성 및 관리
#### ⭐ Chart.js의 오픈 소스를 활용하여 통계의 그래프화
#### ⭐ CKEditor API를 활용한 공지사항/FAQ 작성



## ✔️멤버 및 역할 분담
👩‍💻이예지(팀장)
- [전체 디자인 및 레이아웃](#%EF%B8%8F로그인)
- [메인페이지](#%EF%B8%8F로그아웃)
- [영화리스트, 디테일 페이지]
- [메인 화면](#%EF%B8%8F메인-화면)
- [영화 등록](#%EF%B8%8F입고-관리)
- [배우/감독 등록](#%EF%B8%8F재고-관리)
- [컬렉션 등록](#%EF%B8%8F통계)

  
👩‍💻서다희
- [로그인](#%EF%B8%8F출판사-관리)
- [사용자 정보 수정](#%EF%B8%8F통계)
- [회원 정보 관리(관리자페이지)](#%EF%B8%8F통계)
  

👩‍💻나타미
- [공지사항/FAQ](#%EF%B8%8F사원-관리)
- [리뷰관리(관리자페이지)](#%EF%B8%8F부서-관리)


👨‍💻조상혁
- [포인트 충전](#%EF%B8%8F판매-관리)
- [상품 결제](#%EF%B8%8F환불-관리)
- [찜/구매](#%EF%B8%8F환불-관리)
- [통계]
  
👪공통    
- 자료조사, PPT작성, DB설계 및 작성




## ✔️메뉴 구성
![image](https://github.com/imyeji2/ezBooks/assets/137904402/d5e66f31-b89a-42d7-ac90-45f62ee43dec)




## ✔️전체 기능 소개
### ▶️로그인
##### 👉 로그인 유효성 검사 
![image](https://github.com/imyeji2/ezBooks/assets/137904402/098260fa-03bc-466e-b45b-a3a606893818)

##### 👉 로그인 성공 
![image](https://github.com/imyeji2/ezBooks/assets/137904402/fee7eee3-0936-47bc-b629-9cf397e24df8)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---
### ▶️로그아웃
![image](https://github.com/imyeji2/ezBooks/assets/137904402/0d845e75-6c17-40d2-8f1a-688cb2ba925c)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)

---
### ▶️메인 화면
![image](https://github.com/imyeji2/ezBooks/assets/137904402/3ace27bf-d878-4469-ae00-4e9236984a99)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---
### ▶️사원 관리
![image](https://github.com/imyeji2/ezBooks/assets/137904402/ee239fd2-11a1-46f6-9b14-b72858c75002)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/e1e780c0-81f3-45ac-b45b-b8d1991e7b50)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/0dc67d23-3b1a-4136-b482-80d34f00d3d4)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/fd918d8c-af3a-46af-8175-333a2bf712ab)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/6df0902b-357b-4761-af1e-d8abd1d69506)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/de9f5419-d2a8-4027-afbf-9c6744aa98b2)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/716946c5-594b-4458-bfaf-3c76bad1e009)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---
### ▶️부서 관리
![image](https://github.com/imyeji2/ezBooks/assets/137904402/0de47817-c225-41b7-8444-7e1c3798189b)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/a96fe9a9-c2a4-49b7-a8da-ed7f9ede4cdf)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/5888a28e-5c8a-4d76-aca9-050a589569d7)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/b385b48a-1b30-4275-abf7-64a462be8037)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/b3bf6bc0-89ee-488a-a808-b5ab426ad3fd)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/7be71134-003b-4cd3-96c0-767c3c2a7ba9)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/3a625332-295b-4525-8dbe-d94a7a7f095b)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---
### ▶️출판사 관리
![image](https://github.com/imyeji2/ezBooks/assets/137904402/06f310d0-f8d0-4ce9-90e1-61c5d8ca8eb4)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/81580d7c-5720-4402-bdf8-767a226e418d)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/34b4d23e-fbb6-4082-ad56-94309fcc483e)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/6d23269a-4d9f-43ba-b23c-7ea91eb1794f)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/4bda6997-3351-4904-8e80-dc2d35ac841a)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/cadb485e-2489-473b-b3c7-62707bb3c54a)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/ad55bf85-bda7-4d9f-989e-9bbbb78a6eee)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/e09ebf03-4712-4ea8-aa85-a624a56d6926)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/49a9e8c6-8d1c-4fdb-baab-e371af04b8e7)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---
### ▶️도서 관리
![image](https://github.com/imyeji2/ezBooks/assets/137904402/a205311b-2acf-45b8-b945-90f65a4b29f5)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/b1c68857-ebcf-4064-8225-b72c46c51ff4)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/4e8d024f-2833-4244-9338-0d19b1c6dd16)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/1797e69b-399f-422e-ba64-ec8d5a3ea27b)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---
### ▶️카테고리 관리
![image](https://github.com/imyeji2/ezBooks/assets/137904402/a63eb11f-3897-47cb-b0db-c79792800bab)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/26954533-3156-411e-aa16-7638c0a430f9)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/ea0c8c0e-0258-47ee-981a-bd2d1d8b3660)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/f41142a4-f4f3-4e7e-81b8-dffb5d154955)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---
### ▶️계약 관리
![image](https://github.com/imyeji2/ezBooks/assets/137904402/6999d25e-1dd8-474c-83e3-5caf668f7838)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/07f64be8-0973-4eaf-a8f2-73f0735e6fd9)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/156d4d5a-5d14-452a-b6b3-641a82e659d2)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/ee374c10-d3b2-47d7-80a1-c6ee01e0db8a)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)

---
### ▶️입고 관리
![image](https://github.com/imyeji2/ezBooks/assets/137904402/7c7db99c-4495-40a0-9cec-873a970e7211)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/a3a6c6e9-0300-48e7-a013-9aedeffbd50d)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/69ee3b26-6ed5-420c-80ae-a2c29149c8cf)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/396c37c6-c33c-461f-93a0-3f06d370baaf)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/ebb5c2c0-b935-48db-a3c9-4f803986bec8)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/5d2dfe1e-4e7d-43c1-9c33-cf0bb6310b71)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/43dac7cf-9f04-4379-8720-873e64262231)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/ada0371b-200b-42a3-9b9b-b99af34bdd65)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/9fe39183-901e-4013-bddf-2b45a09b46ba)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/13797c41-151a-4b4a-8fa9-b5ddf70a5eed)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/2ae30f93-7340-4e29-a0e0-06993293cc1e)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/4539fede-fc8a-4db9-8eec-f9e5ab24c8a1)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/690ade93-e64c-43ad-832f-037b102d7a37)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/de1f4d8d-c2a7-4aae-80e8-10d4563cb0e9)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---
### ▶️재고 관리
![image](https://github.com/imyeji2/ezBooks/assets/137904402/383cab1f-0b39-48f1-83ad-4b28a07cc446)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/23b44d8c-80b1-4d3d-953e-0cb4ba830c92)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/2ff5ce27-d2cf-46d9-9c59-781b94fa6a30)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---
### ▶️판매 관리
![image](https://github.com/imyeji2/ezBooks/assets/137904402/b2b8981f-3eb8-417c-a554-d8b3363a5aa0)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/e4154b5b-7d8d-45d1-baea-ad14de052512)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/65f749bc-9745-48bd-a974-7e7ba9052b0f)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/9cdd514f-4b3e-4f26-9027-dd4242709866)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/97525c98-dc06-4c27-81d5-1ddc05e2ffc1)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/25ecbbfa-af02-499d-ae71-b61a7015d9d4)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---
### ▶️환불 관리
![image](https://github.com/imyeji2/ezBooks/assets/137904402/3fe4be0f-f88f-43d7-af1f-7185743c00db)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/5d1cc6ae-aea2-422d-98b2-f085ef20dcd4)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/fa2419d9-fec9-4f38-aaa1-1dec6b855a93)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)


---
### ▶️통계
![image](https://github.com/imyeji2/ezBooks/assets/137904402/50b9c937-c36f-4e00-86fe-c3377e821d9a)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/49fa28b9-8963-47d7-acf1-16277b208fbd)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/b6628810-0eab-492e-bd7c-440d3a92576f)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/0e03d3d0-4543-4763-81fb-e6ebbdcfb58e)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/33b03c14-94d9-472f-9e61-f86d4e5114b4)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/fdb517e1-ad8d-4e37-abbd-26012916fda4)
![image](https://github.com/imyeji2/ezBooks/assets/137904402/36fd6bdd-1bb1-4d3b-b421-26b0f1af22ef)
###### [[멤버 및 역할 분담👆]](#%EF%B8%8F멤버-및-역할-분담)




## ✔️프로젝트 개선 방향
    ☑️ 통계의 그래프화 
     - 통계 데이터의 시각화를 통해 사용자 편의성을 증대한다.

     
    ☑️ 입고 관리에 상품명 컬럼 표시
     - 입고된 상품의 파악을 위해 해당 상품이 무엇인지 표시한다.

     
    ☑️ 입고 & 재고 기능 확장
     - 상품 입고 시 해당 상품에 관한 정보가 담긴 파일을 등록하면 해당 상품 정보 자동 입력 및 수량 변경할 수 있게 한다.
     - 입고 & 재고 상품 클릭 시 해당 상품에 대한 권당 정보 확인 (바코드 정보, 입고일, 판매일 여부 등)을 할 수 있게 한다.

     
     ☑️ 판매의 기능 확장
       - 위의 "입고 & 재고 기능 확장" 기능을 통해 입력 된 바코드 정보를 추가하여 해당 상품의 판매를 확인할 수 있게 한다.
       - 결제 정보를 추가하여 어떤 결제 방식으로 결제 되었는지를 확인할 수 있게 한다.












