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
					<div class="col-xs-12" id="app">
					
					<form action="student/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STUDENT_ID" id="STUDENT_ID" value="${pd.STUDENT_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">学号:</td>
								<td><input type="text" name="CODE" id="CODE" value="${pd.CODE}" maxlength="36" placeholder="这里输入学号" title="学号" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">姓名:</td>
								<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="10" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
							</tr>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">年龄:</td>
								<td><input type="number" name="AGE" id="AGE" value="${pd.AGE}" maxlength="3" placeholder="这里输入年龄" title="年龄" style="width:98%;"/></td>
							</tr> --%>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
								<td>
									<select name="GENDER" ID="GENDER" style="width:98%;">
										<option value="">--请选择--</option>
										<option value="M" <c:if test="${pd.GENDER=='M'}">selected</c:if>>--男--</option>
										<option value="F" <c:if test="${pd.GENDER=='F'}">selected</c:if>>--女--</option>
									</select>
								</td>
							</tr> --%>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">住址:</td>
								<td><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="500" placeholder="这里输入住址" title="住址" style="width:98%;"/></td>
							</tr> --%>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="number" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="18" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">年级:</td>
								<td>
									<select name="GRADE_ID" ID="GRADE_ID" style="width:98%;">
										<option value="">--请选择--</option>
										<c:forEach var="item" items="${gradeList }">
											<option value="${item.GRADE_ID }"
											<c:if test="${pd.GRADE_ID==item.GRADE_ID}">selected</c:if>>
											${item.NAME }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">科目时间段:</td>
								<td><input type="text" name="SUBJECT_TIME_PERIOD" id="SUBJECT_TIME_PERIOD" value="${pd.SUBJECT_TIME_PERIOD}" maxlength="50" placeholder="这里输入科目时间段" title="科目时间段" style="width:98%;"/></td>
							</tr> --%>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否缴费:</td>
								<td>
									<select name="IS_PAY" ID="IS_PAY" style="width:98%;">
										<option value="">--请选择--</option>
										<option value="Y" <c:if test="${pd.IS_PAY=='Y'}">selected</c:if>>是</option>
										<option value="N" <c:if test="${pd.IS_PAY=='N'}">selected</c:if>>否</option>
									</select>
								</td>
							</tr> --%>
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">缴费金额:</td>
								<td><input type="number" name="PAYMENT_AMOUNT" id="PAYMENT_AMOUNT" value="${pd.PAYMENT_AMOUNT}" maxlength="10" placeholder="这里输入缴费金额" title="缴费金额" style="width:98%;"/></td>
							</tr> --%>
							
							<tr>
								<td colspan="2" style="text-align: left;;padding-top: 13px;">
									<div>
										<span style="color:red">添加时间段、年级、科目、老师信息</span>
										<a class="btn btn-mini btn-primary" onclick="savesubtea();">添加</a>
									</div>
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">年级:</td>
								<td>
									<select v-model="GRADE" name="GRADE" ID="GRADE" style="width:98%;" onchange="changeGrade()">
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
								<td style="width:75px;text-align: right;padding-top: 13px;">时间段</td>
								<td>
									<select v-model="TIMEDURING" name="TIMEDURING" ID="TIMEDURING" style="width:98%;" onchange="changeParam()">
										<option value="">--请选择--</option>
										<%-- <c:forEach var="item" items="${timeduringlist }">
											<option value="${item.TIMEDURING }"
											<c:if test="${pd.TIMEDURING==item.TIMEDURING}">selected</c:if>>
											${item.TIMEDURING }</option>
										</c:forEach> --%>
										<option v-for="timeduring in timeduringlist">{{subject.TIMEDURING}}</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">科目</td>
								<td>
									<select v-model="SUBJECT" name="SUBJECT" ID="SUBJECT" style="width:98%;" onchange="changeParam()" disabled>
										<option value="">--请选择--</option>
										<%-- <c:forEach var="item" items="${subjectlist }">
											<option value="${item.NAME }">${item.NAME }</option>
										</c:forEach> --%>
										<option v-for="subject in subjectlist">{{subject.TIMEDURING}}</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">老师</td>
								<td>
									<select v-model="TEATHER" name="TEATHER" ID="TEATHER" style="width:98%;" onchange="changeParam()" disabled>
										<option value="">--请选择--</option>
										<c:forEach var="item" items="${teatherlist }">
											<option value="${item.NAME }">${item.NAME }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							
							
							<tr>
								<td colspan="2">
									<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
										<thead>
											<tr>
												<th class="center">老师</th>
												<th class="center">科目</th>
												<th class="center">操作</th>
											</tr>
										</thead>
										<tbody id="teasublist">
										</tbody>
									</table>
								</td>
							</tr>
							<input type="hidden" id="TEAANDSUBINFO" name="TEAANDSUBINFO" />
							<input type="hidden" id="KEYINFO" name="KEYINFO" />
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
	<script type="text/javascript" src="static/js/vuejs/vuejs-2.5.16.js"></script>
	<script type="text/javascript" src="static/js/vuejs/axios-0.18.0.js"></script>
	
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#CODE").val()==""){
				$("#CODE").tips({
					side:3,
		            msg:'请输入学号',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CODE").focus();
			return false;
			}
			if($("#NAME").val()==""){
				$("#NAME").tips({
					side:3,
		            msg:'请输入姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			return false;
			}
			if($("#AGE").val()==""){
				$("#AGE").tips({
					side:3,
		            msg:'请输入年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AGE").focus();
			return false;
			}
			if($("#GENDER").val()==""){
				$("#GENDER").tips({
					side:3,
		            msg:'请输入性别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GENDER").focus();
			return false;
			}
			if($("#ADDRESS").val()==""){
				$("#ADDRESS").tips({
					side:3,
		            msg:'请输入住址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS").focus();
			return false;
			}
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			}
			if($("#GRADE_ID").val()==""){
				$("#GRADE_ID").tips({
					side:3,
		            msg:'请选择年级',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRADE_ID").focus();
			return false;
			}
			if($("#SUBJECT_TIME_PERIOD").val()==""){
				$("#SUBJECT_TIME_PERIOD").tips({
					side:3,
		            msg:'请输入科目时间段',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECT_TIME_PERIOD").focus();
			return false;
			}
			/* if($("#IS_PAY").val()==""){
				$("#IS_PAY").tips({
					side:3,
		            msg:'请选择是否缴费',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#IS_PAY").focus();
			return false;
			}
			if($("#PAYMENT_AMOUNT").val()==""){
				$("#PAYMENT_AMOUNT").tips({
					side:3,
		            msg:'请输入缴费金额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PAYMENT_AMOUNT").focus();
			return false;
			} */
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		var teaSubArray = [];//值
		var keyArray = [];//key的数组
		function savesubtea(){
			var teatherValue = $("#TEATHER").val();
			var subjectValue = $("#SUBJECT").val();
			var teatheroptions=$("#TEATHER option:selected");
			var teatherText = teatheroptions.text();
			var subjectoptions = $("#SUBJECT option:selected");
			var subjectText = subjectoptions.text();
			
			$("#TEATHER").val("");
			$("#SUBJECT").val("");
			var dateStr=dateToString(new Date());
			$("#teasublist").append(
			"<tr>"
			+"<td class='center'>"+teatherText+"</td>"
			+"<td class='center'>"+subjectText+"</td>"
			+"<td class='center'>"
				+"<div class=\"hidden-sm hidden-xs btn-group\">"
					+"<input type=\"hidden\" value=\""+dateStr+ "\" />"
					+"<a class=\"btn btn-xs btn-danger\" onclick=\"delst(this);\">"
						+"<i class=\"ace-icon fa fa-trash-o bigger-120\" title=\"删除\"></i>"
					+"</a>"
				+"</div>"
				+"</td>"
				+"</tr>"
			)
			
			var obj = {
				"TEATHER_ID":teatherValue,
				"SUBJECT_ID":subjectValue
			};
			var obj1 = {};
			//obj1["\""+dateStr+"\""]=obj;
			obj1[dateStr]=obj;
			teaSubArray.push(obj1);
			var teaSubstr = JSON.stringify(teaSubArray);
			$("#TEAANDSUBINFO").val(teaSubstr);
			keyArray.push(dateStr);
			var keyArrayStr = JSON.stringify(keyArray);
			$("#KEYINFO").val(keyArrayStr);
		}
		
		function delst(r){
			var str = r.previousSibling;
			var key = str.value;//取得要删除的key值
			var i=r.parentNode.parentNode.parentNode.rowIndex;
			document.getElementById('teasublist').deleteRow(i-1);
			for(var i =0;i<teaSubArray.length;i++){
				if(teaSubArray[i][key] != null){
				  //delete teaSubArray[i];
				  teaSubArray.splice(i,1);
				  keyArray.splice(i,1);
				  //delete keyArray[i];
				}
			} 
		}
		
		function dateToString(now){
		    var year = now.getFullYear();
		    var month =(now.getMonth() + 1).toString();
		    var day = (now.getDate()).toString();
		    var hour = (now.getHours()).toString();
		    var minute = (now.getMinutes()).toString();
		    var second = (now.getSeconds()).toString();
		    var millisecond = (now.getMilliseconds()).toString();
		    if (month.length == 1) {
		        month = "0" + month;
		    }
		    if (day.length == 1) {
		        day = "0" + day;
		    }
		    if (hour.length == 1) {
		    	hour = "0" + hour;
		    }
		    if (minute.length == 1) {
		    	minute = "0" + minute;
		    }
		    if (second.length == 1) {
		    	second = "0" + second;
		    }
		    if (millisecond.length == 1) {
		    	second = "00" + second;
		    }
		    if (millisecond.length == 2) {
		    	second = "0" + second;
		    }
		     var dateTime = year + month + day + hour + minute + second + millisecond;
		     return dateTime;
		}
		
		function changeParam(){
			var grade = $("#GRADE").val();
			var timeduring = $("#TIMEDURING").val();
			var subject = $("#SUBJECT").val();
			var teather = $("#TEATHER").val();
			$.ajax({
			    url: "<%=basePath%>student/getParams",
			    data: {
			    	GRADE: grade,
			    	TIMEDURING: timeduring,
			    	SUBJECT: subject,
			    	TEATHER: teather,
			    	},
			    type: "POST",
			    dataType: "json",
			    success: function(data) {
			        // data = jQuery.parseJSON(data);  //dataType指明了返回数据为json类型，故不需要再反序列化
			    }
			});
		}
		
		function changeGrade(){
			if($("#GRADE").val() != ''){
				$("#TIMEDURING").attr("disabled",false);
				$("#SUBJECT").attr("disabled",false);
				$("#TEATHER").attr("disabled",false);
			}else{
				$("#TIMEDURING").attr("disabled",true);
				$("#SUBJECT").attr("disabled",true);
				$("#TEATHER").attr("disabled",true);
				$("#TIMEDURING").val('');
				$("#SUBJECT").val('');
				$("#TEATHER").val('');
			}
		}
		
		$(function() {
			$("#GRADE").trigger("change");
			$("#TIMEDURING").trigger("change");
			$("#SUBJECT").trigger("change");
			$("#TEATHER").trigger("change");
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			<%-- $("#SUBJECT").change(function(){
				var subject = this.val();
				$.ajax({
				  type: "post",
				  url: "<%=basePath%>student/getTeather.do",
				  dataType: "json",
				  data:{
					  SUBJECT_ID:subject
				  },
				});
			}) --%>
		});
		
		var vm = new Vue({
			  el: '#app',
			  data: {
				  GRADE:'',
				  SUBJECT:'',
				  TEATHER:'',
				  GRADE:'',
				  subjectlist:[],
				  teatherlist:[],
				  timeDuringlist:[],
			  },
			  methods:{
				  changeParam:function(){
					  var that = this;
					  var url = '<%=basePath%>student/getTeather.do';
					  var param = {
							  GRADE:that.GRADE,
							  SUBJECT:that.SUBJECT,
							  SUBJECT:that.SUBJECT,
							  SUBJECT:that.SUBJECT,
					  };
					  axios.post(url, {
					    firstName: 'Fred',
					    lastName: 'Flintstone'
					  })
					  .then(function (response) {
					    console.log(response);
					  }).catch(function (error) {
					    console.log(error);
					  });
				  }
			  }
			})
		</script>
</body>
</html>