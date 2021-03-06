<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/common.jsp"%>
<c:set var="pageTitle" value="${'查看作业类信息'}" scope="page" />
<html>
<head>
<title>${pageTitle }</title>
</head>
<body>
	<div class="page-content">
		<div class="container-fluid">
			<!-- 页面导航 -->
			<tool:navBar pageTitle="${pageTitle }" pageTitleContent="作业管理-作业类管理-${pageTitle }" titleIcon="icon-home" />
			<!-- 主体内容 -->
			<div class="row-fluid">
				<div class="span12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>作业类信息
							</h4>
							<div class="tools">
								<a href="${header.Referer }" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<form action="${ctx}/job/JobClass/edit" class="form-horizontal form_sync" method="post" id="form1">
							<input type="hidden" value="${obj.id}" name="id">
								<table width="100%"  class="dbform">
									<tbody>
									<tr>
										<td class="fieldtitle" >作业名:</td>
										<td class="fieldvalue">${obj.name}</td>
										<td class="fieldtitle" >作业类型:</td>
										<td class="fieldvalue"><mytags:dictSelect field="jobType" id="jobType" type="label" defaultVal="${obj.jobType}" hasLabel="false" codeType="21" /></td>
									</tr>
									<tr>
										<td class="fieldtitle">类名:</td>
										<td class="fieldvalue">${obj.className }</td>
										<td class="fieldtitle">版本:</td>
										<td class="fieldvalue">${obj.version }</td>
									</tr>
									<tr>
										<td class="fieldtitle">方法名:</td>
										<td class="fieldvalue">${obj.methodName }</td>
										<td class="fieldtitle">备注:</td>
										<td class="fieldvalue">${obj.remark}</td>
									</tr>
									<tr>
										<td class="fieldtitle">建立者:</td>
										<td class="fieldvalue">${obj.creater.name}</td>
										<td class="fieldtitle">更新者:</td>
										<td class="fieldvalue">${obj.updater.name }</td>
									</tr>
									<tr>
										<td class="fieldtitle">建立时间:</td>
										<td class="fieldvalue">${obj.createDate}</td>
										<td class="fieldtitle">更新时间:</td>
										<td class="fieldvalue">${obj.updateDate }</td>
									</tr>
								</tbody>
								</table>
							</form>
						</div>
						<div class="portlet-title">
							<h4>
								<i class="icon-reorder"></i>作业调度情况
							</h4>
						</div>
						<div class="portlet-body form">
								<table width="100%" class="dbgrid">
									<thead>
										<tr>
											<th>名称</th>
											<th>逻辑名</th>
											<th>cron表达式</th>
											<th>启用标记</th>
											<th>下次执行时间</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${obj.workers}" var="worker">
									<tr>
										<td><a href="${ctx}/job/JobWorker/show/${worker.id}">${worker.name}</a></td>
										<td>${worker.logicName}</td>
										<td>${worker.cron}</td>
									    <td><mytags:dictSelect field="checkLabelMap" id="checkLabelMap" type="label" hasLabel="false" codeType="17" defaultVal="${worker.checkLabel}"/></td>
										<td>${worker.nextExeDate}</td>
									</tr>
									</c:forEach>
									</tbody>
								</table>
								</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/content/common/plugins/jquery-validation.jsp"%>
	<script type="text/javascript">
		$(function() {
			App.activeMenu("job/JobClass/list");
		});
	</script>
</body>
</html>