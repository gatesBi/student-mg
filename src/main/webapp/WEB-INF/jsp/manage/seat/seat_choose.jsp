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
							
							<el-container>
							    <el-header>
							    	<el-row>
									  <el-col :span="4">
									  	<div class="grid-content">
									  		<el-input v-model="studentName" placeholder="请输入学生姓名"></el-input>
									  	</div>
									  </el-col>
									  <el-col :span="4">
										  <div class="grid-content">
										  	<el-button slot="append" icon="el-icon-search" @click="searchMsg"></el-button>
										  </div>
									  </el-col>
									</el-row>
								</el-header>
							  <el-main>
							  	<el-row :gutter="20" v-for="(item,index) in seatMsg">
								  <el-col :span="12" :offset="6"   v-show="isHidden[index].cut">
								  	<div class="grid-content bg-purple bg-purple-light">
								  		<span>年级:</span><span style="color:red">{{item.GRADE}}</span>
								  		<span>时间段:</span><span style="color:red">{{item.TIMEDURING}}</span>
								  		<span>学科:</span><span style="color:red">{{item.SUBJECT}}</span>
								  		<span>老师:</span><span style="color:red">{{item.TEATHER_NAME}}</span>
								  		<el-row :gutter="20">
										  <el-col :span="6">
											  <div class="grid-content bg-purple">
											  	<el-input v-model="row[index]" placeholder="请输入排"></el-input>
											  </div>
										  </el-col>
										  <el-col :span="6">
											  <div class="grid-content bg-purple">
											  	<el-input v-model="column[index]" placeholder="请输入列"></el-input>
											  </div>
										  </el-col>
										  <el-col :span="6">
											  <div class="grid-content">
											  	<el-button  type="primary"  size="mini" round @click="saveSeat(index)">保存</el-button>
											  </div>
										  </el-col>
										</el-row>
								  		
								  		
								  		<span><b>可选座位为:</b></span>
								  	</div>
								  </el-col>
								  <el-col :span="12" :offset="6" v-for="item1 in item.seatlist" v-show="isHidden[index].cut">
								  	<div class="grid-content bg-purple bg-purple-light">
								  		<span>{{item1}},</span>
								  	</div>
								  </el-col>
								</el-row>
								
							  </el-main>
							</el-container>
							
							
							
							
					
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
		
		var app = new Vue({
		  el: '#app',
		  data: {
		    studentName: '',
		    studentId:'',
		    row:["","","","","","","","","","","",""],
		    column:["","","","","","","","","","","",""],
		    //seatMsg:[{a:'',b:'',list:[]},{a:'',b:'',list:[]}],
		    seatMsg:[],
		    isHidden:[
		    	{
		    		cut:true
		    	}, {
		    		cut:true
		    	},{
		    		cut:true
		    	},{
		    		cut:true
		    	},{
		    		cut:true
		    	},{
		    		cut:true
		    	},{
		    		cut:true
		    	},{
		    		cut:true
		    	},{
		    		cut:true
		    	},{
		    		cut:true
		    	},{
		    		cut:true
		    	},{
		    		cut:true
		    	},         
		    ],
		  },
		  methods:{
		    initHidden:function(){
		    	var that = this;
		    	that.isHidden = [{cut:true},{cut:true},{cut:true},{cut:true},{cut:true},{cut:true},{cut:true},{cut:true},{cut:true},{cut:true},{cut:true},{cut:true},]
		    	that.row=["","","","","","","","","","","",""];
		    	that.column=["","","","","","","","","","","",""];
		    },
			searchMsg:function(){
				var that = this;
		        var url = '<%=basePath%>student/searchMsg.do';
		        var param = {
		        	studentName:that.studentName,	
		        };
		        axios.post(url, param)
				  .then(function (response) {
					if(response.data.seatResult.length>0){
						that.seatMsg = response.data.seatResult;
						that.studentId = that.seatMsg[0].STUDENT_ID;
						that.initHidden();
					}else{
						that.$message({
				          message: '无可选座位',
				          type: 'warning'
				        });
						return;
					}
					
				  }).catch(function (error) { 
				    console.log(error);
				  });
			},
			saveSeat:function(index){
				var that = this;
				if(that.row[index]=="" || that.column[index]==""){
					this.$message({
			          message: '排与列不能为空',
			          type: 'warning'
			        });
					return;
				}
				var url = '<%=basePath%>seat/saveChoose.do';
				var param = {
					studentId:that.studentId,
					row:that.row[index],
					column:that.column[index],
					classId:that.seatMsg[index].CLASSROOM_ID,
					timeduring:that.seatMsg[index].TIMEDURING,
				};
				axios.post(url, param)
				  .then(function (response) {
					  if(response.data.msg == "success"){
						  that.$message({
					          message: '保存成功',
					          type: 'success'
					        });
						  that.isHidden[index].cut = !that.isHidden[index].cut;
					  }else{
						  that.$message({
					          message: response.data.result,
					          type: 'error'
					        });
					  }
				  }).catch(function (error) { 
					  that.$message({
				          message: '保存失败,失败原因'+error,
				          type: 'error'
				        });
				    //console.log(error);
				  });
			}
		  },
		})
		
	</script>


</body>
</html>