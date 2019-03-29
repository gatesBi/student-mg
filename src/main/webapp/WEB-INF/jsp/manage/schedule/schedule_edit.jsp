<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="schedule/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SCHEDULE_ID" id="SCHEDULE_ID" value="${pd.SCHEDULE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">时间段:</td>
								<td>
									<select name="TIMEDURING" ID="TIMEDURING" style="width:98%;">
											<option value="">--请选择--</option>
											<option value="7:10-9:10" <c:if test="${pd.TIMEDURING=='7:10-9:10'}">selected</c:if>>7:10-9:10</option>
											<option value="9:40-11:40" <c:if test="${pd.TIMEDURING=='9:40-11:40'}">selected</c:if>>9:40-11:40</option>
											<option value="13:10-15:10" <c:if test="${pd.TIMEDURING=='13:10-15:10'}">selected</c:if>>13:10-15:10</option>
											<option value="15:30-17:30" <c:if test="${pd.TIMEDURING=='15:30-17:30'}">selected</c:if>>15:30-17:30</option>
											<option value="18:30-20:30" <c:if test="${pd.TIMEDURING=='18:30-20:30'}">selected</c:if>>18:30-20:30</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">年级:</td>
								<td>
									<select name="GRADE" ID="GRADE" style="width:98%;">
										<option value="">--请选择--</option>
										<c:forEach var="item" items="${gradeList }">
											<option value="${item.NAME }"
											<c:if test="${pd.GRADE==item.NAME}">selected</c:if>>
											${item.NAME }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学科:</td>
								<td>
									<select name="SUBJECT" ID="SUBJECT" style="width:98%;">
										<option value="">--请选择--</option>
										<c:forEach var="item" items="${subjectList }">
											<option value="${item.NAME }"
											<c:if test="${pd.SUBJECT==item.NAME}">selected</c:if>>
											${item.NAME }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">教室:</td>
								<td>
									<select name="CLASSROOM" ID="CLASSROOM" style="width:98%;">
										<option value="">--请选择--</option>
										<c:forEach var="item" items="${classroomList }">
											<option value="${item.NAME }"
											<c:if test="${pd.CLASSROOM==item.NAME}">selected</c:if>>
											${item.NAME }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">老师姓名:</td>
								<td><input type="text" name="TEATHER_NAME" id="TEATHER_NAME" value="${pd.TEATHER_NAME}" maxlength="20" placeholder="这里输入老师姓名" title="老师姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#TIMEDURING").val()==""){
				$("#TIMEDURING").tips({
					side:3,
		            msg:'请输入时间段',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TIMEDURING").focus();
			return false;
			}
			if($("#GRADE").val()==""){
				$("#GRADE").tips({
					side:3,
		            msg:'请输入年级',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRADE").focus();
			return false;
			}
			if($("#SUBJECT").val()==""){
				$("#SUBJECT").tips({
					side:3,
		            msg:'请输入学科',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECT").focus();
			return false;
			}
			if($("#TEATHER_NAME").val()==""){
				$("#TEATHER_NAME").tips({
					side:3,
		            msg:'请输入老师姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#TEATHER_NAME").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>