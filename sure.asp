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
<!--#include file="meta.asp"-->
<!--#include file="link_css.asp"-->
<!--#include file="marketing_sure.asp"-->

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
<p style="font-size:16px;">加碼好禮抽之中獎名單將於<span style="color:#f42e45;font-weight:bolder;">2015/10/07</span>公告於<a href="https://www.top945.com.tw" target="_blank">康軒學習雜誌官網</a></p>
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