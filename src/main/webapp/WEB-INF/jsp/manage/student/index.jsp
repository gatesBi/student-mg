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

        <title>学生选座</title>

        <meta name="keywords" content="学生选座" />

        <meta name="description" content="学生选座" />

        <link rel="stylesheet" type="text/css" href="static/student/jq22.css" />
        <link rel="stylesheet" href="//unpkg.com/element-ui@2.7.0/lib/theme-chalk/index.css" />
        <script src="static/student/jquery.min.js"></script>
        <script type="text/javascript" src="static/js/vuejs/vuejs-2.5.16.js"></script>
		<script type="text/javascript" src="static/js/vuejs/axios-0.18.0.js"></script>
		<script type="text/javascript" src="static/element/index.js"></script>
		<script type="text/javascript" src="static/student/jquery.seat-charts.min.js"></script>

        <style type="text/css">

            .front{width: 300px;margin: 5px 32px 45px 32px;background-color: #f0f0f0;	color: #666;text-align: center;padding: 3px;border-radius: 5px;}

            .booking_area {float: right;position: relative;width:200px;height: 450px; }

            .booking_area h3 {margin: 5px 5px 0 0;font-size: 16px;}

            .booking_area p{line-height:26px; font-size:16px; color:#999}

            .booking_area p span{color:#666}

            div.seatCharts-cell {color: #182C4E;height: 25px;width: 25px;line-height: 25px;margin: 3px;float: left;text-align: center;outline: none;font-size: 13px;}

            div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}

            div.seatCharts-row {height: 35px;}

            div.seatCharts-seat.available {background-color: #B9DEA0;}

            div.seatCharts-seat.focused {background-color: #76B474;border: none;}

            div.seatCharts-seat.selected {background-color: #E6CAC4;}

            div.seatCharts-seat.unavailable {background-color: #472B34;cursor: not-allowed;}

            div.seatCharts-container {border-right: 1px dotted #adadad;width: 400px;padding: 20px;float: left;}

            div.seatCharts-legend {padding-left: 0px;position: absolute;bottom: 16px;}

            ul.seatCharts-legendList {padding-left: 0px;}

            .seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}

            span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}

            .checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}

            #seats_chose {max-height: 150px;overflow-y: auto;overflow-x: none;width: 200px;}

            #seats_chose li{float:left; width:72px; height:26px; line-height:26px; border:1px solid #d3d3d3; background:#f7f7f7; margin:6px; font-size:14px; font-weight:bold; text-align:center}

        </style>

    </head>

    <body>
    <div id="app">
    <div style="margin-left:20px;margin-top:20px;">
    <table id="table_report" class="table table-striped table-bordered table-hover">
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
		<tr>
			<td colspan="2" style="text-align: left;;padding-top: 13px;">
				<div>
					<a class="btn btn-mini btn-primary" @click="chooseClassroom">选择教室</a>
				</div>
			</td>
		</tr>
		</table>
		 </div>
        <div class="container">

          <h2 class="title">学生选座</h2>

            <div class="demo clearfix">
                <!---左边座位列表----->

                <div id="seat_area">

                    <div class="front">讲台</div>					

                </div>

                <!---右边选座信息----->

                <div class="booking_area">

                    <p>年级：<span id="GRADE"></span></p>

                    <p>时间段：<span id="TIMEDURING"></span></p>
                    
                    <p>学科：<span id="SUBJECT"></span></p>
                    
                    <p>老师：<span ID="TEATHER"></span></p>

                    <p>座位：</p>

                    <ul id="seats_chose"></ul>

                   <!--  <p>座位数：<span id="tickects_num">0</span></p> -->

                    <!-- <p>总价：<b>￥<span id="total_price">0</span></b></p> -->



                    <input type="button" onclick="buttonSubmit()" class="btn" value="确定购买"/>
                    <input type="button" id="cancelbtn" onclick="cancel();" class="cancelbtn" value="返回"/>



                    <div id="legend"></div>

                </div>

            </div>

        </div>

</div>
        

        <script type="text/javascript">
        	$(top.hangge());
            var price = 100; //电影票价
            var seat_code = "";
            var sc;
            var seatList;
			var disableList;
			var $cart;
            $(document).ready(function() {

               

                $tickects_num = $('#tickects_num'), //票数

                $total_price = $('#total_price'); //票价总额

				
				

            });



            function getTotalPrice(sc) { //计算票价总额

                var total = 0;

                sc.find('selected').each(function() {

                    total += price;

                });

                return total;

            }
            
            function cancel(){
            	window.location.href = '<%=basePath%>student/list.do';
            }
            
            function buttonSubmit(){
            	alert(seat_code);
            }

            
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
				  teaSubArray : [],
				  keyArray : [],
				  teaSubJsonString:'',
				  seatList:[],
				  disableList:[],
				  
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
					
					chooseClassroom:function(){
					  	var that = this;
						var gradeValue = that.GRADE;
						var subjectValue = that.SUBJECT;
						var timeduringValue = that.TIMEDURING;
						var teatherValue = that.TEATHER;
						var url = '<%=basePath%>seat/chooseClassroom.do';
						  var param = {
							  GRADE:gradeValue,
							  SUBJECT:subjectValue,
							  TIMEDURING:timeduringValue,
							  TEATHER:teatherValue,
						  };
						  axios.post(url, param)
						  .then(function (response) {
							  var result = response.data;
							  seatList = result.seatList;
							  disableList = result.disableList;
							  $cart = $('#seats_chose');


							  
							  $('#seat_area').seatCharts({

				                    /* map: [//座位结构图 a 代表座位; 下划线 "_" 代表过道

				                        'cccccccccc',

				                        'cccccccccc',

				                        '__________',

				                        'cccccccc__',

				                        'cccccccccc',

				                        'cccccccccc',

				                        'cccccccccc',

				                        'cccccccccc',

				                        'cccccccccc',

				                        'cc__cc__cc'

				                    ], */
				                    map: seatList,

				                    naming: {//设置行列等信息

				                        top: false, //不显示顶部横坐标（行） 

				                        getLabel: function(character, row, column) { //返回座位信息 

				                            return column;

				                        }

				                    },

				                    legend: {//定义图例

				                        node: $('#legend'),

				                        items: [

				                            ['c', 'available', '可选座'],

				                            ['c', 'unavailable', '已售出']

				                        ]

				                    },

				                    click: function() {

				                        if (this.status() == 'available') { //若为可选座状态，添加座位
				                        	
				                        	seat_code += "," + (this.settings.row + 1) + "_" + this.settings.label;

				                            $('<li>' + (this.settings.row + 1) + '排' + this.settings.label + '座</li>')

				                                    .attr('id', 'cart-item-' + this.settings.id)

				                                    .data('seatId', this.settings.id)

				                                    .appendTo($cart);
											


				                            //$tickects_num.text(sc.find('selected').length + 1); //统计选票数量

				                            //$total_price.text(getTotalPrice(sc) + price);//计算票价总金额



				                            return 'selected';

				                        } else if (this.status() == 'selected') { //若为选中状态



				                            //$tickects_num.text(sc.find('selected').length - 1);//更新票数量

				                            //$total_price.text(getTotalPrice(sc) - price);//更新票价总金额

				                            $('#cart-item-' + this.settings.id).remove();//删除已预订座位

				                            seat_code = seat_code.replace("," + this.settings.id,"");

				                            return 'available';

				                        } else if (this.status() == 'unavailable') { //若为已售出状态

				                            return 'unavailable';

				                        } else {

				                            return this.style();

				                        }

				                    }

				                });
							  sc.get(disableList).status('unavailable');
						  }).catch(function (error) { 
						    console.log(error);
						  });
						
					},
					setStatus:function(){
						this.sc.get(disableList).status('unavailable');
					},
					sc:function(){
						$('#seat_area').seatCharts({

		                    /* map: [//座位结构图 a 代表座位; 下划线 "_" 代表过道

		                        'cccccccccc',

		                        'cccccccccc',

		                        '__________',

		                        'cccccccc__',

		                        'cccccccccc',

		                        'cccccccccc',

		                        'cccccccccc',

		                        'cccccccccc',

		                        'cccccccccc',

		                        'cc__cc__cc'

		                    ], */
		                    map: seatList,

		                    naming: {//设置行列等信息

		                        top: false, //不显示顶部横坐标（行） 

		                        getLabel: function(character, row, column) { //返回座位信息 

		                            return column;

		                        }

		                    },

		                    legend: {//定义图例

		                        node: $('#legend'),

		                        items: [

		                            ['c', 'available', '可选座'],

		                            ['c', 'unavailable', '已售出']

		                        ]

		                    },

		                    click: function() {

		                        if (this.status() == 'available') { //若为可选座状态，添加座位
		                        	
		                        	seat_code += "," + (this.settings.row + 1) + "_" + this.settings.label;

		                            $('<li>' + (this.settings.row + 1) + '排' + this.settings.label + '座</li>')

		                                    .attr('id', 'cart-item-' + this.settings.id)

		                                    .data('seatId', this.settings.id)

		                                    .appendTo($cart);
									


		                            $tickects_num.text(sc.find('selected').length + 1); //统计选票数量

		                            $total_price.text(getTotalPrice(sc) + price);//计算票价总金额



		                            return 'selected';

		                        } else if (this.status() == 'selected') { //若为选中状态



		                            $tickects_num.text(sc.find('selected').length - 1);//更新票数量

		                            $total_price.text(getTotalPrice(sc) - price);//更新票价总金额

		                            $('#cart-item-' + this.settings.id).remove();//删除已预订座位

		                            seat_code = seat_code.replace("," + this.settings.id,"");

		                            return 'available';

		                        } else if (this.status() == 'unavailable') { //若为已售出状态

		                            return 'unavailable';

		                        } else {

		                            return this.style();

		                        }

		                    }

		                });
					}
			  }
           	})
        </script>



    </body>

</html>





