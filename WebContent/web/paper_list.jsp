<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>过往期刊管理</title>
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
							<span>后台信息管理中心</span><span>》》期刊管理中心》》</span><span style="font-weight: 700;">过往期刊管理信息</span>
						</div>
						<div class="stepHelpInfo">
							<div>
								请从左侧栏目导航中选择相应功能栏目完成处理操作
							</div>
						</div>
					</div>
					
					<div class="workTable">
					<div class="workTable_main">
						 <h3 align="center" class="paper_title">期刊列表</h3>
						 <c:forEach items="${paperList}" var="paper">
 						 <h4 class="list_columns">${paper.columns}</h4>
 						 <ul class="contbox_list1">
					 		<li>
								<h3 align="center">
									<a href="#" title="复制稿件标题">
										<font style="font-size:15px;">${paper.essay.title}</font>
									</a>
								</h3> 
								<br>
								<span>作者：${paper.essay.username}</span> 
								<span style="color: #000000;">
								${paper.year}年${paper.issue}期 
								 [下载次数 <font color="red">${paper.downTime}</font>]
								 [浏览次数 <font color="red">${paper.readTime}</font>]
							</span> 
							<div class="operate_link">
								<a href="../paper/selectPaperDetails.do?paperId=${paper.paperId}">【在线阅读】</a>
								<a href="../essay/download.do?contentUrl=${essayInfo.contentUrl}">【下载文档】</a>
							</div>	
							</li>
						</ul>
						</c:forEach>
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