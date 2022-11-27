### 스프링 프레임 워크란?
스프링 프레임워크란 자바 플랫폼을 위한 오픈 소스 애플리케이션 프레임워크이며 간단하게 스프링이라고 불리고 있다.
스프링은 POJO 기반의 AOP, PSA, IOC/DI 특징을 가진다.
POJO(Plan Old Java Object)란 수수한 자바 객체이다.
AOP(Aspect Oriented Programming)란 관점 지향 프로그래밍을 말한다. 공통 부분과 핵심 부분을 나워서 본다.
PSA(Portable Service Abstraction)란 일관성 있는 추상화이다. 스프링 라이브러리가 POJO를 사용하기 위하여 중간 다리 역확을 하는 어노테이션(annotation)을 말한다.
IOC(Inversion of Control)란 제어의 역행이다. 코드 관리를 개발자가 아닌 프레임워크가 대신 제어권을 가지게 되어서 제어의 역행이라고 한다.
DI(Dependency Injection)란 객체들이 서로 의존 관계가 될 수 있도록 의존성을 주입하는 것이다. 각 클래스 사이에 필요한 의존관계를 빈 설정 정보를 바탕으로 자동으로 연결해준다.

### MVC 패턴이란?
MVC는 Model, View, Controller의 약자이다.

### JSP 정의에 대해 말해보아라.
JSP(Java Server Pages)란 태그와 혼용하여 작성할 수 있는 스크립트 언어이다. HTML과 java를 혼합하여 사용할 수 있다. 
브라우저에서 jsp를 호출하면 jsp 자체를 보여 주는 것이 아니고, jsp가 servlet 형태로 변환하여 응답한다.

**JSP 구성요소**
> 지시문
    > <%@     %>

> 선언문 (전역변수, class, function)
    > <%!     %>

> 스클립틀릿 (코드)
    > <%     %>

> 식
    > <%=     %>

> 액션
    > <jsp:     />

> 코멘트 (주석)
    > <%--     --%> or <!--     -->

### 쿠키와 세션에 대해 설명해 보아라.
쿠키와 세션은 웹에서 정보를 저장하기 위해 사용하는 것이다.
쿠키는 클라이언트에 저장되고, 세션은 서버에 저장이 된다.
쿠키는 보안에 취약하고, 세션은 쿠키보다는 보안이 좋다.
보안에 좋은 세션을 사용하지 않고 쿠키를 사용하는 이유는 접속자 수가 많아지면 서버에 저장하게 되는 데이터가 많아지면 서버에 부하가 생기면 웹사이트 속도가 늦어져 쿠키를 사용한다.

### 큐와 스택에 대해 설명해 보아라.
스택(stack)은 쌓아 올리는 것을 의미하고, 큐(queue)는 줄을 서서 기다리는 것을 의미한다.
스택(stack)는 나중에 요청이 들어온 자료가 먼저 빠져나간다. 
큐(queue)는 먼저 요청이 들어온 자료가 먼저 빠져나간다.
스택(stack) == 후입선출(LIFO, Last-In-First-Out) 방식의 자료구조
큐(queue) == 선입선출(FIFO, First in first out) 방식의 자료구조

### 리스트와 맵에 대해 설명해 보아라.
리스트(List)는 순서가 있고, 중복허용,
맵(Map)는 Key와 Value가 같이 이루어지는 데이터의 집합이며, 순서가 없고, 중복이 없다. 또한 메모리의 빈공간을 찾아서 저장하기 때문에 저장속도가 느리지만, Key값으로 검색하기 때문에 속도가 빠르다.


### MyBatis와 JPA/Hibernate

SQL Mapper : 직접 SQL문 작성해 DB로 접근  
기존 JDBC를 사용할 때 Connection, Statement, ResultSet을 다뤘어야 했는데 그것을 자바 객체를 실제 쿼리랑 연결하여 빠르게 개발하고 편하게 테스트를 할 수 있다. JDBC로 처리하는 부분의 코드와 파라미터 설정, 결과 매핑을 지원한다.  
SQL문을 XML에 작성해서 자유롭고 가독성이 좋으며, SQL문을 재사용할 수 있다. XML이랑 Annotation을 사용해서 DB를 사용할 수 있다.  
학습이 매우 쉽고, 코드와 SQL을 분리할 수 있다.

ORM (Object Relational Mapping) : SQL을 작성하지 않고 객체를 사용하여 데이터를 조작 가능  
JPA(Java Persistence API)란 Java ORM 기술에 대한 API 표준 명세이다.  
JPA를 사용하며 Hibernate를 사용하는데 JPA의 구현체이다. 이외 EclipseLink, DataNucleus 등 다양한 구현체가 존재한다.  
CRUD 쿼리를 자동으로 생성하여 Entity에 속성만 추가하면 쿼리를 건들 필요가 없어진다. 하지만 학습이 어렵고 복잡한 쿼리 작성이 힘들다.

### EL과 jstl

EL(Expression Language)는 JSP의 출력 문법을 대체하는 언어이다.   
```${el}``` 형식으로 표기한다.

jstl(Jsp Standard Tag Library)는 태그를 통해 JSP 코드를 관리하는 라이브러리이다. JSP의 가독성이 좋아진다.  
jstl은 라이브러리라서 사용하려면 다운로드를 해야 하므로 아래의 코드를 JSP에 추가하면 jstl 문법을 사용할 수 있다.  
jstl 태그 종류에는 core, format, function, xml, sql가 있다. 태그의 속성은 너무 많아서 따로 확인해 봐야 한다.  

``` 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
```

JSP 파일을 사용할 때 스클립틀릿 <% %>을 사용하지 말고, EL이랑 jstl을 사용하는 것이 더 효율적이다.


### 동기와 비동기에 대해 설명해 보아라.
### GET과 POST에 대해 설명해 보아라.
### TCP와 UDP에 대해 설명해 보아라.
### HTTP와 HTTPS에 대해 설명해 보아라.
### 프로세스와 스레드에 대해 설명해 보아라.
### Web Server와 WAS에 대해 설명해 보아라. (아파치, 톰캣 연결)
### AJAX에 대해 설명해 보아라.
### 프레임워크와 라이브러리의 차이에 대해 설명해 보아라.
### 제네릭이란?
### 인터페이스와 추상클래스에 대해 설명해 보아라.
### SPRING FRAMEWORK와 SPRING BOOT에 대해 설명해 보아라.
### Maven과 Gradle에 대해 설명해 보아라.
### Servlet과 JSP에 대해 설명해 보아라.
### 가비지 컬렉션에 대해 설명해 보아라.
### 오버로딩과 오버라이딩에 대해 설명해 보아라.
### '=='과 'eauals()'의 차이에 대해 설명해 보아라.
### 스택과 힙에 대해 설명해 보아라.
### 싱글톤 패턴이란?
### Dispatcher-Servlet 이란?
### 정규화란?
### 시퀀스에 대해 설명해 보아라.
### VIEW에 대해 설명해 보아라.
### JOIN에 대해 설명해 보아라.
### INDEX에 대해 설명해 보아라.
### JDBC와 OJDBC에 대해 설명해 보아라.
