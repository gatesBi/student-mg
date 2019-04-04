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
					
					<form action="seat/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SEAT_ID" id="SEAT_ID" value="${pd.SEAT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">排</td>
								<td><input type="text" name="SEAT_ROW" id="SEAT_ROW" value="${pd.SEAT_ROW}" maxlength="3" placeholder="这里输入排" title="排" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">列</td>
								<td><input type="text" name="SEAT_COLUMN" id="SEAT_COLUMN" value="${pd.SEAT_COLUMN}" maxlength="3" placeholder="这里输入列" title="列" style="width:98%;"/></td>
							</tr>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">列</td>
								<td><input type="text" name="CLASS_ID" id="CLASS_ID" value="${pd.CLASS_ID}" maxlength="36" placeholder="这里输入班级id" title="班级id" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">教室</td>
								<td>
									<select name="CLASSROOM_ID" ID="CLASSROOM_ID" style="width:98%;">
										<c:forEach var="item" items="${classroomList }">
											<option value="${item.CLASSROOM_ID }"
											<c:if test="${pd.CLASSROOM_ID==item.CLASSROOM_ID}">selected</c:if>>
											${item.NAME }
											</option>
										</c:forEach>
									</select>
								</td>
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
			if($("#SEAT_ROW").val()==""){
				$("#SEAT_ROW").tips({
					side:3,
		            msg:'请输入排',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ROW").focus();
			return false;
			}
			if($("#SEAT_COLUMN").val()==""){
				$("#SEAT_COLUMN").tips({
					side:3,
		            msg:'请输入列',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COLUMN").focus();
			return false;
			}
			if($("#CLASSROOM_ID").val()==""){
				$("#CLASSROOM_ID").tips({
					side:3,
		            msg:'请选择教室',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CLASSROOM_ID").focus();
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