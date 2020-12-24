<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my reservation</title>
<style>
/* p, div { */

/* } */
td {
	vertical-align: middle;
}

.custom-button {
	display: inline-block;
	outline: none;
	line-height: 40px;
	padding: 0 10px;
	text-align: center;
	text-decoration: none;
	/* 	font-weight: bold; */
	cursor: pointer;
	border-radius: 5px;
	font-size: 21px;
	color: black;
}

.wrapper-restaurant {
	width: 330px;
	height: 200px;
	overflow: hidden;
	margin: 0 auto;
}

</style>

</head>
<body>

	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">AAART Shop</h1>
					<p class="text-white link-nav">
						<a href="index.html">首頁 </a> <span class="lnr lnr-arrow-right"></span>
						<a
							href="<c:url value='/03/front/reservation/myReservation.ctrl' />">
							得藝食堂訂位紀錄</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<div style="padding-left: 35px; padding-right: 25px;">
		<br>
		<div class=title>
			<h1 align="center" style="margin-top: 20px; margin-bottom: 20px;">得藝食堂訂位紀錄</h1>
		</div>
		<div class=content style="font-size: 18px;">
			<div class="card-body">
				<div class="table-responsive">
					<table id="03" style="color: black;"
						class="display table table-hover">
						<thead>
							<tr class="head" align="center"
								style="font-size: 22px; font-weight: bold;">
								<th scope="col" class='table-warning' style="line-height: 30px;">訂位人</th>
								<th scope="col" class='table-success' style="line-height: 30px;">連絡電話</th>
								<th scope="col" class='table-danger' style="line-height: 30px;">訂位日期</th>
								<th scope="col" class='table-info' style="line-height: 30px;">用餐時間</th>
								<th scope="col" class='table-warning' style="line-height: 30px;">用餐人數</th>
								<!-- ===================== -->
								<th scope="col" colspan="2" class='table-success'
									style="line-height: 30px;"><div align="center">修改訂位</div></th>
								<th scope="col" class='table-danger' style="line-height: 30px;"><div
										align="center">刪除訂位</div></th>
								<th scope="col" colspan="2" class='table-info'
									style="line-height: 30px;"><div align="center">付費狀態</div></th>
							</tr>
						</thead>
						<tfoot>
						</tfoot>
						<tbody style="color: black;">
							<c:if test="${reservationList != null}">
								<c:forEach items="${reservationList}" var="reservationList"
									varStatus="vs">
									<tr align="center">
										<td style="font-size: larger; line-height: 50px;">${reservationList.customerName}</td>
										<td style="font-size: larger; line-height: 50px;">${reservationList.customerPhone}</td>
										<td style="font-size: larger; line-height: 50px;">${reservationList.dateTime}</td>
										<td style="font-size: larger; line-height: 50px;">${reservationList.time}</td>
										<td style="font-size: larger; line-height: 50px;">${reservationList.amount}&nbsp;位</td>
										<!-- ======================= -->
										<td style="font-size: larger; line-height: 50px;">
											<form method="post"
												action="<c:url value="/03/front/reservation/updateReservationInfo.ctrl"/>">
												<button name="updateInfoButton" type="submit"
													class="custom-button"
													value="${reservationList.reservationNo}">聯絡資訊</button>
												<Input type="hidden" name="reservationNo"
													value="${reservationList.reservationNo}">
											</form>
										</td>
										<td style="font-size: larger; line-height: 50px;">

											<form method="post"
												action="<c:url value="/03/front/reservation/updateReservationAmount.ctrl"/>">
												<button name="updateAmountButton" type="submit"
													class="custom-button"
													value="${reservationList.reservationNo}">用餐人數</button>
												<Input type="hidden" name="reservationNo"
													value="${reservationList.reservationNo}">
											</form>
										</td>
										<td style="font-size: larger; line-height: 50px;">
											<form method="post"
												action="<c:url value="/03/front/reservation/deleteReservation.ctrl"/>">
												<button name="deleteButton" type="submit"
													class="custom-button"
													value="${reservationList.reservationNo}">刪除訂位</button>
												<Input type="hidden" name="reservationNo"
													value="${reservationList.reservationNo}">
											</form>
										</td>
										<td
											style="font-size: larger; line-height: 50px; font-weight: bold;">
											<div align="center" style="vertical-align: middle;">
												<c:if test="${reservationList.payment == 0}">
													<span style="vertical-align: middle;">未付款</span>
												</c:if>
												<c:if test="${reservationList.payment == 1}">
													<span>已付款</span>
												</c:if>
											</div>
										</td>
										<td style="font-size: larger; line-height: 50px;">
											<div align="center">
												<c:if test="${reservationList.payment == 0}">
													<form method="post"
														action="<c:url value="/03/front/reservation/pay.ctrl"/>">
														<button name="payButton" type="submit"
															class="custom-button"
															value="${reservationList.reservationNo}">立即付款</button>
														<Input type="hidden" name="reservationNo"
															value="${reservationList.reservationNo}">
													</form>
												</c:if>
												<c:if test="${reservationList.payment == 1}">
													<form method="post"
														action="<c:url value="/03/front/reservation/cancelPayment.ctrl"/>">
														<button name="cancelButton" type="submit"
															class="custom-button"
															value="${reservationList.reservationNo}">取消付款</button>
														<Input type="hidden" name="reservationNo"
															value="${reservationList.reservationNo}">
													</form>
												</c:if>
											</div>
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
		</div>

		<!-- 圖片輪播區塊 -->
		<br> <br> <br>
		<div class=title>
			<h2 align="center" style="margin-top: 20px;">嚴選食材、特製甜點</h2>
		</div>
		<br>
		<!-- Start exibition Area -->
		<div align="center">
			<section class="exibition-area section-gap"
				style="background-color: #FFFFFF; padding-top: 30px; padding-bottom: 30px;"
				id="exhibitions">
				<div class="container">
					<div class="row">
						<div class="active-exibition-carusel">
							<div class="single-exibition item">
								<img class="wrapper-restaurant"
									src="<c:url value='/images/03/shabu01.jpg'/>" alt="">
							</div>
							<div class="single-exibition item">
								<img class="wrapper-restaurant"
									src="<c:url value='/images/03/shabu02.jpg'/>" alt="">
							</div>
							<div class="single-exibition item">
								<img class="wrapper-restaurant"
									src="<c:url value='/images/03/fruit01.jpg'/>" alt="">
							</div>
							<div class="single-exibition item">
								<img class="wrapper-restaurant"
									src="<c:url value='/images/03/fruit02.jpg'/>" alt="">
							</div>
							<div class="single-exibition item">
								<img class="wrapper-restaurant"
									src="<c:url value='/images/03/juice01.jpg'/>" alt="">
							</div>
							<div class="single-exibition item">
								<img class="wrapper-restaurant"
									src="<c:url value='/images/03/dessert01.jpg'/>" alt="">
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<!-- End exibition Area -->
		<!-- 輪播結束 -->


	</div>
</body>
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
</html>