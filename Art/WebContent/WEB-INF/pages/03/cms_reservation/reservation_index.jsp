<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<br>
	<div class=title>
		<h1 align="center" style="margin-top: 20px;">顧客訂位 管理系統</h1>
	</div>
	<br>
	<div class=title>
		<h3 align="center" style="margin-top: 20px;font-weight: bold;">食堂訂位管理</h3>
	</div>
	<br>
	<div class=content>
		<table id="03"
			class="display table table-bordered table-hover table-blue">
			<thead class="table-hover">
				<tr class="head" style="color: #0B1013;">
					<th scope="col" class='table-warning'>預約編號</th>
					<th scope="col" class='table-success'>會員姓名</th>
					<th scope="col" class='table-danger'>訂位人姓名</th>
					<th scope="col" class='table-info'>連絡電話</th>
					<th scope="col" class='table-warning'>訂位日期</th>
					<!-- ===================== -->
					<th scope="col" class="table-success">用餐日期</th>
					<th scope="col" class="table-danger">用餐人數</th>
					<th scope="col" class="table-info" colspan="3">操作</th>
				</tr>
			</thead>
			<tfoot>
			</tfoot>
			<tbody>
				<c:if test="${reservationList != null}">
					<c:forEach items="${reservationList}" var="reservationList"
						varStatus="vs">
						<tr>
							<td>2020122500${reservationList.reservationNo}</td>
							<td>${reservationList.memberName}</td>
							<td>${reservationList.customerName}</td>
							<td>${reservationList.customerPhone}</td>
							<td>${reservationList.dateTime}</td>
							<!-- ======================= -->
							<td>${reservationList.time}</td>
							<td>${reservationList.amount}</td>
							<td>
								<!-- 								<form method="post" --> <%-- 									action="<c:url value="/03/cms/reservation/checkReservationDetails.ctrl"/>"> --%>
								<button name="checkButton" type="submit"
									value="${reservationList.reservationNo}">訂位詳情</button> <Input
								type="hidden" name="reservationNo"
								value="${reservationList.reservationNo}"> <!-- 								</form> -->
							</td>
							<td>
								<!-- 								<form method="post" --> <%-- 									action="<c:url value="/03/cms/reservation/updateReservationByNo.ctrl"/>"> --%>
								<button name="updateButton" type="submit"
									value="${reservationList.reservationNo}">修改訂位</button> <Input
								type="hidden" name="reservationNo"
								value="${reservationList.reservationNo}"> <!-- 								</form> -->
							</td>
							<td>
								<!-- 								<form method="post" --> <%-- 									action="<c:url value="/03/cms/reservation/deleteReservationByNo.ctrl"/>"> --%>
								<button name="deleteButton" type="submit"
									value="${reservationList.reservationNo}">刪除訂位</button> <Input
								type="hidden" name="reservationNo"
								value="${reservationList.reservationNo}"> <!-- 								</form> -->
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<br>
		<c:if test="${reservationSerachMsg != null}">
			<div align="center" style="font-size: larger">${reservationSerachMsg}</div>
		</c:if>
	</div>
</div>

<!-- ====================================================== -->

<script>
	$(document).ready(function() {
		$('#03').DataTable({
			scrollY : 50,
			"language" : {
				"search" : "搜尋訂位紀錄:",
				"lengthMenu" : "每頁 _MENU_ 筆訂位紀錄",
				"zeroRecords" : "抱歉，查無訂位紀錄",
				"info" : "第 _PAGE_ 頁，總計 _PAGES_ 頁",
				"infoEmpty" : "沒有訂位紀錄",
				"infoFiltered" : "(filtered from _MAX_ total records)",
				"paginate" : {
					"first" : "第一頁",
					"last" : "最後一頁",
					"next" : "下一頁",
					"previous" : "前一頁"
				}
			}
		});
	});
</script>
	
