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

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 

        <title>学生选座</title>

        <meta name="keywords" content="学生选座" />

        <meta name="description" content="学生选座" />

        <link rel="stylesheet" type="text/css" href="<%=basePath%>student/jq22.css" />
        <script src="<%=basePath%>student/jquery.min.js"></script>

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

        <div class="container">

          <h2 class="title">学生选座</h2>

            <div class="demo clearfix">

                <!---左边座位列表----->

                <div id="seat_area">

                    <div class="front">讲台</div>					

                </div>

                <!---右边选座信息----->

                <div class="booking_area">

                    <p>电影：<span>天将雄师</span></p>

                    <p>时间：<span>03月20日 22:15</span></p>

                    <p>座位：</p>

                    <ul id="seats_chose"></ul>

                    <p>座位数：<span id="tickects_num">0</span></p>

                    <p>总价：<b>￥<span id="total_price">0</span></b></p>



                    <input type="button" onclick="buttonSubmit()" class="btn" value="确定购买"/>
                    <input type="button" id="cancelbtn" onclick="cancel();" class="cancelbtn" value="返回"/>



                    <div id="legend"></div>

                </div>

            </div>

        </div>


        <script type="text/javascript" src="<%=basePath%>student/jquery.seat-charts.min.js"></script>

        <script type="text/javascript">

            var price = 100; //电影票价
            var seat_code = "";
            $(document).ready(function() {

                var $cart = $('#seats_chose'), //座位区

                        $tickects_num = $('#tickects_num'), //票数

                        $total_price = $('#total_price'); //票价总额

				var list1 = ${list1};
				var disableList = ${disableList};

                var sc = $('#seat_area').seatCharts({

                    //  map: [//座位结构图 a 代表座位; 下划线 "_" 代表过道
                    //
                    //     'cccccccccc',
                    //
                    //     'cccccccccc',
                    //
                    //     '__________',
                    //
                    //     'cccccccc__',
                    //
                    //     'cccccccccc',
                    //
                    //     'cccccccccc',
                    //
                    //     'cccccccccc',
                    //
                    //     'cccccccccc',
                    //
                    //     'cccccccccc',
                    //
                    //     'cc__cc__cc'
                    //
                    // ],
                    map: list1,


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

                //设置已售出的座位

                sc.get(disableList).status('unavailable');


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

        </script>



    </body>

</html>





