<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html class="login2body">
<head>
<meta charset="utf-8">
<base href="<%=path%>/">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<title>注册</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}static/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="${ctx}statics/jquery-confirm-master/tConfirm.css">
<script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script src="static/js/sha1.js"></script>
<style type="text/css">
body {
	font-size: 11px;
	font-family: 'Open Sans', sans-serif;
	color: #4A4A4A;
	text-align: center;
}

.box2 {
	margin: 20px auto;
	width: 800px;
	min-height: 150px;
	padding: 10px;
	position: relative;
	background: -webkit-gradient(linear, 0% 20%, 0% 92%, from(#f3f3f3),
		to(#fff), color-stop(.1, #f3f3f3));
	border-top: 1px solid #ccc;
	border-right: 1px solid #ccc;
	-webkit-border-bottom-right-radius: 60px 60px;
	-webkit-box-shadow: -1px 2px 2px rgba(0, 0, 0, 0.2);
}

.box2:before {
	content: '';
	width: 25px;
	height: 20px;
	position: absolute;
	bottom: 0;
	right: 0;
	-webkit-border-bottom-right-radius: 30px;
	-webkit-box-shadow: -2px -2px 5px rgba(0, 0, 0, 0.3);
	-webkit-transform: rotate(-20deg) skew(-40deg, -3deg)
		translate(-13px, -13px);
}

.box2:after {
	content: '';
	z-index: -1;
	width: 100px;
	height: 100px;
	position: absolute;
	bottom: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.2);
	display: inline-block;
	-webkit-box-shadow: 20px 20px 8px rgba(0, 0, 0, 0.2);
	-webkit-transform: rotate(0deg) translate(-45px, -20px) skew(20deg);
}

.box2 img {
	width: 100%;
	margin-top: 15px;
}

p {
	margin-top: 15px;
	text-align: justify;
}

h1 {
	font-size: 20px;
	font-weight: bold;
	margin-top: 5px;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
}

a {
	text-decoration: none;
	color: #4A4A4A !important;
}

a:hover {
	text-decoration: underline;
	color: #6B6B6B !important;
}
</style>
</head>
<body class="login2body">
	<div class="login2" id="login2">
		<div class="title-out">
			<div class="title" style="width: 100%; height: 50px"></div>
		</div>
		<div>
			<div class="box2">
				<h1>用户注册</h1>   
				<form class="form-horizontal" action="user/${msg }.do"
					name="userForm" id="userForm" method="post">
					<div class="form-group" style="display: none">
						<label for="" class="col-sm-2 control-label"><span
							style="color: red">*</span>用户类型</label>
						<div class="col-sm-8">
							<input type="radio" name="TYPE" value="1"
								title="68f8e4a39efe47c7bb869e9d15ab925d" checked="checked" />企业用户
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label" for="firstname"><span
							style="color: red">*</span>登录名</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="USERNAME"
								id="loginname" value="${pd.USERNAME }" maxlength="32"
								onblur="hasU();" placeholder="这里输入用户名" title="用户名"
								style="width: 98%;" />
							</td>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label"><span
							style="color: red">*</span>密码</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" name="PASSWORD"
								id="password" maxlength="32" placeholder="请输入8-16位密码" title="密码"
								style="width: 98%;" />
							</td>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label"><span
							style="color: red">*</span>确认密码</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" name="chkpwd"
								id="chkpwd" maxlength="32" placeholder="确认密码" title="确认密码"
								style="width: 98%;" />
							</td>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label"><span
							style="color: red">*</span>姓名</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="NAME" id="NAME"
								value="${pd.NAME }" maxlength="32" placeholder="这里输入姓名"
								title="单位联系人" style="width: 98%;" />
							</td>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label"><span
							style="color: red">*</span>联系方式</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" name="PHONE" id="PHONE"
								value="${pd.PHONE }" maxlength="32" placeholder="这里输入手机号"
								title="手机号" onblur="hasT('${pd.USERNAME }')" style="width: 98%;" />
							</td>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label"><span
							style="color: red">*</span>邮箱地址</label>
						<div class="col-sm-8">
							<input type="email" name="EMAIL" id="EMAIL" class="form-control"
								value="${pd.EMAIL }" maxlength="32" placeholder="这里输入邮箱"
								title="邮箱" onblur="hasE('${pd.USERNAME }')" style="width: 98%;" />
							</td>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-2 control-label"><span
							style="color: red">*</span>注册码</label>
						<div class="col-sm-8">
							<input type="text" name="VALIDATECODE" id="VALIDATECODE" class="form-control"
								value="${pd.VALIDATECODE }" maxlength="32" placeholder="请输入注册码,注册码申请请联系运营人员"
								title="注册码" style="width: 98%;" />
							</td>
						</div>
					</div>
					<div class="form-group">
							<a type="button" class="btn btn-info fanhui" href="index.jsp">返回登录</a>
							<a class="btn  btn-primary" onclick="save();">注册提交</a>
						</div>
				</form>
			</div>
		</div>
	</div>
	<div id="zhongxin2" class="center" style="display:none">
		<br/><br/><br/><br/><br/>
		<img src="static/images/ok.png" /><br/>
		<h4 class="lighter block green">用户新增成功</h4>
	</div>
	
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script src="static/js/md5.js"></script>

	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		if($("#user_id").val()!="" && $("#user_id").val()!=null){
			$("#loginname").attr("readonly","readonly");
			$("#loginname").css("color","gray");
		}
	});
	
	//判断编码是否存在
	$(document).ready(function() {
		changeCode();
		$("#codeImg").bind("click", changeCode);
	});
	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}

	function changeCode() {
		$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
	}
	
	function isCode(){
		var code=	$("#code").val();
		var res;
		$.ajax({
			type: "POST",
			url: 'modify.do',
	    	data: {code:code,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("codeerror" == data.result){
					/* $("#code").tips({
						side : 1,
						msg : "验证码输入有误",
						bg : '#FF5080',
						time : 15
					});
					$("#code").focus(); */
					res=false;
				/* $("#code").val(""); */
				}else{
					res=true;
				}
			}
		});
		return res;
	}
	
	//保存
	function save()
	{
		var myuser =/^[a-zA-Z0-9_]{4,30}$/;
		if($("#loginname").val()=="" || $("#loginname").val()=="此用户名已存在!"){
			$("#loginname").tips({
				side:3,
	            msg:'请输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#loginname").val('');
			$("#loginname").focus();
			
			$("#loginname").css("background-color","white");
			return false;
		}else if(!myuser.test($("#loginname").val())){
			$("#loginname").tips({
				side:3,
	            msg:'只能输入有4-30数字、字母以及“_”等常用字符组合',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#loginname").val('');
			$("#loginname").focus();
			return false;
		}
		
	
		var myregpw = /^((?=.*\d)(?=.*\D)|(?=.*[a-zA-Z])(?=.*[^a-zA-Z]))^.{8,16}$/;
		if($("#user_id").val()=="" && $("#password").val()==""){
			$("#password").tips({
				side:3,
	            msg:'请输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#password").focus();
			return false;
		
		}else if( !myregpw.test($("#password").val())){
			$("#password").tips({
				side:3,
	            msg:'数字、字母、字符至少包含两种,且不少于8位！',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#password").focus();
			return false;
		}
		if($("#password").val()!=$("#chkpwd").val()){
			
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#chkpwd").focus();
			return false;
		}
		
		if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入联系人',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#NAME").focus();
			return false;
		}
		var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#PHONE").val()==""){
			
			$("#PHONE").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}else if($("#PHONE").val().length != 11 && !myreg.test($("#PHONE").val())){
			$("#PHONE").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").val("");
			$("#PHONE").focus();
			return false;
		}
		
		if($("#EMAIL").val()==""){
			
			$("#EMAIL").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}else if(!ismail($("#EMAIL").val())){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").val("");
			$("#EMAIL").focus();
			return false;
		}
		//验证码校验
		var res=false;
		if ($("#code").val() == "") {

			$("#code").tips({
				side : 1,
				msg : '验证码不得为空',
				bg : '#AE81FF',
				time : 3
			});
			$("#code").val("");
			$("#code").focus();
			return false;
		}
		
		
		 var jsonuserinfo = $('#userForm').serializeObject();  
        //提交用户信息
        $.ajax({
			type: "POST",
			url: '<%=path%>/user/saveUser.do',
			data: jsonuserinfo,
			dataType:'json',
			cache: false,
			success: function(data){
				 if("failed"== data.msg)
				 {
					 alert("用户新增失败  " + data.desc);
				 }
				 else
				 {
					 $("#login2").hide();
					 $("#zhongxin2").show();
					 //等等一秒钟返回
					 waitFun(function(result){
						 window.location.href = "login_toLogin";
					 })
					 
				 }
			}
		});
		
	}
	//等等一秒钟返回
	function waitFun(callback){
		   setTimeout(function(){    
		      callback(1);
		   }, 1000);
		}
	
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $.trim($("#loginname").val());
		$.ajax({
			type: "GET",
			url: '<%=path%>/user/hasU.do',
			data: {USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("error"== data.result){
					 $("#loginname").tips({
							side:3,
				            msg:'用户名 '+USERNAME+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#loginname").val('');
						$("#loginname").focus();
				}
			}
		});
	}
	
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $.trim($("#EMAIL").val());
		$.ajax({
			type: "POST",
			url: '<%=path%>/user/hasE.do',
	    	data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				if("error"== data.result){						
					$("#EMAIL").tips({
							side:3,
				            msg:'邮箱 '+EMAIL+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#EMAIL").val('');
				 }
			}
		});
	}
	
	//判断手机号是否存在
	function hasT(USERNAME){
		var PHONE = $.trim($("#PHONE").val());
		$.ajax({
			type: "POST",
			url: '<%=path%>/user/hasPhone.do',
			data : {
				PHONE : PHONE,
				USERNAME : USERNAME,
				tm : new Date().getTime()
			},
			dataType : 'json',
			cache : false,
			success : function(data) {
				if ("error" == data.result) {
					$("#PHONE").tips({
						side : 3,
						msg : '号码 ' + PHONE + ' 已存在',
						bg : '#AE81FF',
						time : 3
					});
					$("#PHONE").val('');
				}
			}
		});
	}
	
	$.fn.serializeObject = function()    
	{    
	   var o = {};    
	   var a = this.serializeArray();    
	   $.each(a, function() {    
	       if (o[this.name]) {    
	           if (!o[this.name].push) {    
	               o[this.name] = [o[this.name]];    
	           }    
	           o[this.name].push(this.value || '');    
	       } else {    
	           o[this.name] = this.value || '';    
	       }    
	   });    
	   return o;    
	};  

	$(function() {
		//下拉框
		if (!ace.vars['touch']) {
			$('.chosen-select').chosen({
				allow_single_deselect : true
			});
			$(window).off('resize.chosen').on('resize.chosen', function() {
				$('.chosen-select').each(function() {
					var $this = $(this);
					$this.next().css({
						'width' : $this.parent().width()
					});
				});
			}).trigger('resize.chosen');
			$(document).on('settings.ace.chosen',
					function(e, event_name, event_val) {
						if (event_name != 'sidebar_collapsed')
							return;
						$('.chosen-select').each(function() {
							var $this = $(this);
							$this.next().css({
								'width' : $this.parent().width()
							});
						});
					});
			$('#chosen-multiple-style .btn').on('click', function(e) {
				var target = $(this).find('input[type=radio]');
				var which = parseInt(target.val());
				if (which == 2)
					$('#form-field-select-4').addClass('tag-input-style');
				else
					$('#form-field-select-4').removeClass('tag-input-style');
			});
		}
	});
</script>

</body>

</html>