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
	<link rel="stylesheet" href="//unpkg.com/element-ui@2.7.0/lib/theme-chalk/index.css" />
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
								<td style="width:75px;text-align: right;padding-top: 13px;">年级:</td>
								<td>
									<select v-model="GRADE" name="GRADE" ID="GRADE" style="width:98%;" @change="changeGrade">
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
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="number" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="18" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
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
										<a class="btn btn-mini btn-primary" @click="addStudentList">添加</a>
									</div>
								</td>
							</tr>
							
							<%-- <tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">年级:</td>
								<td>
									<select v-model="GRADE" name="GRADE" ID="GRADE" style="width:98%;" @change="changeGrade">
										<option value="">--请选择--</option>
										<c:forEach var="item" items="${gradeList }">
											<option value="${item.NAME }"
											<c:if test="${pd.GRADE==item.NAME}">selected</c:if>>
											${item.NAME }</option>
										</c:forEach>
									</select>
								</td>
							</tr> --%>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">科目</td>
								<td>
									<select v-model="SUBJECT" name="SUBJECT" ID="SUBJECT" style="width:98%;" @change="changeParam()" disabled>
										<option value="">--请选择--</option>
										<%-- <c:forEach var="item" items="${subjectlist }">
											<option value="${item.NAME }">${item.NAME }</option>
										</c:forEach> --%>
										<option v-for="subject in subjectlist">{{subject.NAME}}</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">时间段</td>
								<td>
									<select v-model="TIMEDURING" name="TIMEDURING" ID="TIMEDURING" style="width:98%;" @change="changeParam()" disabled>
										<option value="">--请选择--</option>
										<%-- <c:forEach var="item" items="${timeduringlist }">
											<option value="${item.TIMEDURING }"
											<c:if test="${pd.TIMEDURING==item.TIMEDURING}">selected</c:if>>
											${item.TIMEDURING }</option>
										</c:forEach> --%>
										<option v-for="timeduring in timeDuringlist" v-bind:value="timeduring.TIMEDURING">{{timeduring.TIMEDURING}}</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">老师</td>
								<td>
									<select v-model="TEATHER" name="TEATHER" ID="TEATHER" style="width:98%;" @change="changeParam()" disabled>
										<option value="">--请选择--</option>
										<%-- <c:forEach var="item" items="${teatherlist }">
											<option value="${item.NAME }">${item.NAME }</option>
										</c:forEach> --%>
										<option v-for="teather in teatherlist">{{teather.NAME}}</option>
									</select>
								</td>
							</tr>
							
							
							<!-- <tr>
								<td colspan="2">
									<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
										<thead>
											<tr>
												<th class="center">年级</th>
												<th class="center">科目</th>
												<th class="center">时间段</th>
												<th class="center">老师</th>
												<th class="center">操作</th>
											</tr>
										</thead>
										<tbody id="teasublist">
										</tbody>
									</table>
								</td>
							</tr> -->
							<input type="hidden" v-model="teaSubJsonString" id="TEAANDSUBINFO" name="TEAANDSUBINFO" />
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						
						
						<el-table
						    :data="tableData"
						    :key="STUDENTLIST_ID"
						    style="width: 100%"
						    max-height="250">
						    <el-table-column
						      prop="GRADE"
						      label="年级"
						      width="200">
						    </el-table-column>
						    <el-table-column
						      prop="SUBJECT"
						      label="科目"
						      width="120">
						    </el-table-column>
						    <el-table-column
						      prop="TIMEDURING"
						      label="时间段"
						      width="200">
						    </el-table-column>
						    <el-table-column
						      prop="TEATHER"
						      label="老师"
						      width="220">
						    </el-table-column>
						    <el-table-column
						      label="操作"
						      width="220">
						      <template slot-scope="scope">
						        <el-button
						          @click.native.prevent="deleteRow(scope.$index, scope.row)"
						          type="text"
						          size="small">
						          	移除
						        </el-button>
						      </template>
						    </el-table-column>
						  </el-table>
						
						
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
	<script type="text/javascript" src="static/element/index.js"></script>
	
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
			/* if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			} */
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
		
		$(function() {
			$("#GRADE").trigger("change");
			$("#SUBJECT").trigger("change");
			$("#TIMEDURING").trigger("change");
			$("#TEATHER").trigger("change");
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		
		var vm = new Vue({
			  el: '#app',
			  data: {
				  GRADE:'',
				  SUBJECT:'',
				  TIMEDURING:'',
				  TEATHER:'',
				  STUDENTLIST_ID:'',
				  subjectlist:[],
				  teatherlist:[],
				  timeDuringlist:[],
				  tableData:[],
				  newAddData:[],
				  teaSubJsonString:'',
			  },
			  created:function(){
				  /* this.subjectlist=[];
				  this.teatherlist=[];
				  this.timeDuringlist=[]; */
				  this.GRADE = '${pd.GRADE}';
				  this.changeParam();
				  if(this.GRADE != '' && this.GRADE != null){
					    $("#TIMEDURING").attr("disabled",false);
						$("#SUBJECT").attr("disabled",false);
						$("#TEATHER").attr("disabled",false);
				  }
				  this.tableData = ${pd.childList};
			  },
			  methods:{
				  deleteRow:function(index, rows) {
					var that = this;
			        var url = '<%=basePath%>student/deleteStudentList.do';
			        var param = rows;
			        axios.post(url, param)
					  .then(function (response) {
						  //rows.splice(index, 1);
						  that.tableData.splice(index, 1);
						  //that.tableData.splice(index, 1);
						  /* if(that.newAddData.length>0){
							  for(var i=0;i<that.newAddData.length;i++){
								  for(var j=0;j<that.tableData.length;j++){
									  if(that.newAddData[i].GRADE == that.newAddData[j].GRADE && 
										  that.newAddData[i].TIMEDURING == that.newAddData[j].TIMEDURING &&
										  that.newAddData[i].SUBJECT == that.newAddData[j].SUBJECT &&
										  that.newAddData[i].TEATHER == that.newAddData[j].TEATHER){
										  that.newAddData.splice(i, 1);
									  }
								  }
							  }
						  } */
						  if(that.newAddData.length>0){
							  for(var i=0;i<that.newAddData.length;i++){
								  if(that.newAddData[i].GRADE == rows.GRADE && 
									  that.newAddData[i].TIMEDURING == rows.TIMEDURING &&
									  that.newAddData[i].SUBJECT == rows.SUBJECT &&
									  that.newAddData[i].TEATHER == rows.TEATHER){
									  that.newAddData.splice(i, 1);
								  }
							  }
						  }
						  that.teaSubJsonString = JSON.stringify(that.newAddData);
					  }).catch(function (error) { 
					    console.log(error);
					  });
			      },
				  changeParam:function(){
					  var that = this;
					  var url = '<%=basePath%>student/getParams.do';
					  var param = {
							  GRADE:that.GRADE,
							  SUBJECT:that.SUBJECT,
							  TIMEDURING:that.TIMEDURING,
							  TEATHER:that.TEATHER,
					  };
					  axios.post(url, param)
					  .then(function (response) {
						  var result = response.data;
						  that.subjectlist = result.subjectlist;
						  that.timeDuringlist = result.timeDuringlist;
						  that.teatherlist = result.teatherlist;
					    console.log(response);
					  }).catch(function (error) { 
					    console.log(error);
					  });
				  },
				  
				  changeGrade:function(){
					  	var that = this;
						if($("#GRADE").val() != ''){
							$("#TIMEDURING").attr("disabled",false);
							$("#SUBJECT").attr("disabled",false);
							$("#TEATHER").attr("disabled",false);
						}else{
							$("#TIMEDURING").attr("disabled",true);
							$("#SUBJECT").attr("disabled",true);
							$("#TEATHER").attr("disabled",true);
							that.TIMEDURING = '';
							that.SUBJECT = '';
							that.TEATHER = '';
						}
						this.changeParam();
					},
					
					
					addStudentList:function(){
					  	var that = this;
						var gradeValue = that.GRADE;
						var subjectValue = that.SUBJECT;
						var timeduringValue = that.TIMEDURING;
						var teatherValue = that.TEATHER;
						for(var i = 0;i<that.tableData.length;i++){
							if(timeduringValue == that.tableData[i].TIMEDURING){
								that.$message.warning('已存在相同时间段，不可重复添加');
								return;
							}
						}
						if(gradeValue == "" || subjectValue == "" || timeduringValue == "" || teatherValue == ""){
							that.$message.warning('年级、科目、时间段、老师必填');
							return;
						}
						
						var url = '<%=basePath%>student/checkIfHasSeat.do';
						  var param = {
							  GRADE:gradeValue,
							  SUBJECT:subjectValue,
							  TIMEDURING:timeduringValue,
							  TEATHER:teatherValue,
						  };
						  axios.post(url, param)
						  .then(function (response) {
							  var result = response.data;
							  if(result.hasSeat == "N"){
								that.$message.error('所选条件对应教室无座位剩余');
								return;
							  }else{
								  if(that.tableData.length>0){
									for(var i = 0; i<that.tableData.length; i++){
										if(that.tableData[i].GRADE == gradeValue
											&& that.tableData[i].SUBJECT == subjectValue
											&& that.tableData[i].TIMEDURING == timeduringValue
											&& that.tableData[i].TEATHER == teatherValue){
											that.$message.error('不可重复添加');
											return;
										}
									}
								}
								//that.GRADE='';
									that.SUBJECT='';
									that.TIMEDURING='';
									that.TEATHER='';
									/* $("#TIMEDURING").attr("disabled",true);
									$("#SUBJECT").attr("disabled",true);
									$("#TEATHER").attr("disabled",true); */
									that.changeParam();
									var pa = {
										"GRADE":gradeValue,
										"TIMEDURING":timeduringValue,
										"SUBJECT":subjectValue,
										"TEATHER":teatherValue
									}
									that.tableData.push(pa);
									that.newAddData.push(pa);
									//var paStr = JSON.stringify(pa);
									that.teaSubJsonString = JSON.stringify(that.newAddData);
							  }
						    //console.log(response);
						  }).catch(function (error) { 
						    console.log(error);
						  });
						
					},
					
					delst:function(r){
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
					},
					
					dateToString:function(now){
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
					},
					
			  },
			  
			})
		</script>
</body>
</html>