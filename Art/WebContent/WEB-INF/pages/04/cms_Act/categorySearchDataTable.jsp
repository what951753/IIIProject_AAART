<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>得藝的一天後台管理系統</title>
<style>
.page li {
	display: inline;
}

.no {
	width: 60px;
}

.title {
	width: 500px;
}

.site {
	width: 200px;
}

.date {
	width: 100px;
}

.do {
	width: 50px;
}

#search {
	width: 250px;
}
</style>
</head>
<body>
	<%-- 	<jsp:include page="/fragment/top.jsp" /> --%>
	<div class="container">
		<br> <br>
		<h1>後臺管理系統:修改活動資訊</h1>


<%-- 		<form method=GET action="<c:url value='/04/CMS/SearchAll.ctrl'/>"> --%>
<!-- 			<div class="form-row align-items-center"> -->
<!-- 				<div class="col-sm-3 my-1"> -->
<!-- 					<input type=TEXT name="searchString" class="form-control" -->
<!-- 						placeholder="" id="search"> -->
<!-- 				</div> -->
<!-- 				<div class="col-sm-3 my-1"> -->
<!-- 					<input type=SUBMIT value="查詢" class="btn btn-info" id="searchbut"> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</form> -->





		<button type="button" class="btn btn-info" value="button"
			onclick="location.href='<c:url value='/04/CMS/insert'/>'">新增活動</button>

		<c:set var="totalnum" value="${requestScope.totalnum}" />
		<c:set var="PerPage" value="${requestScope.PerPage}" />
		<c:set var="totalPages" value="${requestScope.totalPages}" />
		<c:set var="beginIndex" value="${requestScope.beginIndex}" />
		<c:set var="endIndex" value="${requestScope.endIndex}" />
		<c:set var="page" value="${requestScope.page}" />
		<c:set var="currentPage"
			value="${requestScope.key_list.subList(beginIndex,endIndex)}" />

<%-- 		<p>總筆數:${totalnum} 每頁筆數:${PerPage} 總頁數:${totalPages} 目前在第${page}頁</p> --%>
		<!-- 頂部按鈕	 -->
		<form method=GET action="<c:url value='/04/CMS/Category.ctrl'/>">
			<!-- 			<form method=GET action="04/CMS/Category.ctrl"> -->
			<br>
			<!-- 隱藏屬性 用來傳遞頁數 -->
<!-- 			<input type="hidden" name="page" value=""> -->

			<button name="category" type="submit" value="1" class="btn btn-info">音樂</button>
			<button name="category" type="submit" value="2" class="btn btn-info">戲劇</button>
			<button name="category" type="submit" value="3" class="btn btn-info">舞蹈</button>
			<button name="category" type="submit" value="4" class="btn btn-info">親子</button>
			<button name="category" type="submit" value="5" class="btn btn-info">獨立音樂</button>
			<button name="category" type="submit" value="6" class="btn btn-info">展覽</button>
			<button name="category" type="submit" value="7" class="btn btn-info">講座</button>
			<button name="category" type="submit" value="8" class="btn btn-info">電影</button>
			<button name="category" type="submit" value="11" class="btn btn-info">綜藝</button>
<!-- 			<button name="category" type="submit" value="13" class="btn btn-info">競賽</button> -->
<!-- 			<button name="category" type="submit" value="14" class="btn btn-info">徵選</button> -->
			<button name="category" type="submit" value="15" class="btn btn-info">其他</button>
<!-- 			<button name="category" type="submit" value="16" class="btn btn-info">科教</button> -->
			<button name="category" type="submit" value="17" class="btn btn-info">演唱會</button>
