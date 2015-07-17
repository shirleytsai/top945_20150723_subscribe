<!--#include file="../../Include/Code.asp"-->
<!--#include file="../../Include/Conn.asp"-->
<!--#include file="click_logs.asp"-->

<%
	set regex = new regexp 
	regex.ignorecase = true 
	regex.global = true 
	regex.pattern = "mini 9.5|vx1000|lge |m800|e860|u940|ux840|compal|wireless| mobi|ahong|lg380|lgku|lgu900|lg210|lg47|lg920|lg840|lg370|sam-r|mg50|s55|g83|t66|vx400|mk99|d615|d763|el370|sl900|mp500|samu3|samu4|vx10|xda_|samu5|samu6|samu7|samu9|a615|b832|m881|s920|n210|s700|c-810|_h797|mob-x|sk16d|848b|mowser|s580|r800|471x|v120|rim8|c500foma:|160x|x160|480x|x640|t503|w839|i250|sprint|w398samr810|m5252|c7100|mt126|x225|s5330|s820|htil-g1|fly v71|s302|-x113|novarra|k610i|-three|8325rc|8352rc|sanyo|vx54|c888|nx250|n120|mtk |c5588|s710|t880|c5005|i;458x|p404i|s210|c5100|teleca|s940|c500|s590|foma|samsu|vx8|vx9|a1000|_mms|myx|a700|gu1100|bc831|e300|ems100|me701|me702m-three|sd588|s800|8325rc|ac831|mw200|brew |d88|htc\/|htc_touch|355x|m50|km100|d736|p-9521|telco|sl74|ktouch|m4u\/|me702|8325rc|kddi|phone|lg |sonyericsson|samsung|240x|x320vx10|nokia|sony cmd|motorola|up.browser|up.link|mmp|symbian|smartphone|midp|wap|vodafone|o2|pocket|kindle|mobile|psp|treo|iris|3g_t|windows ce|opera mobi|windows ce; smartphone;|windows ce; iemobile|ipod|iphone|android|opera mini|blackberry|palm os|palm|hiptop|avantgo|fennec|plucker|xiino|blazer|elaine|iris|3g_t|windows ce|opera mobi|windows ce; smartphone;|windows ce; iemobile"
	agent = request.ServerVariables("HTTP_USER_AGENT") & "" 
	if agent <> "" then 
	if regex.test(agent) then 
	   response.redirect("mobile/free.asp?cf=" & paraCFCode ) 
	end if 
	end if	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="meta.asp"-->
<!--#include file="link_css.asp"-->

</head>

<body>
<div class="wraper">
<!--background:#fff;--><div width="800" align="right" style="font-size:12px; padding: 4px 10px 3px 0px;"><img src="images/facebook_16.png" width="16" height="16" border="0" align="texttop"/> <a class="sm_share" href="javascript: void(window.open('http://www.facebook.com/sharer.php?u='.concat(encodeURIComponent(location.href)).concat('&t=').concat(encodeURIComponent(document.title))));">推至Facebook</a></div>
<table width="980" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="https://www.top945.com.tw" target="_blank"><img src="images/index_01.gif" width="980" height="130" border="0" /></a></td>
  </tr>
  <tr>
    <td><img src="images/index_02.gif" width="980" height="354" border="0" /></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/index_03.gif" width="278" height="268" border="0" /></td>
        <td><img src="images/index_04.gif" width="287" height="268" border="0" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><a href="intro_s.asp?cf=<%=paraCFCode%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image11','','images/menuover_05.jpg',1)"><img src="images/btn1_gif_05.gif" alt="雜誌介紹" title="雜誌介紹" name="Image11" width="285" height="57" border="0" id="Image11" /></a></td>
        </tr>
      <tr>
        <td><a href="free.asp?cf=<%=paraCFCode%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','images/menuover_06.jpg',1)"><img src="images/btn2_gif_06.gif" alt="免費索取雜誌試讀版" title="免費索取雜誌試讀版" name="Image10" width="285" height="61" border="0" id="Image10" /></a></td>
        </tr>
      <tr>
        <td><img src="images/index_05.gif" width="285" height="150" border="0" /></td>
        </tr>
        </table></td>
        <td><img src="images/index_06.gif" width="130" height="268" border="0" /></td>
      </tr>
    </table></td>
  </tr>  </table>
</div>
<!--#include file="marketing.asp"-->
</body>
</html>
<!--#include file="../../Include/Disconn.asp" -->