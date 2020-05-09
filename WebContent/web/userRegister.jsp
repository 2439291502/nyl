<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册中心</title>
<link rel="stylesheet" type="text/css" href="../css/user_register.css" />
</head>
<body>
	<form id="userForm"><!-- style="display: inline;" -->
		<div class="register_box">
			<div class="register_title">
				<img src="../img/renyuan.png" width="34px" height="31px">
				<span class="span_title" >作者   &nbsp;&nbsp;&nbsp;&nbsp;注册--《期刊稿件在线处理系统》</span>

			</div>
			<div class="register_content">
				<div class="register_notice">
					<img src="../img/renyuan.png" width="34px" height="31px">
					<span class="span_title" > &nbsp;&nbsp;&nbsp;&nbsp;欢迎您在本刊注册、投稿   </span>

				</div>
				<div class="notice_info" style="border-bottom: none;">
					完成注册共有两个页面. 每个标记为(必须)的项目必须如实填写. 填写完成后, 请点击"下一步"按钮
				</div>
				<!-- <div class="notice_info">
					(2) 请不要重复注册. 系统根据E-mail来判断用户是否已经注册, 如果曾经注册, 请在登录页面点击“找回密码”, 系统将把您的注册账号信息发送到您注册时填写的邮箱中

				</div> -->
				<div class="register_info">
					
					<table class="register_table">
						<tr>
							<td class="table_td_one" colspan="3" height="28" align="left">登录信息／E-mail</td>

						</tr>
						<tr>
							<td class="table_td_left" width="20%" height="28" align="right">用户名：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<input class="input_text" type="text" name="username" id="username" value="">
								<!--用户名格式错误信息提示-->
								<span class="span_red"><font color="red">(*)</font>
								<span id="usernameMsg"></span></br>
								<span class="txt_666666" style="width:586px;height: 14px; color:#666666;font-size: 12px;">(用户名请用字母、数字、下划线等, 不支持引号、空格、星号、连续两个以上的下划线等. 长度不超过20个字符)</span>
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>
						</tr>
						<tr>
							<td class="table_td_left" width="20%" height="28" align="right">密码：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<input class="input_text" type="text" name="password" id="password" value="">
								<!--密码格式错误信息提示-->
								<span class="span_red"><font color="red">(*)</font></span>
								<span id="passwordMsg"></span><br>
								<span class="txt_666666" style="width:586px;height: 14px; color:#666666;font-size: 12px;">密码必须是字母、数字、下划线这几种中一种或者几种的集合，长度应该为2~20之间。</span>
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>

						</tr>
						<tr>
							<td class="table_td_left" width="20%" height="28" align="right">确认密码：</td>
							<td class="table_td_right" align="left">
								<input class="input_text" type="text" name="rePassword" id="rePassword" value="">
								<!--确认密码格式错误信息提示-->
								<span class="span_red"><font color="red">(*)</font></span>
								<span id="rePasswordMsg"></span></br>
								<span></span>
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>
						</tr>
						<tr>
							<td class="table_td_left" width="20%" height="28" align="right">首选E-mail：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<input class="input_text" type="text" name="email" id="email" value="">
								<!--密码格式错误信息提示-->
								<span class="span_red"><font color="red">(*)</font></span>
								<span id="emailMsg"></span></br>
								<span class="txt_666666" style="width:586px;height: 14px; color:#666666;font-size: 12px;">(在此输入您最常用的E-mail地址. 注意不要输入多个. 如果有多个E-mail, 请在抄送框中输入)</span>
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>

						</tr>
						<tr>
							<td class="table_td_left" width="20%" height="28" align="right">真实姓名：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<input class="input_text" type="text" name="trueName" id="trueName" value="">
								<!--用户名格式错误信息提示-->
								<span class="span_red"><font color="red">(*)</font></span>
								<span id="trueNameMsg"></span><br>
								<span class="txt_666666" style="width:586px;height: 14px; color:#666666;font-size: 12px;">(用户名请用字母、数字、下划线等, 不支持引号、空格、星号、连续两个以上的下划线等. 长度不超过20个字符)</span>
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>
						</tr>
						<tr>
							<td class="table_td_left" width="20%" height="28" align="right">性别：</td>
							<td class="table_td_right" colspan="2" align="left">
								<input type="radio" name="sex" class="sex" value="0" /><span style="margin-left:5px ;margin-right: 5px;">男</span>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="sex" class="sex" value="1" /><span style="margin-left:5px ;margin-right: 5px;">女</span>
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>
						</tr>
						<tr>
							<td class="table_td_one" colspan="3" height="28" align="left">研究领域</td>
						</tr>
						<tr>
							<td class="table_td_left" valign="top" width="20%" height="28" align="right">研究领域：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<select name="styleId" style="width:80%">
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
								<br>
								<br />
								<!--<span class="span_red"><font color="red">(*)</font></br>-->
								<span></span>
							</td>
							<tr>
								<td></td>
							</tr>

						</tr>
						<tr>
							<td class="table_td_left" valign="top" width="20%" height="28" align="right">研究方向：</td>
							<td class="table_td_right" colspan="2" align="left">
								<textarea style="width: 450px; height: 69px;" rows="4" cols="20" name="research" id="research"></textarea>
								<span class="span_red"><font color="red">(*)</font></span>
								<span id="researchMsg"></span><br>
								<span class="txt_666666" style="width:586px;height: 14px; color:#666666;font-size: 12px;">(请输入您近期的研究领域和您关注的研究方向)</span>
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>

						</tr>
						<tr>
							<td class="table_td_left" valign="top" width="20%" height="28" align="right">职称：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<select name="postId" id="postId" style="width:45%">
									<option value=""></option>
									<option value="1">院士</option>
									<option value="2">研究员</option>
									<option value="3">副研究员</option>
									<option value="4">教授</option>
									<option value="5">副教授</option>
									<option value="6">高级工程师</option>
									<option value="7">工程师</option>
									<option value="8">研究生</option>
									<option value="9">其他</option>
								</select>
								<br>
								<br />
							</td>
							<tr>
								<td></td>
							</tr>

						</tr>
						<tr>
							<td class="table_td_left" valign="top" width="20%" height="28" align="right">学历：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<select name="eBackgroundId" id="eBackgroundId" style="width:45%">
									<option value=""></option>
									<option value="1">博士</option>
									<option value="2">硕士</option>
									<option value="3">本科</option>
									<option value="4">专科</option>
									<option value="5">其他</option>
								</select>
								<br>
								<br />
							</td>
							<tr>
								<td></td>
							</tr>

						</tr>
						
						<tr>
							<td class="table_td_left" valign="top" width="20%" height="28" align="right">单位：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<input class="input_text" type="text" name="workUnit" id="workUnit" value="">
								<span class="span_red"><font color="red">(*)</font></span>
								<span id="workUnitMsg"></span><br>
								<span class="txt_666666" style="width:586px;height: 14px; color:#666666;font-size: 12px;">(请输入您完整单位信息, 不要用缩写. 长度不超过200个汉字)</span>
								<br>
								<br />
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>
						</tr>
						<tr>
							<td class="table_td_left" valign="top" width="20%" height="28" align="right">通讯地址：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<input class="input_text" type="text" name="address" id="address" value="">
								<!--用户名格式错误信息提示-->
								<span class="span_red"><font color="red">(*)</font></span>
								<span id="workUnitMsg"></span><br>
								<span class="txt_666666" style="width:586px;height: 14px; color:#666666;font-size: 12px;">(请输入详细的邮寄地址，如地址有误将无法收取发票、稿费及样刊，将无法投递)</span>
								<br>
								<br />
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>
						</tr>
						<tr>
							<td class="table_td_left" valign="top" width="20%" height="28" align="right">邮政编码：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<input class="input_text" type="text" name="postcode" id="postcode" value="">
								<!--用户名格式错误信息提示-->
								<span class="span_red"><font color="red">(*)</font></span>
								<span id="postcodeMsg"></span><br>
								<span class="txt_666666" style="width:586px;height: 14px; color:#666666;font-size: 12px;">(请输入您通讯地址对应的邮编)</span>
								<br>
								<br />
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>
						</tr>
						<tr>
							<td class="table_td_left" valign="top" width="20%" height="28" align="right">电话：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<input class="input_text" type="text" name="phone" id="phone" value="">
								<br>
								<span class="txt_666666" style="width:586px;height: 14px; color:#666666;font-size: 12px;">(如果有多个电话号码, 请标明并用分号分隔. 最多不超过150个字符))</span>
								<br>
								<br />
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>
						</tr>
						<tr>
							<td class="table_td_left" valign="top" width="20%" height="28" align="right">手机号码：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<input class="input_text" type="text" name="telephone" id="telephone" value="">
								<!--用户名格式错误信息提示-->
								<span class="span_red"><font color="red">(*)</font></span>
								<span id="telephoneMsg"></span><br>
								<span class="txt_666666" style="width:586px;height: 14px; color:#666666;font-size: 12px;"> (请输入一个确保可以联系到您并且可以接收短信的11位手机号码.)</span>
								<br>
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>
						</tr>
						<tr>
							<td class="table_td_left" valign="bottom" width="20%" height="28" align="right">是否申请为专家：</td>
							<td class="table_td_right" colspan="2" rowspan="2" align="left">
								<span style="margin-left:20px ;">否</span><input type="radio" name="applyExpert" value="0" />
								<span style="margin-left:20px ;">是</span><input type="radio" name="applyExpert" value="1" />
								