<!-- 			<button name="category" type="submit" value="19" class="btn btn-info">研習課程</button> -->
		</form><br><br>




		<table class="table table-bordered" id="dataTable" width="100%"
			cellspacing="0">
			<thead>
				<tr class="head">
					<th class="do">詳細</th>
					<th class="no">編號</th>
					<th class="title">節目名稱</th>
					<th class="site">場地</th>
					<th class="do" >操作</th>
					<th class="do"></th>
					<th class="do"></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th class="do">座位</th>
					<th class="no">編號</th>
					<th class="title">節目名稱</th>
					<th class="site">場地</th>
					<th class="do">操作</th>
					<th class="do"></th>
					<th class="do"></th>


				</tr>
			</tfoot>

			<tbody>
				<c:forEach items="${requestScope.key_list}" var="show"
					varStatus="idx">
					<!--<FORM> -->
					<tr>

						<td>
							<form name="order"
								action="<c:url value='/04/CMS/ShowActDetail.ctrl'/>" method="get">
								<button name="actno" type="submit" value=${show.no
									}
									class="btn btn-outline-info">詳細</button>
								<!-- 這些隱藏欄位都會送到後端 -->
<%-- 								<Input type='hidden' name='page' value='${page}'> --%>
								 <Input type='hidden' name='category' value='${category}'>
							</form>
						</td>
						<td>${show.no}</td>
						<td>${show.title}</td>
						<td>${show.site}</td>

						<td>
							<form name="order" action="<c:url value='/04/CMS/Update1.ctrl'/>"
								method="get">
								<button name="" type="submit" value=""
									class="btn btn-outline-info">修改</button>
								<!-- 這些隱藏欄位都會送到後端 -->
								<Input type='hidden' name='actno' value="${show.no}"> 
								<Input type='hidden' name='page' value='${page}'>
								<Input type='hidden' name='category' value='${category}'>
							</form>
						</td>

						<td>
							<form name="order" action="<c:url value='/04/CMS/Delete.ctrl'/>"
								method="get" >
								<!-- 這些隱藏欄位都會送到後端 -->
<%-- 								<Input type='hidden' name='page' value='${page}'>  --%>
								<Input type='hidden' name='actno' value='${show.no}'>
								<Input type='hidden' name='category' value='${category}'>
							</form>
				
								<button name="actno" type="button" class="btn btn-outline-info" onclick="del(${show.no},${category})">刪除</button>
						</td>
						<td>
							<form name="order"
								action="<c:url value='/04/CMS/seatSearch.ctrl'/>" method="get">
								<button name="actno" type="submit" value=${show.no
									}
									class="btn btn-outline-info">座位</button>
								<!-- 這些隱藏欄位都會送到後端 -->
<%-- 								<Input type='hidden' name='page' value='${page}'> --%>
								 <Input type='hidden' name='category' value='${category}'>
							</form>
						</td>

					</tr>
					<!--</FORM> -->
				</c:forEach>
			</tbody>

		</table>


	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>



	<script type="text/javascript">
// 	function del() { var msg = "是否刪除?"; if (confirm(msg) == true) { return
// 	true; } else { return false; } }
	
	function del(actid,category) {
				swal({
						  title: "是否刪除活動?",
						  text: "刪除為不可逆，請謹慎操作!",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
						.then((orderOK) => {
							  if (orderOK) {
								  swal("活動已刪除!", 
									    	{icon: "success",});  
								  setTimeout(function(){window.location="<c:url value='/04/CMS/Delete.ctrl?actno="+actid+"&category="+category+"' />"; },2000);
								 			
							  } else {
							    swal("操作已取消!");
							  }
							});
		 		
		 		}

	</script>
	<script>
	$(document).ready( function () {
	    $('#dataTable').DataTable({
	    	language: {
	    		search: "在表格中搜尋：",
	    		lengthMenu:"每頁顯示 _MENU_ 筆資料",
	    		zeroRecords: "没有符合的结果",
	    		info: "顯示第 _START_ 至 _END_ 項结果，共 _TOTAL_ 項",
	    		infoEmpty: "顯示第 0 至 0 項结果，共 0 項",
	    		paginate: {
	                first: "首頁",
	                previous: "上一頁",
	                next: "下一頁",
	                last: "末頁"
	            },
	            infoFiltered: "(已比對 _MAX_ 項結果)",
	    	
	    	}
	        	
	    } );
	} );
	</script>

</body>
</html>