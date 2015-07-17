<!--#include file="../../Include/Code.asp"-->
<!--#include file="../../Include/Conn.asp"-->
<!--#include file="click_logs.asp"-->

<%
if instr(lcase(Request.ServerVariables("HTTP_REFERER")), "free.asp") = 0 then 
   Response.Redirect "index.asp?cf="&paraCFCode
   response.end
end if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--#include file="meta.asp"-->

<!-- Facebook Conversion Code for 康軒（名單收集） -->
<script>(function() {
  var _fbq = window._fbq || (window._fbq = []);
  if (!_fbq.loaded) {
    var fbds = document.createElement('script');
    fbds.async = true;
    fbds.src = '//connect.facebook.net/en_US/fbds.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(fbds, s);
    _fbq.loaded = true;
  }
})();
window._fbq = window._fbq || [];
window._fbq.push(['track', '6014826058543', {'value':'0.00','currency':'USD'}]);
</script>
<noscript><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?ev=6014826058543&amp;cd[value]=0.00&amp;cd[currency]=USD&amp;noscript=1" /></noscript>

<!-- Google Code for &#20116;&#26376;&#20221;_&#36681;&#25563;&#21517;&#21934;code Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 964848741;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "2XakCNOb0lsQ5diJzAM";
var google_remarketing_only = false;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/964848741/?label=2XakCNOb0lsQ5diJzAM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<!-- YAHOO！關鍵字 -->
<script>(function(w,d,t,r,u){var f,n,i;w[u]=w[u]||[],f=function(){var o={ti:"4010385"};o.q=w[u],w[u]=new UET(o),w[u].push("pageLoad")},n=d.createElement(t),n.src=r,n.async=1,n.onload=n.onreadystatechange=function(){var s=this.readyState;s&&s!=="loaded"&&s!=="complete"||(f(),n.onload=n.onreadystatechange=null)},i=d.getElementsByTagName(t)[0],i.parentNode.insertBefore(n,i)})(window,document,"script","//bat.bing.com/bat.js","uetq");</script>


<!-- 原生廣告！ -->
<script type="application/javascript" src="https://s.yimg.com/wi/ytc.js"></script><script type="application/javascript">YAHOO.ywa.I13N.fireBeacon([{"projectId" : "10001495170292","coloId" : "SP","properties" : {/*"documentName" : "",*/"pixelId" : "22669","qstrings" : {}}}]);</script>

</head>

<body>
<div class="wraper">
  
  <div><img src="images/head.gif" width="980" height="167" /></div>
  <div style="background:#fff;">
    <div id="sub_l">
      <ul class="submenu1">
        <li class="s_no"><a href="intro_s.asp?cf=<%=paraCFCode%>">學前版(學齡前適讀)</a></li>
        <li class="m_no"><a href="intro_m.asp?cf=<%=paraCFCode%>">初階版(低中年級適讀)</a></li>
        <li class="nolink"></li>
      </ul>
      <br class="clean" />
    </div>
    <div id="sub_r"><a href="free.asp?cf=<%=paraCFCode%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','images/otherbtn1_over.png',1)"><img src="images/btn_run_05.gif" name="Image10" width="188" height="53" border="0" id="Image10" /></a><a href="index.asp?cf=<%=paraCFCode%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','images/otherbtn2_over.png',1)"><img src="images/otherbtn2_out.png" name="Image5" width="123" height="53" border="0" id="Image5" /></a></div>
    <br class="clean" />
  </div>
  <div><img src="images/pic_08.jpg" width="980" height="41" /></div>
  <div style="background:url(images/pic_09.jpg) repeat-y;">
    <div style="padding:0 70px;">
      <div style="padding:15px 40px;text-align:center;">
        <p style="font-size:21px;color:#0076c0;font-weight:bolder;line-height:39px;">感謝您索取康軒學習雜誌試讀本+CD，雜誌將於4-5週寄送。</p>
<p style="font-size:16px;">加碼好禮抽之中獎名單將於<span style="color:#f42e45;font-weight:bolder;">2015/10/07</span>公告於<a href="http://www.top945.com.tw" target="_blank">康軒學習雜誌官網</a></p>
<div style="padding:25px 0 0 0;"><a href="index.asp?cf=<%=paraCFCode%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','images/btn_sure02_10.jpg',1)"><img src="images/btn_sure01_10.jpg" name="Image6" width="154" height="57" border="0" id="Image6" /></a></div>
      </div>
    </div>
  </div>
  <div><img src="images/pic_11.jpg" width="980" height="22" /></div>
  <div class="footer2">康軒文教事業 版權所有© 2015 Kang Hsuan Educational Publishing Corp. All Rights Reserved</div>
</div>
<!--#include file="marketing.asp"-->
</body>
</html>
<!--#include file="../../Include/Disconn.asp" -->