<!-- 								<input type="hidden" name="typeId" id="typeId" value="3" />
 -->							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>
						</tr>
						<!-- <tr>
							<td class="table_td_left" width="20%" height="28" align="right">验证码：</td>
							<td class="table_td_right" align="left">
								<input class="input_text" type="text" name="securityCode" value="">
								用户名格式错误信息提示
								<img src="../img/kaptcha.jpg" width="85px" height="28px">
								<span class="span_red">
								<a href="#" style="font-family: '微软雅黑';font-size: 14px;cursor:pointer;">点击刷新</a>
								<font color="red">(*)</font><br>
								</span>
								<br>
							</td>
							<tr>
								<td height="14" align="right"></td>
							</tr>
						</tr> -->

						<tr>
							<td width="28%"></td>
							<td width="65%" align="left"><input class="input_button" type="button" id="bt-reg" value="下一步" /></td>
						</tr>
						
					</table>
					
				</div>
			</div>
		</div>
	</form>
	
<script type="text/javascript" src="../scripts/jquery/jquery-1.4.4.min.js"></script>

<script>
$(function(){
	//用户名
	 $("#username").blur(function(){
        var username = $("#username").val();
      /*  console.log(data) */
        if (username == null || username == "") {
            $("#usernameMsg").text("用户名不能为空！");
            $("#usernameMsg").css("color","red");
           
            return false;
        }else if (username.length<3||username.length>17) {
        	 $("#usernameMsg").text("用户名长度为6~17位之间");
             $("#usernameMsg").css("color","red");
             
             return false;
		}else{
			$("#usernameMsg").text("用户名格式正确");
			$("#usernameMsg").css("color","green");
			 $.ajax({
		        	url:"../user/checkUsername.do",
		        	data:"username="+encodeURIComponent(username),
		            type:"post",
		            dataType : "json",
		            beforeSend:function(XMLHttpRequest)
		            {
		                $("#usernameMsg").text("正在查询");
		                $("#usernameMsg").css("color","green");
		            },
		            success : function(obj) 
		            { 
						//显示服务器的响应信息
						if (obj.state == 1) {
							$("#usernameMsg").text("该用户名可用");
							 $("#usernameMsg").css("color","green");
						} else {
							$("#usernameMsg").text("该用户名已存在");
							$("#usernameMsg").css("color","red");
							
						}
					},
		            error:function()
		            {
		                //错误处理
		            	location.href="../user/showLogin.do";
		            }
		        });
			}     
    });
	//用户密码
	 $("#password").blur(function(){
      var password = $("#password").val();
      console.log(password) 
        if (password == null || password == "") {
            $("#passwordMsg").text("密码不能为空！");
            $("#passwordMsg").css("color","red");
          
            return false;
        }else if (password.length<6||password.length>17) {
        	$("#passwordMsg").text("密码长度为6~17位之间");
        	$("#passwordMsg").css("color","red");
        	$("#password").focus();
        	$("#passwordMsg").className = 'msg-error'; 
		}else{
			$("#passwordMsg").text("密码格式正确");
			$("#passwordMsg").css("color","green");
		}     
    });
	//验证密码
	$("#rePassword").blur(function(){
        var rePassword = $("#rePassword").val();
        console.log(rePassword)
        if (rePassword == null || rePassword == "") {
            $("#rePasswordMsg").text("用户名不能为空！");
            $("#rePasswordMsg").css("color","red");
           
            return false;
        }else if (rePassword.length<6||rePassword.length>17) {
        	$("#rePasswordMsg").text("密码长度为6~17位之间");
            $("#rePasswordMsg").css("color","red");
            $("#rePassword").focus();
		}else if(rePassword != $("#password").val()){
			$("#rePasswordMsg").text("两次密码输入不一致");
			$("#rePasswordMsg").css("color","red");
			 $("#rePassword").focus();
			 			
		}else{
			$("#rePasswordMsg").text("密码格式正确");
			$("#rePasswordMsg").css("color","green");
		}     
    });
	//邮箱
	$("#email").blur(function(){
		var email = $("#email").val();
		//Email的正则表达式验证 			
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 			
		//获得验证后的结果 			
		var flag = reg.test(email); 
		console.log(flag)
		/* alert("是不是邮箱: "+flag);  */			 			
		//验证邮箱的合法性 	
		if (email == null || email == "") {
            $("#emailMsg").text("邮箱不能为空！");
            $("#emailMsg").css("color","red");
            $("#email").focus();
            return false;
        }else if(reg.test(email)){ 		
			$("#emailMsg").text("邮箱格式正确");
			$("#emailMsg").css("color","green");
		}else{ 				
			$("#emailMsg").text("邮箱格式错误");
			$("#emailMsg").css("color","red");	
			 $("#email").focus();
			 return false;
		} 			 		
	}); 	
	//真实姓名
	$("#trueName").blur(function(){
		var trueName = $("#trueName").val();
		if (trueName == null || trueName == "") {
            $("#trueNameMsg").text("请输入你的名字");
            $("#trueNameMsg").css("color","red");
            $("#trueName").focus();
            return false;
        }else{ 			
        	$("#trueNameMsg").text("谢谢配合");
            $("#trueNameMsg").css("color","green");  	
		} 			 		
	}); 
	//研究方向
	$("#research").blur(function(){
		var research = $("#research").val();
		if (research == null || research == "") {
            $("#researchMsg").text("请输入你的研究方向");
            $("#researchMsg").css("color","red");
            $("#research").focus();
            return false;
        }else{ 			
        	$("#researchMsg").text("谢谢配合");
            $("#researchMsg").css("color","green");  	
		} 			 		
	}); 
	//单位
	$("#workUnit").blur(function(){
		var workUnit = $("#workUnit").val();
		if (workUnit == null || workUnit == "") {
            $("#workUnitMsg").text("工作单位不能为空！");
            $("#workUnitMsg").css("color","red");
            $("#workUnit").focus();
            return false;
        }else{ 			
        	$("#workUnitMsg").text("谢谢配合");
            $("#workUnitMsg").css("color","green");  	
		} 			 		
	}); 
	//通讯地址验证
	$("#address").blur(function(){
		var address = $("#address").val();
		if (address == null || address == "") {
            $("#addressMsg").text("通讯地址不能为空！");
            $("#addressMsg").css("color","red");
            $("#address").focus();
            return false;
        }else{ 			
        	$("#addressMsg").text("谢谢配合");
            $("#addressMsg").css("color","green");  	
		} 			 		
	}); 
	//邮编验证
	$("#postcode").blur(function(){
		var postcode = $("#postcode").val();
		var pattern = /^[0-9]{6}$/;
	    flag = pattern.test(postcode);
        if (postcode == null || postcode == ""){   //邮政编码判断
	        $("#postcodeMsg").text("邮政编码不能为空");
   			$("#postcodeMsg").css("color","red");
			return false;
		}else if (!flag) {
			$("#postcodeMsg").text("请输入6位邮政编码");
	       	$("#postcodeMsg").css("color","red");
	       	$("#postcode").focus();
           	return false;
         }else{
			$("#postcodeMsg").text("邮政编码格式正确");
	       	$("#postcodeMsg").css("color","green");
         }
	}); 
	//电话号码
	$("#telephone").blur(function(){
		var telephone = $("#telephone").val();
		var pattern = /^[0-9]{11}$/;
	    flag = pattern.test(telephone);
        if (telephone == null || telephone == ""){   //邮政编码判断
	        $("#telephoneMsg").text("电话号码不能为空");
   			$("#telephoneMsg").css("color","red");
         	return false;
		}else if (!flag) {
			$("#telephoneMsg").text("请输入11位的电话号码");
	       	$("#telephoneMsg").css("color","red");
          	$("#telephone").focus();
           	return false;
         }else{
			$("#telephoneMsg").text("电话号码格式正确");
	       	$("#telephoneMsg").css("color","green");
         }
	}); 
	
	
	//注册提交
	$('#bt-reg').click(function(){
	    //异步提交请求，进行验证
	    var data=$('#userForm').serialize();
	    console.log(data)
	    $.ajax({
	    	type:'post',
	    	url:'../user/register.do',
	    	data :data,
	    	success:function(obj){
	    		
	    		if(obj.state==1){
	    			/* alert(3); */
	    			alert(obj.message);
	    			location.href="../user/showLogin.do";
	    		}if(obj.state==2){
	    			/* alert(3); */
	    			alert("专家"+obj.message);
	    			location.href="../professor/showLogin.do";
	    		}if(obj.state==0){
	    			/* alert(3); */
	    			alert(obj.message);
	    			location.href="../user/showRegister.do";
	    		}
	    	}
	    });

	});
});
</script>
</body>
</html>