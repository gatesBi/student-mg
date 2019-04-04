<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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



<style>
  .el-row {
    margin-bottom: 20px;
    &:last-child {
      margin-bottom: 0;
    }
  }
  .el-col {
    border-radius: 4px;
  }
  .bg-purple-dark {
    background: #99a9bf;
  }
  .bg-purple {
    background: #d3dce6;
  }
  .bg-purple-light {
    background: #e5e9f2;
  }
  .grid-content {
    border-radius: 4px;
    min-height: 36px;
  }
  .row-bg {
    padding: 10px 0;
    background-color: #f9fafc;
  }
  span{
  	font-size:20px;
  }
  
table,table tr th, table tr td {
      border:1px solid #a8aeb2;
      padding: 5px 10px;
}
table {
      min-height: 25px;
      line-height: 25px;
      text-align: center;
      border-collapse: collapse;}

</style>



</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12" id="app" style="margin-top: 10px;">
						
						
						
						
							<el-row :gutter="20">
							  <el-col :span="4"><div class="grid-content bg-purple">
							  
							  	<select v-model="GRADE" name="GRADE" ID="GRADE" style="width:98%;" @change="changeGrade">
									<option value="">--请选择年级--</option>
									<c:forEach var="item" items="${gradeList }">
										<option value="${item.NAME }"
										<c:if test="${pd.GRADE==item.NAME}">selected</c:if>>
										${item.NAME }</option>
									</c:forEach>
								</select>
							  </div></el-col>
							  <el-col :span="4"><div class="grid-content bg-purple">
							  	<select v-model="SUBJECT" name="SUBJECT" ID="SUBJECT" style="width:98%;" @change="changeParam()" disabled>
									<option value="">--请选择学科--</option>
									<option v-for="subject in subjectlist">{{subject.NAME}}</option>
								</select>
							  </div></el-col>
							  <el-col :span="4"><div class="grid-content bg-purple">
							  	<select v-model="TIMEDURING" name="TIMEDURING" ID="TIMEDURING" style="width:98%;" @change="changeParam()" disabled>
									<option value="">--请选择时间段--</option>
									<option v-for="timeduring in timeDuringlist" v-bind:value="timeduring.TIMEDURING">{{timeduring.TIMEDURING}}</option>
								</select>
							  </div></el-col>
							  <el-col :span="4"><div class="grid-content bg-purple">
							  	<select v-model="TEATHER" name="TEATHER" ID="TEATHER" style="width:98%;" @change="changeParam()" disabled>
									<option value="">--请选择老师--</option>
									<option v-for="teather in teatherlist">{{teather.NAME}}</option>
								</select>
							  </div></el-col>
							  <el-col :span="4"><div class="grid-content bg-purple">
							  	<button @click="searchSeatMsg()">查询座位信息</button>
							  </div></el-col>
							</el-row>
							
							
							
							
							<el-row :gutter="20">
								  <el-col :span="12" :offset="6"><div class="grid-content bg-purple">
								  
								  <table   class="clearfix bigTable" id='downloaddata'>
							      <tr v-for='(item, index) in tableData'>
							        <template v-for='items in item'>
							          <template  v-for='(itemss, indexs) in items'>
							            <td>{{itemss}}</td>
							          </template>
							        </template>
							      </tr>
							     </table>
								  
								  </div></el-col>
								</el-row>
							
							
							
							
							
							
					
						</div>
						<!-- /.col -->
					</div>
				</div>
			</div>
		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	
	
	<script src="static/js/vuejs/vuejs-2.5.16.js"></script>
	<script src="static/js/vuejs/axios-0.18.0.js"></script>
	<script src="//unpkg.com/element-ui@2.7.0/lib/index.js"></script>
	
	
	
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		$(function() {
			$("#GRADE").trigger("change");
			$("#SUBJECT").trigger("change");
			$("#TIMEDURING").trigger("change");
			$("#TEATHER").trigger("change");
		});
		var app = new Vue({

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
			  },
			  created:function(){
				  this.changeParam();
				  if(this.GRADE != '' && this.GRADE != null){
					    $("#TIMEDURING").attr("disabled",false);
						$("#SUBJECT").attr("disabled",false);
						$("#TEATHER").attr("disabled",false);
				  }
			  },
			  methods:{
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
					
					searchSeatMsg:function(){
					  var that = this;
					  var url = '<%=basePath%>seat/searchSeatMsg.do';
					  var param = {
							  GRADE:that.GRADE,
							  SUBJECT:that.SUBJECT,
							  TIMEDURING:that.TIMEDURING,
							  TEATHER:that.TEATHER,
					  };
					  axios.post(url, param)
					  .then(function (response) {
						  var result = response.data;
						  that.tableData = result.seatList;
					    console.log(response);
					  }).catch(function (error) { 
					    console.log(error);
					  });
					}
			  },
		})
		
	</script>


</body>
</html>