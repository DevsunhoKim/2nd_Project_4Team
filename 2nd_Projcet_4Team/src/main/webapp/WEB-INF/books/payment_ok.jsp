<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 완료</title>
    <link rel="stylesheet" href="../books/css/setting.css">
    <link rel="stylesheet" href="../books/css/plugin.css">
    <link rel="stylesheet" href="../books/css/template.css">
    <link rel="stylesheet" href="../books/css/style.css">
    <link rel="stylesheet" href="../css/template.css">
</head>
<body>
    <main class="th-layout-main">
        <div class="hooms-N49" data-bid="IMlT00KK2L">
            <div class="contents-inner">
                <div class="contents-container container-md">
                    <div class="contents-ico">
                        <img class="cardset-img" src="../books/images/check.png" alt="체크아이콘" style="width:120px;height: 120px">
                        <h3>주문/결제가 완료되었습니다.</h3>
                    </div>
                    <div class="tableset tableset-receipt tableset-text-top">
                        <table class="tableset-table table">
                            <thead class="thead-light thead-border-top">
                                <tr>
                                    <th scope="col">주문상품</th>
                                    <th scope="col">주문일자</th>
                                    <th scope="col">주문자</th>
                                    <th scope="col">주문처리상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${paymentInfo.title}</td> <!-- 주문번호 -->
                                    <td>${paymentInfo.dbday}</td> <!-- 주문일자 -->
                                    <td>${paymentInfo.userId}</td> <!-- 주문자 -->
                                   <td>
    								<c:choose>
								        <c:when test="${paymentInfo.status == 'Y'}">결제 완료</c:when>
								        <c:otherwise>결제 진행 중</c:otherwise>
								    </c:choose>
</td>
                                   
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="contents-bottom">
                        <p>* 택배/시공 상품이 별도 배송될 수 있습니다.</p>
                        <p>총 구매가 <span>${paymentInfo.totalPrice}</span></p> <!-- 총 구매가 -->
                    </div>
                    <div class="contents-btn">
                        <a href="../books/list.do" class="btnset btnset-lg">돌아가기</a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="../books/js/setting.js"></script>
    <script src="../books/js/template.js"></script>
    <script src="../books/js/common.js"></script>
    <script src="../books/js/script.js"></script>
</body>
</html>
