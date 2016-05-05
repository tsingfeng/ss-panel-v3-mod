


{include file='admin/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">编辑节点 #{$node->id}</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-lg-push-0 col-sm-10 col-sm-push-1">
				<section class="content-inner margin-top-no">
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="form-group form-group-label">
									<label class="floating-label" for="name">节点名称</label>
									<input class="form-control" id="name" type="text" value="{$node->name}">
								</div>
								
								
								<div class="form-group form-group-label">
									<label class="floating-label" for="server">节点地址</label>
									<input class="form-control" id="server" type="text" value="{$node->server}">
								</div>
								
								<div class="form-group form-group-label">
									<label class="floating-label" for="method">加密方式</label>
									<input class="form-control" id="method" type="text" value="{$node->method}">
								</div>
								
								<div class="form-group form-group-label">
									<label class="floating-label" for="rate">流量比例</label>
									<input class="form-control" id="rate" type="text" value="{$node->traffic_rate}">
								</div>
								
								<div class="form-group form-group-label">
									<div class="checkbox switch">
										<label for="custom_method">
											<input {if $node->custom_method==1}checked{/if} class="access-hide" id="custom_method" type="checkbox"><span class="switch-toggle"></span>自定义加密
										</label>
									</div>
								</div>
								
								
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="form-group form-group-label">
									<div class="checkbox switch">
										<label for="type">
											<input {if $node->type==1}checked{/if} class="access-hide" id="type" type="checkbox"><span class="switch-toggle"></span>是否显示
										</label>
									</div>
								</div>
								
								<div class="form-group form-group-label">
									<label class="floating-label" for="status">节点状态</label>
									<input class="form-control" id="status" type="text" value="{$node->status}">
								</div>
								
								<div class="form-group form-group-label">
									<label class="floating-label" for="sort">类型（SS=0,VPN=1.....请看 zhaojin97.cn）</label>
									<input class="form-control" id="sort" type="text" value="{$node->sort}">
								</div>
								
								<div class="form-group form-group-label">
									<label class="floating-label" for="info">节点描述</label>
									<input class="form-control" id="info" type="text" value="{$node->info}">
								</div>
								
								<div class="form-group form-group-label">
									<label class="floating-label" for="class">节点类别（不分类请填0，分类为数字）</label>
									<input class="form-control" id="class" type="text" value="{$node->node_class}">
								</div>
								
								<div class="form-group form-group-label">
									<label class="floating-label" for="group">节点群组（分组为数字，不分组请填0）</label>
									<input class="form-control" id="group" type="text" value="{$node->node_group}">
								</div>
								
								
								<div class="form-group form-group-label">
									<label class="floating-label" for="node_bandwidth_limit">节点流量上限（不使用的话请填0）（GB）</label>
									<input class="form-control" id="node_bandwidth_limit" type="text" value="{$node->node_bandwidth_limit/1024/1024/1024}">
								</div>
								
								<div class="form-group form-group-label">
									<label class="floating-label" for="bandwidthlimit_resetday">节点流量上限清空日</label>
									<input class="form-control" id="bandwidthlimit_resetday" type="text" value="{$node->bandwidthlimit_resetday}">
								</div>
								
								<div class="form-group form-group-label">
									<label class="floating-label" for="node_speedlimit">节点限速(对于每个用户端口)（Mbps）</label>
									<input class="form-control" id="node_speedlimit" type="text" value="{$node->node_speedlimit}">
								</div>
							</div>
						</div>
					</div>	
					
					
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								
								<div class="form-group">
									<div class="row">
										<div class="col-md-10 col-md-push-1">
											<button id="submit" type="submit" class="btn btn-block btn-brand waves-attach waves-light">修改</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					{include file='dialog.tpl'}

			</div>
			
			
			
		</div>
	</main>

	
	
	
	






{include file='admin/footer.tpl'}



<script>
    $(document).ready(function () {
        function submit() {
			
			if(document.getElementById('custom_method').checked)
			{
				var custom_method=1;
			}
			else
			{
				var custom_method=0;
			}
			
			if(document.getElementById('type').checked)
			{
				var type=1;
			}
			else
			{
				var type=0;
			}
			
			
			
            $.ajax({
                type: "PUT",
                url: "/admin/node/{$node->id}",
                dataType: "json",
                data: {
                    name: $("#name").val(),
                    server: $("#server").val(),
                    method: $("#method").val(),
                    custom_method: custom_method,
                    rate: $("#rate").val(),
                    info: $("#info").val(),
                    type: type,
					group: $("#group").val(),
                    status: $("#status").val(),
                    sort: $("#sort").val(),
					node_speedlimit: $("#node_speedlimit").val(),
					class: $("#class").val(),
					node_bandwidth_limit: $("#node_bandwidth_limit").val(),
					bandwidthlimit_resetday: $("#bandwidthlimit_resetday").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html(data.msg+"  五秒后跳转。");
                        window.setTimeout("location.href='/admin/node'", 5000);
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
                    $("#msg").html(data.msg+"  发生了错误。");
                }
            });
        }

        $("html").keydown(function (event) {
            if (event.keyCode == 13) {
                login();
            }
        });
        $("#submit").click(function () {
            submit();
        });
        $("#ok-close").click(function () {
            $("#msg-success").hide(100);
        });
        $("#error-close").click(function () {
            $("#msg-error").hide(100);
        });
    })
</script>
