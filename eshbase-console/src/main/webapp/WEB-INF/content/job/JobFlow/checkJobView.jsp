<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<html>
<head>
<title>${pageTitle }</title>
<%@ include file="/WEB-INF/content/common/plugins/datepicker.jsp"%>
<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-设置作业项目执行" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>设置作业执行
							</h4>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a> <a href="javascript:;" class="remove"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/job/JobFlow/generateJob" class="form-horizontal form_sync" method="post" name="frmCron" id="form1">
								<input type="hidden" value="${obj.id}" name="id">
								<table class="dbform" width="100%">
									<tr>
										<td class="fieldtitle">名称:</td>
										<td class="fieldvalue"><input type="text"  validate="{required:true}" name="name" value="${empty param.name?obj.name:param.name}" /></td>
										<td class="fieldtitle">作业类ID:</td>
										<td class="fieldvalue"><input type="text"  readonly="readonly" name="jobClassId" value="${empty param.jobClassId?obj.jobclass.id:param.jobClassId}" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">逻辑名:</td>
										<td class="fieldvalue"><input type="text"   readonly="readonly" name="logicName" value="${empty param.logicName?obj.jobclass.name:param.logicName}" /></td>
										<td class="fieldtitle">作业类名:</td>
										<td class="fieldvalue"><input type="text"  readonly="readonly"  name="jobClassName" value="${empty param.jobClassName?obj.jobclass.className:param.jobClassName}" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">方法名:</td>
										<td class="fieldvalue">${obj.jobclass.methodName}</td>
										<td class="fieldtitle">参数:</td>
										<td class="fieldvalue"><input type="text"   name="jobParameter" value="${param.jobParameter}" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">分片参数对照表:</td>
										<td class="fieldvalue"><input type="text"    readonly="readonly" name="shardingItemParameters" value="${param.shardingItemParameters}" /></td>
										<td class="fieldtitle">任务分割策略:</td>
										<td class="fieldvalue"><input type="text"  readonly="readonly" name="strategy" value="${param.strategy}" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">类型:</td>
										<td class="fieldvalue" >
											<select name="cronrepeat" onchange="javascript:changeRepeat();" style="width:90px;">
												<option value="1" <c:if test="${param.cronrepeat==1}">selected</c:if>>循环</option>
												<option value="2" <c:if test="${param.cronrepeat==2}">selected</c:if>>指定时间</option>
												<option value="3" <c:if test="${param.cronrepeat==3}">selected</c:if>>执行一次</option>
											</select>
										</td>
										<td class="fieldtitle">cron设置:</td>
										<td class="fieldvalue">
											<div id="cronset">
											<input type="text" value="${empty param.cronrepeatimes?1:param.cronrepeatimes}"  style="width:60px;" validate="{required:true}" name="cronrepeatimes"  />&nbsp;&nbsp;
											<select name="cronunit" id="cronunit" style="width:60px;">
												<option value="d"  <c:if test="${param.cronunit=='d'}">selected</c:if>>天</option>
						                      	<option value="h"  <c:if test="${param.cronunit=='h'}">selected</c:if>>小时</option>
						                      	<option value="mi" <c:if test="${param.cronunit=='mi'}">selected</c:if>>分</option>
						                      	<option value="M" <c:if test="${param.cronunit=='M'}">selected</c:if>>月</option>
						                      	<option value="w" <c:if test="${param.cronunit=='w'}">selected</c:if>>周</option>
						                     </select></div>
						               	</td>
									</tr>
									<tr>
										<td class="fieldtitle">日期/时间:</td>
										<td class="fieldvalue" >
											<div id="crondate" class="input-append date form_datetime"  >
												<input class="m-wrap"  name="crondate" type="text" style="width:90px" value="${param.crondate}" validate="{required:true}" readonly="readonly"/> 
												<input class="m-wrap"  id="crontime" name="crontime" style="width:60px" type="text" value="${param.crontime}" validate="{required:true}" readonly="readonly"/>
												<span class="add-on"> <i class="icon-th"></i> </span>
											</div>
										</td>
										<td class="fieldtitle">是否最后一天:</td>
										<td class="fieldvalue"><!-- <select name="cronutc" style="width:60px;" >
																	<option value="utc"  <c:if test="${param.cronutc=='utc'}">selected</c:if>>UTC</option>
																	<option value="cst"  <c:if test="${param.cronutc=='cst'}">selected</c:if>>CST</option>
																</select> -->
																<div id="isLast"><input type="checkbox" name="isLast" <c:if test="${not empty param.isLast}">checked</c:if> value="1"/></div>
										</td>
									</tr>
									<tr>
										<td class="fieldtitle">表达式:</td>
										<td class="fieldvalue"><input type="text"   readonly="readonly"   name="cronStr" value="${cronStr}" />
										${exeTime}
										</td>
										<td class="fieldtitle">说明:</td>
										<td class="fieldvalue"><input type="text"  readonly="readonly" name="cronRemark" value="${cronRemark}" /></td>
									</tr>
								<tr>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue" colspan="3"><input type="text"  validate="{required:true}" name="remark" value="${empty param.remark?obj.remark:param.remark}" /></td>
								</tr>
								</table>
								<div class="form-actions">
									<button type="button" onclick="javascript:submitCron()"  class="btn blue">提交</button>
									<button type="button" onclick="javascript:submitCronRemark()" class="btn blue">校验</button>
									<a class='btn' href="${header.Referer }">返回</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("job/JobFlow/list");
			changeRepeat();
		});
		function changeRepeat(){
			if ("1"==frmCron.cronrepeat.value){//循环执行，隐藏日期时间显示
				$("#cronset").show();
				$("#cronunit option[value='M']").remove();
				$("#cronunit option[value='w']").remove();
				$("#crondate").hide();
				$("#isLast").hide();
			}else if ("2"==frmCron.cronrepeat.value){//指定
				if ($("#cronunit option[value='M']").val()!='M'){
					$("#cronunit").append("<option value='M'>月</option>");
				}
				if ($("#cronunit option[value='w']").val()!='w'){
					$("#cronunit").append("<option value='w'>周</option>");
				}
				$("#cronset").show();
				$("#crondate").show();
				$("#isLast").show();
			}else if ("3"==frmCron.cronrepeat.value){//固定时间执行
				$("#crondate").show();
				$("#cronset").hide();
				$("#isLast").hide();
			}
		}
		function submitCron(){
			frmCron.action="${ctx}/job/JobFlow/generateJob";
			frmCron.submit();
		}
		function submitCronRemark(){
			frmCron.action="${ctx}/job/JobFlow/getCronString";
			frmCron.submit();
		}
		$("#crondate").datetimepicker({
	        format: "yyyy-mm-dd",
	        linkField: "crontime",
	        linkFormat: "hh:ii"
	    });
	</script>
</body>
</html>