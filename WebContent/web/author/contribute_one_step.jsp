<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>一步投稿</title>
<link rel="stylesheet" type="text/css" href="../../css/author_css/author_paper_center.css"/>
</head>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
		<jsp:include page="../author/author_head.jsp"></jsp:include>
		<div class="main contribute">
			<div class="contributeInfo1">
				投稿
				<p>
					提交新稿件（导航式） 注意：带(
					<font color="red">*</font>
					)的为必填项,各提示框的字符串计数方式为每个汉字按两个计
				</p>
			</div>
			<div class="upload">
				<div class="upload_content">
					<table width=1000; style="margin-left: 55px; margin-bottom: 20px;border:1px solid #D4D4D4">
						<tbody>
							<tr>
								<th>文件序号</th>
								<th>文件类型</th>
								<th>文件名</th>
								<th>文件大小</th>
								<th>上传时间</th>
								<th>下载</th>
							</tr>
							<tr>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
							</tr>

						</tbody>
					</table>

				</div>
				<form>
				<div class="upload_content">
					<span id="originalTip" class="onShow">请上传原稿全文<b><font color="red">(*)</font></b></span>
					<input class="graybutton_small" type="file" value="选择文件">
					<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span><br/>
				</div>
				<div class="upload_content">
					<span id="originalTip" class="onShow">中文标题<b><font color="red">(*)</font></b></span>
					<input class="btn_content" type="text" value="">
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip" class="onShow">英文标题<b><font color="red">(*)</font></b></span>
					<input class="btn_content" type="text" value="">
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip1" class="onShow">中文摘要<b><font color="red">(*)</font></b></span>
					<textarea cols="20" rows="8" style="width: 470px;margin-bottom: 10px;"></textarea>
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip1" class="onShow">英文摘要<b><font color="red">(*)</font></b></span>
					<textarea cols="20" rows="8" style="width: 470px;margin-bottom: 10px;"></textarea>
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip" class="onShow">关键词<b><font color="red">(*)</font></b></span>
					<input class="btn_content" type="text" value="">
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip" class="onShow">发票信息<b><font color="red">(*)</font></b></span>
					<input class="btn_content" type="text" value="">
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip1" class="onShow">参考文献<b><font color="red">(*)</font></b></span>
					<textarea cols="20" rows="8" style="width: 470px;margin-bottom: 10px;"></textarea>
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>
				<div class="upload_content">
					<span id="originalTip" class="onShow">基金类别<!--<b><font color="red">(*)</font></b>--></span>
					<input class="btn_content" type="text" value="">
					<!--<span style="width:auto;line-height:22px;">(每种类型的文件只能上传一次，如果上传有误，请删除后重新上传)</span>-->
				</div>

				<div class="upload_content">
					<table width=1000; style="margin-left: 55px; margin-bottom: 20px;border:1px solid #D4D4D4" border="1">
						<tbody>
							<tr>
								<th>文件序号</th>
								<th>通讯作者</th>
								<th>作者姓名</th>
								<th>工作单位</th>
								<th>部门或院系</th>
								<th>地址及邮编</th>
								<th>手机或电话号码</th>
								<th>email</th>
								<th>删除</th>
							</tr>
							<tr>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
							</tr>
						</tbody>
					</table>
				</div>
				</form>
				<div class="linkcss">
					<a href="../../essay/copyrightAssignment.do" style="cursor:hand;">
						<img src="../../img/author_img/btnPre.jpg" width="78" height="25"/>
					</a>
					<a href="../../essay/contributeSuccess.do" style="cursor:hand;">
						<img src="../../img/author_img/btnNext.jpg" width="78" height="25"/>
					</a>	
				</div>
			</div>
	   </div>
	   </div>
	   </div>
<jsp:include page="../../web/foot.jsp"></jsp:include>
</body>
</html>