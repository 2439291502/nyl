<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台编辑管理管理员登录</title>
<link rel="stylesheet" type="text/css" href="../css/editor_css.css" />
</head>
<body style="background:#fafafa">
	<div class="index_container">
		<div class="index_main">
			<div class="index_title">
				<h1>
					<span><a style="text-decoration: none;" href="../index/showIndex.do">《期刊稿件在线处理系统》  后台编辑管理管理员登录</a></span>
				</h1>
			</div>
			<div class="index_login">
				<form action="" id="formUser">
				<input type="hidden" name="" value="">
				<table width="400" cellspacing="0" cellpadding="0" border="0" align="center">
					<tbody>
						<tr>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td align="right">管理员用户名:</td>
							<td><input class="" type="text" value="" id="username" /><span id="showMsg"></span></td>
						</tr>
						<tr>
							<td align="right">管理员密 码:</td>
							<td><input class=" " type="password" value="" id="password" /><span id="showMsg"></span>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<input class="input_button" type="button" value="登录" id="bt-login" />
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
			<jsp:include page="../web/foot.jsp"></jsp:include>
		</div>
	</div>
		
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>
<script>
$(function(){
	 $("#username").blur(function(){
        var data = $("#username").val();
        if (data == null || data == "") {
            $("#showMsg").text("用户名不能为空！");
            $("#showMsg").css("color","red");
            return false;
        }
        $.ajax({
        	url:'../user/checkUsername.do',
        	data:"username="+encodeURIComponent(data),
            type:"post",
            dataType : "json",
            beforeSend:function(XMLHttpRequest)
            {
                $("#showMsg").text("正在查询");
                $("#showMsg").css("color","green");
            },
            success : function(obj) { 
				//显示服务器的响应信息
				if (obj.state == 0) {
					$("#showMsg").text("用户名验证成功");
					 $("#showMsg").css("color","green");
				} else {
					$("#showMsg").text("该用户名不存在");
					$("#showMsg").css("color","red");
				}
			},
            error:function()
            {
                //错误处理
            	location.href="../editor/showLogin.do";
            }
        });
    });  
	$('#bt-login').click(function(){
	    //异步提交请求，进行验证
	    //var formUser=$("formUser").val();
	    $.ajax({
	    	url:"../editor/login.do",
	    	data:"username="+$("#username").val()+
	    	     "&password="+$("#password").val(),
	    	type:"post",
	    	dataType : "json",
	    	success:function(obj){
	    		if(obj.state==0){
	    			alert(obj.message);
	    		}else{
	    			location.href="../editor/editorWorkdesk.do";
	    		}
	    	}
	    });
	});
	
});
</script>
</body>
</html>