# 웹개발 프로젝트

<h3 align="left">Languages and Tools</h3>

![Spring](https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![Java](https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white)
![Gradle](https://img.shields.io/badge/Gradle-02303A.svg?style=for-the-badge&logo=Gradle&logoColor=white)
![Oracle](https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%238511FA.svg?style=for-the-badge&logo=bootstrap&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

<hr>
<h3># 프로젝트 목표</h3>

- 지원하고자 하는 회사인 "블랜딩"에서는 gpt를 활용하여 코드를 구현해서 빠르게 실행
가능하게 작업하는 일이 주가 됩니다. 업무적인 부분에 대해 실습하는 프로젝트입니다. 

<hr>
<h3># 프로젝트 순서</h3>

- gpt에게 간단하게 기획한 프로젝트를 자세하게 설명해주고, 부족한 기능이 있다면 
 추가해서 기획해달라고 명령한다.  
 
- 기획한 프로젝트에 틀에서 벗어나지 않는다면 각 부분에 코드를 구현하라고 명령한다. 
  (만약 추가 기능이나, 기존 기획에서 벗어나는 부분이 있다면 수정해달라고 요청)
  
- 구현된 코드를 디버깅하면서 에러가 생기는 부분이나 잘못된 답변에 반박하고, 
 새롭게 명령합니다.

 - 완성된 코드를 구현해서 실행하여 배포합니다. 
<hr>
<h3># gpt에게 질문 & 피드백</h3>

<p>
  <div class="form-group">
    <div style="height: 200px; width:100%;">
      <img style="width:330px; float:left;" src="https://github.com/dydals99/ToApps/assets/117415671/8b38cd7c-bbd2-4fe8-833b-f917dde29bf0"></img>
      <img style="width:330px; float:left;" src="https://github.com/dydals99/ToApps/assets/117415671/952e00c5-555e-4eb1-a9b0-94d30004d845"></img>
      <img style="width:330px; float:left;" src="https://github.com/dydals99/ToApps/assets/117415671/0e680988-f25b-4447-bccb-35f22104051d"></img>
    </div>
  </div>
</p>
<p>
  
- 간단하게 설계한 프로젝트를 gpt에게 필요한 부분이 있다면 추가해서 기획해달라고 요청합니다.
  여기서 미리 툴이나 프레임워크, 라이브러리등 필요한 부분을 요청해놨습니다.
  
- 첫번째 질문에 대한 대답으로 빼달라고한 시큐리티를 포함하여 답변이 돌아왔습니다. 잘못된 답변이라고 
  제외하고 다시 명령합니다.
  
- 정상적으로 프로젝트를 기획했습니다. 구현 코드를 요청합니다.
  
</p> 
<hr>
<p>
  <div class="form-group">
    <div style="height: 200px; width:100%;">
      <img style="width:330px; height: 200px; float:left;" src="https://github.com/dydals99/ToApps/assets/117415671/91377865-d4a7-4ca1-a309-073361f95228"></img>
      <img style="width:330px; height: 200px; float:left;" src="https://github.com/dydals99/ToApps/assets/117415671/e285ceec-2014-49e3-92b1-6411864c4f99"></img>
      <img style="width:330px; height: 200px; float:left;" src="https://github.com/dydals99/ToApps/assets/117415671/cf43b807-757b-48f1-96e5-aacf6a2ff708"></img>
    </div>
  </div>
  
- 그 후 구현된 코드를 살펴보니 설계구조에 대해서 먼저 알려주고있습니다. 아래와 같은 오류들도 생겼고, 이를 해결했습니다.
  
- 1.DB에 테이블명이 기존 예약어로 되어있던 것 입니다. "ORA-00903: 테이블명이 부적합합니다." 에러가 발생합니다. 수정된 코드를 다시 받아 정상적으로 구현했습니다.
  
- 2.@PathVariable 로 인한 에러가 발생했는데, 기존에는 Mapping 의 경로와 변수명이 같다면 name을 생략 가능한걸로 알았습니다. 하지만 스프링부트 3.2.X 버전부터는 자바 컴파일러에 parameters 옵션을 넣어주거나, 어노테이션에 이름을 생략하지 않고 다음과 같이 이름을 항상 적어줘야하는 것을 학습했습니다.
  
- 이 외에도 다양한 에러와 직면했지만, 해결하기 위한 능력을 키울 수 있었습니다. 이때부터는 gpt에게만 질문하는게 아니라 직접 문서들을 찾아보며 해결했습니다.
</p> 
<hr>


 <h3># 프로젝트를 마치며</h3>
 <p>
 gpt를 활용하여 간단하게 구현하여 실행하는게 목표인 프로젝트를 진행해보았습니다. 
 확실히 같은 웹 페이지를 만든다고 가정하였을 때, 훨씬 더 빠르게 반복/잡코드에 처리가 
 용이 하다고 느꼈습니다.
 </p> 
 <p>
 그에 따른 리스크로는 직접 작성한 코드가 아니기 때문에 구현된
 코드가 어떻게 흘러가는지 플로우를 파악하지 못한다면 사용할 수 없겠다고 느꼈습니다.</p>
 <p>
 또한 명확하게 질문하고 명령하는 것, 어떻게 질문해야 좋은 답변을 받을 수 있을까라는 
 고민을 할 수 있던 시간이였습니다.
 </p> 
 <p>
 gpt(ai)는 앞으로도 우리 일상에 녹아들어 모든 직업군에 
 도구로 활용될 것 입니다. 
 </p>
 <p>
 저는 "블랜딩"에 입사하여 그런 역량들을 발휘하고 더욱 더 성
 장 시킬 수 있을 것이라고 자신합니다. 감사합니다.
 </p>
 <hr>
 <h3># 실행화면</h3>
 aws를 통해 최종적으로 배포하고 프로젝트를 마무리하려고 했으나, 아직은 성공하지 못했습니다.<br>
 다양한 방법을 동원해봤지만 아직 문제점을 찾지 못하고 있습니다.<br> 
 아래의 실행화면 영상으로 대체합니다. 감사합니다.<br><br>
 https://youtu.be/nc35uhcOeBc
 <hr>
