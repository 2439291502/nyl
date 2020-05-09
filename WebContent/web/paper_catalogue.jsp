<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>期刊目录</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_paper_center.css"/>
<link rel="stylesheet" type="text/css" href="../css/all_paper_list.css" />
</head>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
			<jsp:include page="author_head.jsp"></jsp:include>
			<div class="main">
				<jsp:include page="../web/editor_paper_center_left.jsp"></jsp:include>
				<div class="work_left">
					<div class="workAreaHead">
						<div class="stepName">
							<span>后台信息管理中心</span><span>》》期刊管理中心》》</span><span style="font-weight: 700;">期刊目录</span>
						</div>
						<div class="stepHelpInfo">
							<div>
								请从左侧栏目导航中选择相应功能栏目完成处理操作
							</div>
						</div>
					</div>
					
					<div class="workTable">
					<div class="workTable_main">
						<table width="60%"  align="center" style="border: 1px solid black; border-collapse: collapse;">
							<c:forEach items="${yearList}" var="year">
							<tr>
								<td width="20%"><c:out value="${year.key}"></c:out></td>
								<c:choose>
									<c:when test="${fn:length(year.value)<2}">
										<td>	
										<span class="paper_link"><a href="../editor/selectPaperByYearAIssue?year=${year.key}&issue=01">01</a></span>
										</td>
									</c:when>
									<c:otherwise>
										<td>	
										<span class="paper_link"><a href="../editor/selectPaperByYearAIssue.do?year=${year.key}&issue=01">01</a></span>
										<span class="paper_link"><a href="../editor/selectPaperByYearAIssue.do?year=${year.key}&issue=02">02</a></span>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
							</c:forEach>
						</table>
					</div>
							
					</div>
				</div>
			</div>
		</div>
	</div>
 	<jsp:include page="../web/foot.jsp"></jsp:include>
	<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="../scripts/js/jquery-1.10.2.min.js"></script>
	
	<script type="text/javascript">
	
	$("#all").click(function() {
        $(":input[name='essayIds']").prop("checked", this.checked); // this指代的你当前选择的这个元素的JS对象
    });
    
	function toUpdate(){
		var chk_value = [];//定义一个数组
		
		//利用将name等于ids的多选按钮得到
		$("input[name='essayIds']:checked").each(function(){
			//将选中额数据存到数组里
			chk_value.push($(this).val());
			
		});
		/* console.log(chk_value)
		alert(chk_value); */
		if (chk_value.length == 0) {
		    alert("你还没有选择要删除的稿件！");
		}
		if (chk_value.length > 0) {
			console.log(chk_value)
			
			var statusId=$('#statusId').val();
			
		 	var pageCode=$('#pageCode').val();
			
		    location.href = "../essay/deleteEssayInfo.do?statusId="+statusId+"&essayIds="+chk_value+"&pageCode="+pageCode;
		}
		      
	}
	
	$('#jumpBtn').click(function(){
//		var statusId=$('#statusId').val();
		var pageCode=$('#jumpNumTxt').val();
		var pages=$('#pages').val();
		if(pageCode==''||pageCode>pages){
			alert("跳转页面不能为空或不存在！");
		}else{
			location.href="../editor/selectProduce.do?statusId=66&pageCode="+pageCode;

		}
	});
	
	</script>
</body>

</html>