# 2024-NC2-A49-Wallet
> 챌린지 여정의 티켓을 지갑에 PASS로 보관할 수 있도록 해주는 앱 

## 🎥 Youtube Link
(추후 만들어진 유튜브 링크 추가)

## 💡 About Wallet

> PassKit <br/><br/>
PassKit에서 PKPass를 이용하여, 지갑에 패스를 커스텀하여 설치할 수 있다는 것을 알게 되었다. <br/>
(내용 중략)_

## 🎯 What we focus on?
>  PKPass 파일을 압축하여, 애플 인증서를 통해 서명하고 지갑에 커스텀한 패스를 설치한다.

## 💼 Use Case
>  아카데미 러너들이 챌린지 시작전에 챌린지 티켓을 애플 지갑에 넣어,
챌린지 여정에 더 몰입하고 여정이라는 것을 느낄 수 있게 된다.

## 🖼️ Prototype
아카데미 러너들의 챌린지 여정을 시작할 때 지갑에 여정 티켓을 발행해주는 앱.

## 🛠️ About Code
티켓을 구성하기 위해서는 Pass.json 파일, 로고와 아이콘 파일로 구성된 패스 디렉토리를 만들어야 합니다.
디렉토리를 애플 인증서를 통한 서명 후에 피케이 패스로 압축파일로 만듭니다.

이 파일을 엑스코드 프로젝트 파일에 추가합니다.
엑스코드 파일에서는 PassKit을 import하고, AddPass 함수를 통해서 아이폰 지갑에 패스를 추가할 수 있습니다.
패스데이터를 사용하여 피케이패스 객체를 생성합니다. 피케이 패스는 애플월랫 패스를 나타내는 클래스입니다.

또한 PKPass 라이브러리를 통해 현재 지갑에 추가된 패스들을 관리할 수 있습니다.
이를 통해 패스가 중복 설치되지 않도록 관리할 수 있습니다.
