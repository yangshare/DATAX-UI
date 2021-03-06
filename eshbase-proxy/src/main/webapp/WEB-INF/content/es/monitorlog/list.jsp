<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>监控记录明细列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="监控记录明细列表" pageTitleContent="内容管理-监控记录明细管理-监控记录明细列表" titleIcon="icon-home"/>
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box purple">
						<div class="portlet-title">
							<h4>
								<i class="icon-globe"></i>列表
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a><a
									href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="row-fluid">
								<form class="queryForm span8">
									<div class="row-fluid">
	                                 	<div class="span2 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="success" class="m-wrap span12" placeholder="成功次数">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span2 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="failure" class="m-wrap span12" placeholder="失败次数">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span3 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="daterange" class="m-wrap span12" placeholder="时间范围" readonly="readonly">
		                                       </div>
		                                    </div>
	                                 	</div>
	                                 	<div class="span4 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                         <a class="btn blue" href="javascript:void(0)" onclick="javascript:doQuery();">
		                                         	<i class="icon-search"></i>
		                                         	查询</a>
		                                         <button type="reset" class="btn" onclick="javascript:Page.clearQuery();">
		                                         	<i class="icon-trash"></i>清空
		                                         </button>
		                                       </div>
		                                    </div>
	                                 	</div>
									</div>
								</form>
							</div>
							<table class="table table-striped table-bordered table-hover" id="sample_1">
								
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/content/common/plugins/page.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/daterangepicker.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	
	App.activeMenu("monitorLog/list");
	
	$('#daterange').daterangepicker({
		ranges: {
			'今日': ['today', 'today'],
			'昨日': ['yesterday', 'yesterday'],
			'本月': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
			'前7天': [Date.today().add( {days: -7} ),'today'],
			'前30天': [Date.today().add( {days: -30} ),'today']
		},
		startDate: "2016/08/05",
		endDate: "2016/08/05"
	});
	
	Page.initData(
		{
			url:"${ctx}/monitorLog/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"log",cValue:"ID",format:function(i,value,item){
					  return  "<a href='${ctx}/monitorLog/show/"+item.log.id+"' >"+item.log.id+"</a>";
				  }},
				{cName:"log.logtime",cValue:"采集时间",format:function(i,value,item){
					 if(App.isNundef(item.log.logTime)){
						 return "<a href='${ctx}/monitorLog/show/"+item.log.id+"' >"+new Date(item.log.logTime).format("yyyy-MM-dd hh:mm:ss")+"</a>";
					 }
					 return "<a href='${ctx}/monitorLog/show/"+item.log.id+"' >"+item.log.logTime+"</a>";
				 }},
			 	{cName:"successCount",cValue:"成功次数"},

			 	{cName:"successTps",cValue:"成功TPS"},

			 	{cName:"failureCount",cValue:"失败次数"},

			 	{cName:"failureTps",cValue:"失败Tps"},

			 	{cName:"concurrentMin",cValue:"线程池最小值"},

			 	{cName:"concurrentAve",cValue:"线程池平均值"},

			 	{cName:"concurrentMax",cValue:"线程池最大值"}
		 ]
	);
});

function doQuery(){
	var queryObj = {};
	if(App.isNundef($("#daterange").val()) && App.isEqPlacehoder($("#daterange")) != null){
		var arr = $("#daterange").val().split("-")
		queryObj ={
			"search_GTD_logTime" : arr[0].replaceAll("/","-"),
			"search_LTD_logTime" : arr[1].replaceAll("/","-")
		}
	}
	queryObj["search_GTD_successCount"] = App.isEqPlacehoder($("#success"));
	queryObj["search_GTD_failureCount"] = App.isEqPlacehoder($("#failure"));
	Page.doQuery(queryObj);
}
</script>
</body>
</html>