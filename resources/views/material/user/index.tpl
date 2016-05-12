





{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">用户中心</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">
					
						<div class="col-lg-6 col-md-6">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">公告</p>
										<div class="card-table">
											<div class="table-responsive">
												<table class="table">
													<tr>
														<th>ID</th>
														<th>日期</th>
														<th>内容</th>
													</tr>
													{foreach $anns as $ann}
														<tr>
															<td>#{$ann->id}</td>
															<td>{$ann->date}</td>
															<td>{$ann->content}</td>
														</tr>
													{/foreach}
												</table>
											</div>
										</div>
									</div>
									
								</div>
							</div>
							
						
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">最近一天使用IP</p>
										<p>请确认都为自己的IP，如有异常请及时修改连接密码。部分节点不支持记录。</p>
										<div class="card-table">
											<div class="table-responsive">
												<table class="table">
													<tr>
														
														<th>IP</th>
														<th>归属地</th>
													</tr>
													{foreach $userip as $single=>$location}
														<tr>
															
															<td>{$single}</td>
															<td>{$location}</td>
														</tr>
													{/foreach}
												</table>
											</div>
										</div>
									</div>
									
								</div>
							</div>
							
						
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">最近10次登录IP</p>
										<p>请确认都为自己的IP，如有异常请及时修改密码。</p>
										<div class="card-table">
											<div class="table-responsive">
												<table class="table">
													<tr>
														
														<th>IP</th>
														<th>归属地</th>
													</tr>
													{foreach $userloginip as $single=>$location}
														<tr>
															
															<td>{$single}</td>
															<td>{$location}</td>
														</tr>
													{/foreach}
												</table>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">FAQ</p>
										<p>流量不会重置，可以通过续命获取流量。</p>

										<p>每次续命可以获取{$config['checkinMin']}~{$config['checkinMax']}MB流量。</p>
									</div>
									
								</div>
							</div>
							
						</div>
						
						<div class="col-lg-6 col-md-6">
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">All-in-One</p>
										<p>这里为您提供了自动化地配置文件生成，包含了所有 Shadowsocks 服务器的信息，方便您在诸多的服务器中快速添加，快速切换。</p>
										<p><a href="/downloads/client/ShadowsocksR-win.7z"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows下载这个</a>，解压，然后下载<a href="/user/getpcconf">这个</a>，放到程序目录下，运行程序，选择一个合适的服务器，更新一下PAC为绕过国内IP，然后开启系统代理即可上网。</p>
										<!--<p><a href="/downloads/client/ShadowsocksX.dmg"><i class="icon icon-lg">laptop_mac</i>&nbsp;Mac OS X下载这个</a>，安装，然后下载<a href="/user/getpcconf">这个</a>，放到程序目录下，运行程序，选择一个合适的服务器，更新一下PAC，然后开启系统代理即可上网。</p>-->
										<p><i class="icon icon-lg">laptop_mac</i>&nbsp;iOS 下载<a href="/link/{$ios_token}">这个</a>，导入到 Surge 中，然后就可以随意切换服务器上网了。</p>
										<p><a href="/downloads/client/shadowsocks.apk"><i class="icon icon-lg">android</i>&nbsp;Android下载这个</a>，安装，然后在手机上默认浏览器中点击<a id="android_add">这个</a>，然后一直点击确定，批量添加完服务器，然后路由选择绕过大陆，右上角开启就可以上网了。(此方法还在测试中，可能会出现问题)</p>
									</div>
									
								</div>
							</div>
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">帐号使用情况</p>
										<dl class="dl-horizontal">
											<dt>帐号等级</dt>
											<dd>{$user->class}</dd>

											<dt>等级过期时间</dt>
											<dd>{$user->class_expire}</dd>

											<dt>帐号过期时间</dt>
											<dd>{$user->expire_in}</dd>
											
											<dt>速度限制</dt>
											{if $user->node_speedlimit!=0}
											<dd>{$user->node_speedlimit}Mbps</dd>
											{else}
											<dd>不限速</dd>
											{/if}
										</dl>
									</div>
									
								</div>
							</div>
							
							
						
							
						
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">流量使用情况</p>
											<div class="row">
												<div class="col-xs-12">
													<div class="progress progress-striped progress-green">
														<div class="progress-bar" role="progressbar" aria-valuenow="40"
															 aria-valuemin="0" aria-valuemax="100"
															 style="width: {$user->trafficUsagePercent()}%">
															<span class="sr-only">Transfer</span>
														</div>
													</div>
												</div>
											</div>
											<dl class="dl-horizontal">
												<dt>总流量</dt>
												<dd>{$user->enableTraffic()}</dd>

												<dt>今日使用流量</dt>
												<dd>{(($user->u+$user->d)-$user->last_day_t)/1024/1024}MB</dd>

												<dt>总已用流量</dt>
												<dd>{$user->usedTraffic()}</dd>
												<dt>剩余流量</dt>
												<dd>{$user->unusedTraffic()}</dd>
											</dl>
									</div>
									
								</div>
							</div>
						
						
					
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">续命获取流量</p>
											<p> 每天可以续命一次。</p>

											<p>上次续命时间：<code>{$user->lastCheckInTime()}</code></p>
											
											<p id="checkin-msg"></p>
									</div>
									
									<div class="card-action">
										<div class="card-action-btn pull-left">
											{if $user->isAbleToCheckin() }
												<p id="checkin-btn">
													<button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;续命</button>
												</p>
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">check</span>&nbsp;不能续命</a></p>
											{/if}
										</div>
									</div>
									
								</div>
							</div>
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">连接信息</p>
											<dl class="dl-horizontal">
												<dt>端口</dt>
												<dd>{$user->port}</dd>
												<dt>密码</dt>
												<dd>{$user->passwd}</dd>
												<!--
												<dt>加密方式</dt>
												<dd>{$user->method}</dd>
												-->
												<dt>上次使用</dt>
												<dd>{$user->lastSsTime()}</dd>
											</dl>
									</div>
									
								</div>
							</div>
						
						
						
						
						{if $duoshuo_shortname!=""}
						
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">讨论区</p>
											<div class="ds-thread" data-thread-key="0" data-title="index" data-url="{$baseUrl}/user/"></div>
											<script type="text/javascript">
											var duoshuoQuery = {

											short_name:"{$duoshuo_shortname}"


											};
												(function() {
													var ds = document.createElement('script');
													ds.type = 'text/javascript';ds.async = true;
													ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
													ds.charset = 'UTF-8';
													(document.getElementsByTagName('head')[0] 
													 || document.getElementsByTagName('body')[0]).appendChild(ds);
												})();
											</script>
									</div>
									
								</div>
							</div>
						
						{/if}
						
						{include file='dialog.tpl'}
						
					</div>
						
					
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


<script>
    $(document).ready(function () {
        $("#checkin").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
					$("#result").modal();
                    $("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					$("#result").modal();
                    $("#msg").html("发生错误：" + jqXHR.status);
                }
            })
        })
    })
	$("#android_add").click(function(){
		var links = new Array({$android_add});
		for(var i=0; i<links.length; i++){
			window.open (links[i]);
		}
	});
	
</script>