<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보</title>
<link rel="stylesheet" href="../books/css/setting.css">
<link rel="stylesheet" href="../books/css/plugin.css">
<link rel="stylesheet" href="../books/css/template.css">
<link rel="stylesheet" href="../books/css/style.css">
<link rel="stylesheet" href="../css/template.css">
<link rel="stylesheet" href="../books/css/setting1.css">
<link rel="stylesheet" href="../books/css/plugin1.css">
<link rel="stylesheet" href="../books/css/template1.css">
<link rel="stylesheet" href="../books/css/style1.css">
<link rel="stylesheet" href="../css/template1.css">
<style>



</style>
</head>
<body>
    <div class="hooms-N43" data-bid="uKlSO0zbWX" >
      <div class="contents-inner" style="margin-right: 4rem;margin-top: -20rem">
        <div class="contents-container container-md" style="width: 88rem">
          <h2 style="font-size:40px;text-align: center;margin-bottom:45px;font-weight: 600;margin-top:20px">주문 정보</h2>
          <p>사용자 ID: ${userId}</p>
          
          <c:choose>
              <c:when test="${not empty list}">
                  <div class="tableset tableset-receipt tableset-text-top" style="width:90rem;">
                      <table class="tableset-table table">
                          <colgroup>
                              <col>
                              <col>
                              <col>
                              <col>
                          </colgroup>
                          <thead class="thead-light thead-border-top">
                              <tr>
                                  <th scope="col">상품정보</th>
                                  <th scope="col">주문일시</th>
                                  <th scope="col">수량</th>
                                  <th scope="col">총 금액</th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach var="item" items="${list}">
                                  <tr>
                                      <td class="tableset-figure td-border-bottom">
                                          <figure style="max-width: 100%; max-height: 100%; display: flex;">
                                              <img src="${item.poster}" alt="이미지" style="max-width: 100%; max-height: 100%;">
                                          </figure>
                                          <div class="tableset-group" style="text-align: center">
                                              <h5 class="p1">
                                                 
                                                  ${item.title}
                                                  <br>
                                                  <br>
                                                  <br>
                                                   
                                              </h5>
                                          </div>
                                      </td>
                                      <td>
                                          ${item.dbday}
                                      </td>
                                      <td class="td-border-bottom">
                                          ${item.quantity}
                                      </td>
                                      <td class="tableset-dark">
                                          <fmt:formatNumber value="${item.totalPrice}" type="number" groupingUsed="true" maxFractionDigits="0"/>원
                                         
                                        
                                          
                                          
                                          <a href="../books/detail.do?no=${item.no }" class="btnset btnset-sm" style="text-align: center;margin-top:4rem">리뷰 작성</a>
                                      </td>
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table>
                  </div>
              </c:when>
              <c:otherwise>
                  <p style="font-size: 4rem;font-weight:800;margin-top:5rem">주문 정보가 없습니다.</p>
              </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
</body>
</html>
