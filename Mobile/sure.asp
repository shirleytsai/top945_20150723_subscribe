<!--#include file="../../../Include/Code.asp"-->
<!--#include file="../../../Include/Conn.asp"-->
<!--#include file="../click_logs.asp"-->
<%
if instr(lcase(Request.ServerVariables("HTTP_REFERER")), "free.asp") = 0 then 
   Response.Redirect "free.asp?cf="&paraCFCode
   response.end
end if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="../meta.asp"-->
<!--#include file="link_css_mobile.asp"-->
<!--#include file="../marketing_sure.asp"-->
</head>

<body>
<div id="wrapper">
  <div class="cont1">    <!--表單開始-->    
    <div><img src="images/pic_08.jpg" width="100%" border="0" /></div>
  <div>
    <div style="padding:0 8px;">
      <div style="padding:30px 40px;text-align:center;">
        <p style="font-size:18px;color:#0076c0;font-weight:bolder;line-height:32px;text-align:left;">感謝您索取康軒學習雜誌試讀本+CD，雜誌將於4-5週寄送。</p><br />
<p style="font-size:16px;text-align:left;"">加碼好禮抽之中獎名單將於&nbsp;<span class="pink">2015/10/07</span>&nbsp;公告於&nbsp;<a href="https://www.top945.com.tw" target="_blank">康軒學習雜誌官網</a></p>

<div style="padding:25px 0 0 0;"><a href="free.asp?cf=<%=paraCFCode%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image6','','images/btn_sure02_10.jpg',1)"><img src="images/btn_sure01_10.jpg" name="Image6" width="154" height="57" border="0" id="Image6" /></a></div>

      </div>
    </div>
  </div>
<!--表單結束-->    
    <br class="clean" />
</div>
    <div><img src="images/pic_11.jpg" width="100%" height="22" border="0" /></div>
  <div class="cont2">
    <p>康軒文教事業版權所有 © 2015 Kang Hsuan Educational Publishing Chorp. All Rights Reserved </p>
  </div>
</div>
<!--#include file="../marketing.asp"-->
</body>
</html>
<!--#include file="../../../Include/Disconn.asp" -->