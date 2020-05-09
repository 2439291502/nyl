<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>期刊稿件高级检索</title>
<link rel="stylesheet" type="text/css" href="../css/index_css/index_css.css" />
</head>
<body>
	<div class="body">
		<jsp:include page="../web/index_head.jsp"></jsp:include>
		<div class="content">
			<jsp:include page="../web/index_left.jsp"></jsp:include>
			<div class="right2">
			<form method="post" action="../paper/selectPaper.do">
				<div class="advSearch">
					<div class="advSearch_title">高级检索</div>
					<div class="advSearch_Geduan"></div>
					<ul>
						<li>
							<span class="advSearch_name">年(Year)</span>
							<span class="advSearch_name_issue">
								<select id="year"  name="year" style="width:203px;height:30px;">
									<option value="" style="width:50px;">请选择年</option>
									<option value="2019" style="width:50px;">2019</option>
									<option value="2020" style="width:50px;">2020</option>
								</select>
							</span>							
						</li>
					 </ul>
					 <div class="advSearch_Geduan"></div>
					 <ul>
						<li>
							<span class="advSearch_name">期(Issue)</span>
							<span class="advSearch_name_issue">
								<select name="issue" style="width:203px;height:30px;">
									<option value="">请选择期</option>
									<option value="01">01</option>
									<option value="02">02</option>
								</select>
							</span>
						</li>
					</ul>
					<div class="advSearch_Geduan"></div>
					<ul>
						<li>
							<span class="advSearch_name">指定栏目(Column)</span>
							<input type="text" name="columns">
						</li>
					</ul>
					<div class="advSearch_Geduan"></div>
					<ul>
						<li>
							<span class="advSearch_name">作者(Author)</span>
							<input type="text" name="author">
							<span class="addInfo">检索文章中任意一个作者姓名。如，张三</span>
						</li>
					</ul>
					<div class="advSearch_Geduan"></div>
					<ul>
						<li>
							<span class="advSearch_name">单位(Unit)</span>
							<input type="text" name="workUnit">
							<span class="addInfo">检索文章中任意一个作者单位。如，大学</span>
						</li>
					</ul>
					<div class="advSearch_Geduan"></div>
					<ul>
						<li>
							<span class="advSearch_name">题目(Title)</span>
							<input type="text" name="title">
							<span class="addInfo">检索文章的题目（支持模糊查找）</span>
						</li>
					</ul>
					<div class="advSearch_Geduan"></div>
					<ul>
						<li>
							<span class="advSearch_name">摘要(Abstract)</span>
							<input type="text" name="abstracts">
							<span class="addInfo">检索文章的摘要（支持模糊查找）</span>
						</li>
					</ul>
					<div class="advSearch_Geduan"></div>
					<ul>
						<li>
							<span class="advSearch_name">关键词(KeyWord)</span>
							<input type="text" name="keywords">
							<span class="addInfo">检索文章的关键词（支持模糊查找）</span>
						</li>
					</ul>
					<div class="advSearch_Geduan"></div>
					<ul>
						<li>
							<span class="advSearch_name">学科类型(BookClass)</span>
							<select name="styleId" style="width:27%">
								<option value="0"></option>
								<option value="1">机械工程</option>
								<option value="2">精密仪器与机械</option>
								<option value="3">热能工程</option>
								<option value="4">汽车工程</option>
								<option value="5">航空航天工程</option>
								<option value="6">自动化</option>
								<option value="7">计算机</option>
								<option value="8">电子工程</option>
								<option value="9">微电子学</option>
								<option value="10">电机工程</option>
								<option value="11">工业工程</option>
								<option value="12">物理与工程物理</option>
								<option value="13">核能与新能源工程</option>
								<option value="14">化学和化学工程</option>
								<option value="15">生物与生物医学工程</option>
								<option value="16">数学</option>
								<option value="17">环境科学与工程</option>
								<option value="18">土木工程</option>
								<option value="19">建筑学与工程</option>
								<option value="20">材料科学与技术</option>
								<option value="21">经济管理与公共管理</option>
								<option value="22">水利水电工程</option>
								<option value="23">科学技术史</option>
								<option value="24">信息科学与技术</option>
								<option value="25">计算机科学与技术</option>
								<option value="26">建筑科学</option>
								<option value="27">生物与生物医学</option>
								<option value="28">经济与管理</option>
								<option value="29">微电子</option>
							</select>
							<span class="addInfo"> 检索文章的学科类型</span>
						</li>
					</ul>
					<div class="advSearch_Geduan"></div>
					<ul>
						<li>
							<span class="advSearch_name">排序(Sort)</span>
							<!-- <input type="radio" checked> -->
							<span class="addInfo"> 年，期/起始页(Year,Issue/Start Page)</span>
						</li>
					</ul>
					<div class="advSearch_contrl">
						<input type="reset" value="清除(Clear)">
						<input type="submit" id="selectPaper" value="查询(Search)">
					</div>
				</div>
				</form>
		   </div>
		</div>
	</div>
	<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>

<script>
	//updateComment
	$(function(){
		$('#year').click(function(){ 
			var year=$('#year').serialize();
			$.ajax({
				type : 'POST',
				url : '../paper/selectPaperYear.do',
				data : data,
				success : function() {
					
						location.href = "../editor/selectPaper.do";
					
				}
			});
			
		});
		/* $('#selectPaper').click(function() {
			var data = $("#paperFrom").serialize();
		
		console.log(data)
		$.ajax({
			type : 'POST',
			url : '../paper/selectPaper.do',
			data : data,
			success : function(obj) {
				if (obj.state == 1) {
					location.href = "../paper/showSelectResult.do";
				} else {
					location.href = "../paper/showSelectResult.do";
				}
			}
		});
	});  */
	//btnReturn
	$('#btnReturn').click(function() {
		var essayId=$('#essayId').val();
			location.href = "../editor/selectECommentById.do?essayId="+essayId;
	});
	});
</script>
	<jsp:include page="../web/foot.jsp"></jsp:include>
</body>
</html>