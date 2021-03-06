<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>模块对象列表</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="模块对象列表" pageTitleContent="内容管理-模块对象管理-模块对象列表" titleIcon="icon-home"/>
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
								<form class="queryForm span7">
									<div class="row-fluid">
	                                 	<div class="span6 ">
		                                    <div class="control-group">
		                                       <div class="controls">
		                                          <input type="text" id="filters" class="m-wrap span12" placeholder="模块编码,模块名,包名,备注">
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
								<tool:operBtns modelKey="module" modelName="meta"></tool:operBtns>
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
<script type="text/javascript" src="${ctx}/assets/js/map.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	App.activeMenu("meta/Module/list");
	var statusMap = new Map();  
	<mytags:dictSelect field="statusMap" id="statusMap" type="map" hasLabel="false" codeType="17" />
	Page.initData(
		{
			url:"${ctx}/meta/Module/page",
			pageNo : 1,
			pageSize : 10,
			tableId : "#sample_1"
		},
		null,
		[
			 	{cName:"project",cValue:"项目",format:function(i,value,item){
					  var $a = $('<a data-original-title="点击访问" data-placement="right" class="tooltips" href="${ctx}/meta/Project/show/'+item.project.id+'" >'+item.project.projectName+'</a>');
					  return $a;
				  }},
				  {cName:"datasource",cValue:"数据源",format:function(i,value,item){
					  var $a = $('<a data-original-title="点击访问" data-placement="right" class="tooltips" href="${ctx}/meta/DataSource/show/'+item.datasource.id+'" >'+item.datasource.dsName+'</a>');
					  return $a;
				  }},
			 	{cName:"moduleCode",cValue:"模块编码"},
			 	{cName:"moduleName",cValue:"模块名"},
			 	{cName:"packageName",cValue:"包名"},
			 	{cName:"creater",cValue:"建立者",format:function(i,value,item){
					 return item.creater.name;
				 }},
				 {cName:"checkLabel",cValue:"状态",format:function(i,value,item){
				  		return statusMap.get(item.checkLabel);
					 }}
		 ]
	);
});

function doQuery(){
	var queryObj = {
			search_LIKES_moduleCode_OR_moduleName_OR_packageName_OR_remark : App.isEqPlacehoder($("#filters"))
		};
	Page.doQuery(queryObj);
}

function checkObj(){
	var flag = Page.selectsPrompt();
	if(!flag) return;
	window.location.href = Page.subUrl() + "/setCheckLabel/" + flag;
	
}
</script>
</body>
</html>