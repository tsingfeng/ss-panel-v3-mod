


{include file='user/header_info.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">节点信息</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">
					<div class="row">
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">注意！</p>
										<p>配置文件以及二维码请勿泄露！</p>
									</div>
									
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">配置信息</p>
										<p>服务器地址：{$ary['server']}<br
										>
										服务器端口：{$ary['server_port']}<br
										>
										加密方式：{$ary['method']}<br
										>
										密码：{$ary['password']}<br
										></p>
									</div>
									
								</div>
							</div>
						</div>					
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">客户端下载</p>
										<p><a href="/downloads/client/ShadowsocksR-win.7z"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a></p>
										<p><a href="/downloads/client/ShadowsocksX.dmg"><i class="icon icon-lg">laptop_mac</i>&nbsp;Mac OS X</a></p>
										<p><a href="https://github.com/shadowsocks/shadowsocks-qt5/wiki/Installation"><i class="icon icon-lg">laptop_windows</i>&nbsp;Linux</a></p>
										<p><a href="/downloads/client/shadowsocks.apk"><i class="icon icon-lg">android</i>&nbsp;Android</a></p>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">配置Json</p>
										<textarea class="form-control" rows="6">{$json_show}</textarea>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">配置链接</p>
										<input id="ss-qr-text" class="form-control" value="{$ssqr}">
										<a href="{$ssqr}"/>Android 手机上用默认浏览器打开点我就可以直接添加了</a>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">配置二维码</p>
										<div class="text-center">
											<div id="ss-qr"></div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">iOS9 上 Surge配置</p>
										<div class="row">
											<div class="col-md-12">
												<p>您要先安装 surge 。</p>
												以下安装方法来源于互联网。
												<p>1、电脑上安装 PP 助手 <a href="http://pro.25pp.com"/>http://pro.25pp.com</a>。</p>
												<p>2、然后 手机连电脑，然后信任 PP助手。</p>
												<p>3、下载 surge(<a href="{$global_url}/Surge_pp.ipa">{$global_url}/Surge_pp.ipa</a>)，用 PP 助手安装。</p>
												<p>配置的话，这里有两种方法：</p>
												<h4>第一种：直接下载生成好的配置文件，然后在 APP 里添加设置时选择 Download configuration from URL ，把地址粘贴进去添加。</h4>
												<p>第一种分流方式，按照域名的文件下载地址，点击直接下载：<a href="{$link1}">{$link1}</a></p>

												<p>第二种分流方式，按照地区的文件下载地址，感谢 @Tony 提供，点击直接下载：<a href="{$link2}">{$link2}</a></p>
												<br>
												<h4>第二种：Surge使用步骤</h4>

												<p>基础配置只需要做一次：
												<ol>
													<li>打开 Surge ，点击右上角“Edit”，点击“Download Configuration from URL”</li>
													<li>输入基础配置的地址（或扫描二维码得到地址，复制后粘贴进来），点击“OK”</li>
													<li><b>注意：</b>基础配置不要改名，不可以直接启用。</li>
												</ol>
												</p>
												<p>代理配置需要根据不同的节点进行添加：
												<ol>
													<li>点击“New Empty Configuration”</li>
													<li>在“NAME”里面输入一个配置文件的名称</li>
													<li>点击下方“Edit in Text Mode”</li>
													<li>输入代理配置的全部文字（或扫描二维码得到配置，复制后粘贴进来），点击“OK”</li>
													<li>直接启用代理配置即可科学上网。</li>
												</ol>
												</p>
											</div>
											<div class="col-md-12">
												<h4>基础配置</h4>

												<div class="text-center">
													<div id="surge-base-qr"></div>
												</div>
												<textarea id="surge-base-text" class="form-control" rows="6">{$surge_base}</textarea>
											</div>
											<div class="col-md-12">
												<h4>代理配置</h4>

												<div class="text-center">
													<div id="surge-proxy-qr"></div>
												</div>
												<textarea id="surge-proxy-text" class="form-control" rows="6">{$surge_proxy}</textarea>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						
						
					</div>
				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


<script src=" /assets/public/js/jquery.qrcode.min.js "></script>
<script>
	var text_qrcode = jQuery('#ss-qr-text').val();
	jQuery('#ss-qr').qrcode({
		"text": text_qrcode
	});
	var text_surge_base = jQuery('#surge-base-text').val();
	jQuery('#surge-base-qr').qrcode({
		"text": text_surge_base
	});
	var text_surge_proxy = jQuery('#surge-proxy-text').text();
	jQuery('#surge-proxy-qr').qrcode({
		"text": text_surge_proxy
	});
</script>
