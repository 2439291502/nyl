<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作者登录页面</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_login.css" />
</head>
<body style="background:#fafafa">
	<div class="index_container">
		<div class="index_main">
			<div class="index_title">
				<div class="index_title_left">
					<div class="index_title_right">
						<h1>
							<span><a style="text-decoration: none;" href="../index/showIndex.do">《期刊稿件在线处理系统》  作者登录</a></span>
						</h1>
					</div>
				</div>
			</div>
			<div class="index_nav">
				<div class="index_nav_left">
					<ul>
						<li>
							<a href="../web/contribute_request.jsp">投稿须知</a>
						</li>
						<li>
							<a href="../web/copyright_assignment.jsp">版权协议</a>
						</li>
						<li>
							<a href="../web/essay_mode.jsp">论文模板</a>
						</li>
						<li>
							<a href="../web/index.jsp">首页</a>
						</li>
						<li>
							<a href="../web/contact_us.jsp">联系方式</a>
						</li>
					</ul>
				</div>
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
							<td align="right">用户名:</td>
							<td><input class="" type="text" value="" id="username" /><span id="showMsg"></span></td>
						</tr>
						<tr>
							<td align="right">密 码:</td>
							<td><input class=" " type="password" value="" id="password" /><span id="showMsg"></span>
								<!-- <a href="#" style="display: inline; font-size: 12px;">忘记密码</a> -->
							</td>
						</tr>
						<tr>
							<td></td>
							<td>如果您已经注册帐号，请直接登录</td>
						</tr>
						<tr>
							<td align="right"></td>
							<td align="left">
								<input class="input_button" type="button" value="注册" id="register"/>
								<input class="input_button" type="button" value="登录" id="bt-login" />
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
			<div class="index_noise">
				<div class="index_noise_left">
					<div class="journal_surface">
						<!-- <img style="height:298px;width:213px;" /> -->
					</div>
				</div>
				<div class="index_noise_center">
					<table width="230" cellpadding="0" cellspacing="0" border="0" align="center">
						<tbody>
							<tr>
								<td>
									本刊鼓励您
									<a href="#">自荐为本刊审稿人</a>，请如实填写真实信息，我们会尽快给您回复。
								</td>
							</tr>
							<tr valign="middle">
								<td><span>如果您还没有帐号，请注册帐号</span></td>
							</tr>
							<tr>
								<td align="right">
									<input type="button" class="input_button" id="bt-register" value="注册" />
								</td>
							</tr>
							<tr>
								<td> 请您不要多次注册, 否则可能导致
									<br>您的信息查询不完整
								</td>
							</tr>
							<tr>
								<td>
									本系统的登录密码区分大小写
								</td>
							</tr>
						</tbody>		
					</table>
				</div>
				<div class="index_noise_right">
					<div class="IndexPageTipScrollCss">
						<div class="show">
							<p>在作者中心登录后，您可以：</p>
							<ol>
								<li>投稿</li>
								<li>跟踪查询您的稿件的信息</li>
								<li>与编辑部交流</li>
								<li>查询稿件缴费情况</li>
							</ol>
						</div>
					</div>

				</div>
			</div>
			

		</div>
		
	</div>
	<jsp:include page="../web/foot.jsp"></jsp:include>	
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
            	location.href="../user/showLogin.do";
            }
        });
    });  
	$('#bt-login').click(function(){
	    //异步提交请求，进行验证
	    //var formUser=$("formUser").val();
	    $.ajax({
	    	url:"../user/login.do",
	    	data:"username="+$("#username").val()+
	    	     "&password="+$("#password").val(),
	    	type:"post",
	    	dataType : "json",
	    	success:function(obj){
	    		if(obj.state==0){
	    			alert(obj.message);
	    		}else{
	    			/* Save(); */
	    			location.href="../essay/authorWorkDesk.do";
	    		}
	    	}
	    });
	});
	$('#register').click(function(){
		location.href="../user/showRegister.do";
	});
	$('#bt-register').click(function(){
		location.href="../user/showRegister.do";
	});
});
</script>
</body>
</html>