<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>版权转让</title>
<link rel="stylesheet" type="text/css" href="../css/author_css/author_deskwork.css"/>

	</head>
	<style>
		.contribute_request {
			padding: 10px 20px 20px 20px;
			background-color: #FFFFFF;
			width: 700px;
			margin-left: 230px;
			height: 550px;
		}
		
		.contribute_request p {
			margin: 5px;
			line-height: 20px;
		}
	</style>
<body>

</head>

<body>
<body>
	<div class="workdesk_body">
		<div class="workdesk_main">
		<jsp:include page="../author/author_head.jsp"></jsp:include>
		<div class="main contribute">
			<!-- <div class="contributeInfo1">
				协议转让书
				<p>
					提交新稿件（导航式） 注意：带(
					<font color="red">*</font>
					)的为必填项,各提示框的字符串计数方式为每个汉字按两个计
				</p>
			</div> -->
			<div class="work_left1">
				<div class="workAreaHead">
					<div class="stepName">
						<span style="font-weight: 700;">协议转让书</span>
					</div>
					<div class="contributeContent">						 									 
						<div class="contribute_request">
							<p style="text-align: center; font-size: 18px; font-weight: 700;">论文题目
							<p>英文：
							</p>
							<p>中文：
							</p>
							<p>论文作者:
							</p>
							<p>英文：
							</p>
							<p>中文：
							</p>
							<p>单位:
							</p>
							<p>英文：
							</p>
							<p>中文：
							</p>
							<p>作者保证拥有此文的全部版权(包括重印,翻译, 图象制作,微缩,电子制作和一切类似的重新制作), 同意将该论文投稿并发表到本杂志上。
							</p>
							<p>上述论文一旦在杂志上发表，作者同意将该论文的版权自动转让给编辑部，包括电子出版，多媒体出版，网络出版及以其它形式出版的权利。
							</p>
							<p>
							</p>
							<p>作者郑重承诺该论文为原始论文，文中全部或者部分内容从来没有以任何形式在其它任何刊物上发表过，不存在重复投稿问题，不存在任何剽窃、抄袭他人的行为，不包含任何违反法律法规以及侵害他人权益的内容。一旦发现本文涉及以上问题，编辑部为了维护科学道德规范和正常的出版秩序，有权对稿件进行退稿处理，有权在在教育科研领域内以及兄弟期刊范围内对该论文以及相关作者进行实名通告批评，有权通知有关单位对主要作者进行严肃的行政处罚。
							</p>
							<p>
							</p>
							<p>编辑部同意作者可以在下列情况下继续使用该论文：1）申请专利；2）学术报告和讲演；3）非商业性的学术交流；4）经编辑部允许并授权的其它活动。
							</p>
							<p>一旦该论文达不到杂志的发表要求，不能在杂志上发表，本协议自动失效。
							</p>
							<p>
							</p>
							<p>全体作者签名：
							</p>
							<p>
							</p>
							<p style="text-align: right;">年 月 日
							</p>
							<div class="linkcss">
								<a href="../essay/contributeNotice.do" style="cursor:hand;">
									<img src="../../img/author_img/btnPre.jpg" width="88" height="25"/>
								</a>
								<a href="../essay/copyrightAssignment.do" style="cursor:hand;">
									<img src="../../img/author_img/btnNext.jpg" width="88" height="25"/>
								</a>	
							</div>	
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<%-- <div class="workdesk_body">
	<div class="workdesk_main">
	<jsp:include page="../author/author_head.jsp"></jsp:include>
	<div class="work_left1">
		<div class="contribute_request">
			<p style="text-align: center; font-size: 18px; font-weight: 700;">论文题目
			<p>英文：
			</p>
			<p>中文：
			</p>
			<p>论文作者:
			</p>
			<p>英文：
			</p>
			<p>中文：
			</p>
			<p>单位:
			</p>
			<p>英文：
			</p>
			<p>中文：
			</p>
			<p>作者保证拥有此文的全部版权(包括重印,翻译, 图象制作,微缩,电子制作和一切类似的重新制作), 同意将该论文投稿并发表到本杂志上。
			</p>
			<p>上述论文一旦在杂志上发表，作者同意将该论文的版权自动转让给编辑部，包括电子出版，多媒体出版，网络出版及以其它形式出版的权利。
			</p>
			<p>
			</p>
			<p>作者郑重承诺该论文为原始论文，文中全部或者部分内容从来没有以任何形式在其它任何刊物上发表过，不存在重复投稿问题，不存在任何剽窃、抄袭他人的行为，不包含任何违反法律法规以及侵害他人权益的内容。一旦发现本文涉及以上问题，编辑部为了维护科学道德规范和正常的出版秩序，有权对稿件进行退稿处理，有权在在教育科研领域内以及兄弟期刊范围内对该论文以及相关作者进行实名通告批评，有权通知有关单位对主要作者进行严肃的行政处罚。
			</p>
			<p>
			</p>
			<p>编辑部同意作者可以在下列情况下继续使用该论文：1）申请专利；2）学术报告和讲演；3）非商业性的学术交流；4）经编辑部允许并授权的其它活动。
			</p>
			<p>一旦该论文达不到杂志的发表要求，不能在杂志上发表，本协议自动失效。
			</p>
			<p>
			</p>
			<p>全体作者签名：
			</p>
			<p>
			</p>
			<p style="text-align: right;">年 月 日
			</p>
			<div class="linkcss">
				<a href="../essay/paperCenter.do" style="cursor:hand;">
					<img src="../../img/author_img/btnReturn.jpg" width="98" height="25"/>
				</a>
				<a href="../essay/copyrightAssignment.do" style="cursor:hand;">
					<img src="../../img/author_img/btnNext.jpg" width="68" height="25"/>
				</a>	
			</div>	
		</div>
	</div>
		
	</div>	
</div> --%>
<jsp:include page="../../web/foot.jsp"></jsp:include>
</body>
</html>