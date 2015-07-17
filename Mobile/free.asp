<!--#include file="../../../Include/Code.asp"-->
<!--#include file="../../../Include/Conn.asp"-->
<!--#include file="../click_logs.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<!--#include file="../meta.asp"-->
<!--#include file="link_css_mobile.asp"-->
<script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script> 


<script language="javascript">
Msg = "";
mvfocus=""
function trim(str)
{
 return str.replace(/(^\s*)|(\s*$)/g,"");
}
function CheckData()
{
 if (!CheckRadio(document.Form.StepAB)) { Msg = Msg + "\n請輸入『版本』"; if(mvfocus=="") mvfocus=document.Form.StepAB[0]; }
 if (trim(document.Form.Name.value) == "") 
     { Msg = Msg + "\n請輸入『家長姓名』"; if(mvfocus=="") mvfocus=document.Form.Name; }
 else
 {
     if ((document.Form.Name.value.indexOf('\'', 0) != -1) || ( document.Form.Name.value.indexOf('\"', 0) != -1)) 
	      { Msg = Msg + "\n『家長姓名』欄位含有非法字元"; if(mvfocus=="") mvfocus=document.Form.Name;}
     if (!checkCName(document.Form.Name)) { Msg = Msg + "\n『家長姓名』請填寫完整中文姓名"; if(mvfocus=="") mvfocus=document.Form.Name;}
 }
 if (trim(document.Form.Phone.value) == "") { Msg = Msg + "\n請輸入『手機號碼』"; if(mvfocus=="") mvfocus=document.Form.Phone;}
 if (!(document.Form.Phone.value == '') && (document.Form.Phone.value.length != 10)) { Msg = Msg + "\n請填寫完整『手機號碼』"; if(mvfocus=="") mvfocus=document.Form.Phone; }
 if (trim(document.Form.Tel_O1.value) == "") { Msg = Msg + "\n請輸入『市內電話 - 區碼』"; if(mvfocus=="") mvfocus=document.Form.Tel_O1;}
 else if ((trim(document.Form.Tel_O1.value).length < 2) || (trim(document.Form.Tel_O1.value).length > 4)) { Msg = Msg + "\n請填寫完整「聯絡電話」含區碼"; if(mvfocus=="") mvfocus=document.Form.Tel_O1;}
 if (trim(document.Form.Tel_O2.value) == "") { Msg = Msg + "\n請輸入『市內電話 - 電話』"; if(mvfocus=="") mvfocus=document.Form.Tel_O2;}
 else if ((trim(document.Form.Tel_O2.value).length < 5)|| (trim(document.Form.Tel_O2.value).length > 8)) { Msg = Msg + "\n請填寫完整「聯絡電話」含區碼"; if(mvfocus=="") mvfocus=document.Form.Tel_O2;}
 
 if (trim(document.Form.Email.value) == "") { Msg = Msg + "\n請輸入『Email』"; if(mvfocus=="") mvfocus=document.Form.Email;}
   else if(!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(document.Form.Email.value))) { Msg = Msg + "\n『Email』格式錯誤"; if(mvfocus=="") mvfocus=document.Form.Email; } 
 //if (trim(document.Form.ZipCode.value) == "") { Msg = Msg + "\n請輸入『郵遞區號』"; }
 //if ((document.Form.ZipCode.value.indexOf('\'', 0) != -1) || ( document.Form.ZipCode.value.indexOf('\"', 0) != -1)) { Msg = Msg + "\n『郵遞區號』不得有單引號或雙引號"; }
 if (document.Form.City.value == "") { Msg = Msg + "\n請輸入『收件地址 - 縣市』"; if(mvfocus=="") mvfocus=document.Form.City;}
 if (document.Form.Area.value == "") { Msg = Msg + "\n請輸入『收件地址 - 區域』"; if(mvfocus=="") mvfocus=document.Form.Area;}
 if (trim(document.Form.Address.value) == "") { Msg = Msg + "\n請輸入『收件地址』"; if(mvfocus=="") mvfocus=document.Form.Address; }
 if ((document.Form.Address.value.indexOf('\'', 0) != -1) || ( document.Form.Address.value.indexOf('\"', 0) != -1) || ( document.Form.Address.value.indexOf('\,', 0) != -1)) { Msg = Msg + "\n『地址』不得有單引號或雙引號或逗號";   if(mvfocus=="") mvfocus=document.Form.Address;}
 if (document.Form.Year.value == "" ) { Msg = Msg + "\n請輸入『小孩生日 - 年份』";   if(mvfocus=="") mvfocus=document.Form.Year;}
 if (document.Form.Month.value == "" ) { Msg = Msg + "\n請輸入『小孩生日 - 月份』";   if(mvfocus=="") mvfocus=document.Form.Month;}
 //if (!document.Form.GetNews.checked) { Msg = Msg + "\n請勾選『已閱讀特別聲明事項』";  if(mvfocus=="") mvfocus=document.Form.GetNews;}
}

function checkCName(sfield)  
{  
 var str=sfield.value; 
 if (str.length < 2 ) return false;
 
 var reg = /^[\u4e00-\u9fa5]+$/i; 
 if (!reg.test(str))  
    return false;  
 else  
    return true;   
}  

function CheckRadio(sfield) {
    for(var i=0; i<sfield.length; i++) {
        if(sfield[i].checked)
            return true;
    	}
    return false;
}

function Fun_Send()
{
 Msg = "";
 mvfocus="";
 CheckData();

 if ( Msg == "")
 {
    document.Form.submit();
 }
 else
 {
  alert("請檢視下列問題：" + Msg);
  if ( mvfocus != ""  ) {mvfocus.focus();mvfocus.select();}
 } 
}


</script>
</head>

<body onload="MM_preloadImages('images/btn_sure_over.jpg','images/facebook_h.png','images/line_h.png')">
<form action="../free_send.asp" method="post" name="Form" id="Form">
<input type="hidden" name="pjid" value="8">	
<input type="hidden" name="cf" value="<%=paraCFCode%>">	
<input type="hidden" name="GetNews" id="GetNews" value="1"/>
<input type="hidden" name="IsMobile" id="IsMobile" value="Y"/>
<a id="returnTop" href="javascript:;"></a> 
<script src="../js/top.js" type="text/javascript"></script>
<div id="wrapper"><!--容器開始-->
  <div class="icon right"><table cellpadding="0" cellspacing="6" border="0" width="100%">
          <tr>
              <td><a href="http://line.me/R/msg/text/?%E5%8D%B3%E6%97%A5%E8%B5%B7%E8%87%B32015%E5%B9%B49%E6%9C%8830%E6%97%A5%E6%AD%A2%EF%BC%8C%E7%AB%8B%E5%8D%B3%E7%B4%A2%E5%8F%96%E5%BA%B7%E8%BB%92%E5%AD%B8%E7%BF%92%E9%9B%9C%E8%AA%8C(%E8%A9%A6%E8%AE%80%E6%9C%AC%2BCD)%EF%BC%8C%E5%86%8D%E6%8A%BD%E7%B2%BE%E9%81%B8%E5%AD%B8%E5%85%B7%E7%B5%84%EF%BC%81%0Ahttps%3A%2F%2Fwww.top945.com.tw%2Fpromo%2F20150723%2F" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','images/line_h.png',1)"><img src="images/line.png" title="用LINE傳送" alt="用LINE傳送" name="Image9" width="100%" border="0" id="Image9" /></a></td>
      </tr>
          <tbody>
            <tr>
            <td><a href="javascript: void(window.open('http://www.facebook.com/sharer.php?u='.concat(encodeURIComponent(location.href)).concat('&t=').concat(encodeURIComponent(document.title))));" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image81','','images/facebook_h.png',1)"><img src="images/facebook.png" title="Facebook" alt="Facebook" name="Image81" width="100%" border="0" id="Image81" /></a></td>
          </tr>
          </tbody>
        </table></div>
  <div class="icon480 right"><table cellpadding="0" cellspacing="6" border="0" width="100%">
          <tr>
              <td><a href="http://line.me/R/msg/text/?%E5%8D%B3%E6%97%A5%E8%B5%B7%E8%87%B32015%E5%B9%B49%E6%9C%8830%E6%97%A5%E6%AD%A2%EF%BC%8C%E7%AB%8B%E5%8D%B3%E7%B4%A2%E5%8F%96%E5%BA%B7%E8%BB%92%E5%AD%B8%E7%BF%92%E9%9B%9C%E8%AA%8C(%E8%A9%A6%E8%AE%80%E6%9C%AC%2BCD)%EF%BC%8C%E5%86%8D%E6%8A%BD%E7%B2%BE%E9%81%B8%E5%AD%B8%E5%85%B7%E7%B5%84%EF%BC%81%0Ahttps%3A%2F%2Fwww.top945.com.tw%2Fpromo%2F20150723%2F" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','images/line_h.png',1)"><img src="images/line.png" title="用LINE傳送" alt="用LINE傳送" name="Image9" width="100%" border="0" id="Image9" /></a></td>
      </tr>
          <tbody>
            <tr>
            <td><a href="javascript: void(window.open('http://www.facebook.com/sharer.php?u='.concat(encodeURIComponent(location.href)).concat('&t=').concat(encodeURIComponent(document.title))));" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image81','','images/facebook_h.png',1)"><img src="images/facebook.png" title="Facebook" alt="Facebook" name="Image81" width="100%" border="0" id="Image81" /></a></td>
          </tr>
          </tbody>
        </table></div>
  <div class="cont1">
  <p align="center"><a href="free.asp?cf=<%=paraCFCode%>"><img src="images/index_01.gif" width="100%" border="0"></a></p>
    <p align="center"><img src="images/index_02.gif" width="100%" border="0"></p>
    <p align="center"><img src="images/index_03.gif" width="100%" border="0"></p>
    <p align="center"><img src="images/index_04.gif" width="100%" border="0"></p>
<!--表單開始-->    
    <div><img src="images/pic_08.jpg" width="100%" border="0" /></div>
  <div>
    <div style="padding:0 8px;">
      <div style="padding:0 0 20px 0;text-align:center;"><img src="images/title_03.jpg" width="95%" border="0" /></div>
      <table width="90%" border="0" align="center" cellpadding="2" cellspacing="0">
        <tr>
          <td colspan="2"><span class="pink">＊本活動即日起～2015/09/30截止</span></td>
          </tr>
        <tr style="font-size: 12px;">
          <td width="30%" valign="top" ><span class="org_b">＊</span><span>我想索取</span></td>
          <td > 
            <table border="0" align="left" cellpadding="4" cellspacing="0">
              <tr>
                <td><label><input type="radio" name="StepAB" id="StepAB3" value="C" />&nbsp;&nbsp;學前版（學齡前適讀）</label></td>
              </tr>
              <tr>
                <td><label><input type="radio" name="StepAB" id="StepAB2" value="A" />&nbsp;&nbsp;初階版（低中年級適讀）</label></td>
              </tr>
              <tr>
                <td><label><input type="radio" name="StepAB" id="StepAB4" value="B" />&nbsp;&nbsp;進階版（中高年級~國中適讀）</label></td>
              </tr>
            </table></td>
        </tr>
        <tr style="font-size: 12px;">
          <td valign="top"><span class="org_b">＊</span><span>家長姓名</span></td>
          <td><input name="Name" type="text" id="Name" size="10" maxlength="10" /></td>
        </tr>
        <tr style="font-size: 12px;">
          <td valign="top"><span class="org_b">＊</span><span>手機</span></td>
          <td><input type="text" placeholder="例 0987654321" name="Phone" id="Phone" size="10" maxlength="10" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" /></td>
        </tr>
        <tr style="font-size: 12px;">
          <td valign="top"><span class="org_b">＊</span><span>市內電話</span></td>
          <td><input type="text" placeholder="例 02"  name="Tel_O1" id="Tel_O1" style="width:32px;" size="1" maxlength="3" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" />
           - 
            <input type="text" placeholder="12345678" name="Tel_O2" id="Tel_O2" size="6" maxlength="8" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" />
            分機 
            <input type="text" name="Tel_O3" id="Tel_O3" style="width:32px;" size="1" maxlength="6" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" /></td>
        </tr>
        <tr style="font-size: 12px;">
          <td valign="top"><span class="org_b">＊</span><span>E-MAIL</span></td>
          <td><input type="text" name="Email" id="Email" size="22" maxlength="50" /></td>
        </tr>
        <tr style="font-size: 12px;">
          <td valign="top"><span class="org_b">＊</span><span>收件地址</span></td>
          <td><input name="ZipCode" style="width:22px;" type="text" size="1" maxlength="5" readonly="readonly" />
		  <select style="width:70px;" name="City" id="City" onchange="ChangeCode(Form.City, Form.Area);Form.ZipCode.value='';">
              <option value="">縣市</option>		  
<%
SQL = "Select ID, CodeText From VW_KNSHWebDB_SystemCodeDefined Where CodeType = 'CityCode' And CodeFather = '-1' And Active = '1' And Del = '0' Order By CAST(SortBy As Int)"
Set rs = Conn.Execute(SQL)
While Not rs.EOF
 Response.Write "  <option value=""" & rs("ID") & """"
 Response.Write ">" & rs("CodeText") & "</option>" & vbCrLf 
 rs.MoveNext
Wend
rs.Close
Set rs = Nothing
%>				
              </select>
              <select style="width:90px;" name="Area" id="Area" onchange="ChangeCode2(Form.City, Form.Area, Form.ZipCode);">
                <option value="">區域</option>
              </select>			  
              <input class="textbox" name="Address" type="text" id="Address" size="22" maxlength="200"/>
            </td>
<script>
<!--
C0 = new Array("","","區域");
<%
   Code_Index = 1
   SQL = "Select ID From VW_KnshWebDB_SystemCodeDefined Where CodeType = 'CityCode' And CodeFather = '-1' And Active = '1' And Del = '0' Order By CAST(SortBy As Int)"
   Set rs = Conn.Execute(SQL)
   While Not rs.EOF
    Response.Write "C" & Code_Index & " = new Array("""","""",""區域"""
    SQLDetail = "Select ID, CodeValue, CodeText From VW_KnshWebDB_SystemCodeDefined Where CodeType = 'CityCode' And CodeFather = " & rs("ID") & " And Active = '1' And Del = '0' Order By CAST(SortBy As Int), ID"
    Set rsDetail = Conn.Execute(SQLDetail)
    While Not rsDetail.EOF
     Response.Write ",""" & rsDetail("ID") & """,""" & rsDetail("CodeValue") & """,""" & rsDetail("CodeText") & """"
     rsDetail.MoveNext
    Wend
    rsDetail.Close
    Set rsDetail = Nothing
    rs.MoveNext
    Code_Index = Code_Index + 1
    Response.Write ");" & vbCrLf
   Wend
   rs.Close
   Set rs = Nothing
%>
function updateAreaList( objwin, areajava )
{
 iCLength = areajava.length / 3 ;
 objwin.length = iCLength;
 objwin.options[0].selected=true ;
 for (i=0; i<iCLength; i++)
 {
  objwin.options[i].value = areajava[i*3];
  objwin.options[i].text = areajava[i*3+2];
  if ( objwin.name == "Area" )
  {
   if ( objwin.options[i].value == "<%=Area%>")
   {
    objwin.options[i].selected=true ;
   }
  }
  if ( objwin.name == "SchoolArea" )
  {
   if ( objwin.options[i].value == "<%=SchoolArea%>")
   {
    objwin.options[i].selected=true ;
   }
  }
 }
 return true;
}

function ChangeCode( objwin, obj )
{
<%
    For i = 0 To Code_Index - 1
     Response.Write " if (objwin.options[" & i & "].selected ) {updateAreaList( obj, C" & i & " ); }" & vbCrLf
    Next
%>
}
	  
function updateAreaList2( objwin, obj, areajava )
{
 obj.value = areajava[objwin.selectedIndex*3+1];
 return true;
}

function ChangeCode2( win, objwin, obj )
{
<%
   For i = 0 To Code_Index - 1
    Response.Write " if (win.options[" & i & "].selected ) {updateAreaList2( objwin, obj, C" & i & " ); }" & vbCrLf
   Next
%>
}

ChangeCode(Form.City, Form.Area);
ChangeCode2(Form.City, Form.Area, Form.ZipCode);

//-->
</script>				
        <tr style="font-size: 12px;">
          <td valign="top"><span class="org_b">＊</span><span>小孩生日</span></td>
          <td>西元
			<select name="Year" id="Year" style="width:66px;" >
                <option value="">請選擇</option>
<%
For i = year(now())-13 To year(now())-3
 Response.Write "                <option value=""" & Right("0"&i,4) & """>" & Right("0"&i,4) & "</option>" & vbCrLf
Next
%>						
              </select>
            年
			<select name="Month" id="Month" style="width:66px;" >
                <option value="">請選擇</option>
<%
For i = 1 To 12
 Response.Write "                <option value=""" & Right("00"&i,2) & """>" & Right("00"&i,2) & "</option>" & vbCrLf
Next
%>					
              </select>
            月</td>
        </tr>
    </table>
    <div class="mark"><img src="images/vo.jpg" width="140" height="33" border="0" /></div>
    <div class="declare">
          <p>康軒文教集團(康軒文教事業股份有限公司、財團法人康軒文教基金會)於存續期間內，基於客戶管理、訂購、索取試閱、行銷活動、產品優惠通知等特定目的，使用您的個人資料，並妥為保存，不會傳輸至其他國家。依個人資料保護法第三條規定，您可對您的個人資料行使以下權利：請求查詢、閱覽、複製本、補充或更正，停止蒐集、處理、利用及刪除。您可拒絕提供個人資料，若您不願意提供真實且正確完整的個人資料，將影響您參加活動，收受出版品及優惠通知之權利。若您有個人資料權益相關問題，請洽&nbsp;<a href="mailto:top945@knsh.com.tw">top945@knsh.com.tw</a>。<br />
            <br />
          <span class="red_b">本人已閱讀並充分瞭解上述告知事項，並同意提供個人資料予康軒文教集團，於前述之目的範圍內蒐集、處理及利用個人資料。</span>
		  </p>
        </div>
    <table width="83%" border="0" align="center" cellpadding="0" cellspacing="0">


	       <tr>
            <td align="center" style="font-size:13px;"><a href="javascript:Fun_Send();"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image11','','images/btn_sure_over.jpg',1)"><img src="images/btn_sure_out.jpg" name="Image11" width="206" height="55" border="0" id="Image11" /></a></td>
          </tr>

        </table>
 <div class="mark"><img src="images/vo2.jpg" width="140" height="33" border="0" /></div>       
      <div class="note">
        <ol>
          <li>本活動至<span class="red">2015/09/30</span>截止，限定家中有3-12歲小朋友的家長親填本人資料索取乙次，未符合前述資格者恕無法寄送。<br />
(Ex：索取學前版幼兒年齡需已滿3歲方符合資格)。</li>
          <li>您所申請的體驗教材將於填寫後4-5週寄送，且不適用於寄送至海外地區。</li>
          <li>加碼好禮抽獎活動將<span class="red">2015/10/07</span>公告於&nbsp;<a href="http://www.top945.com.tw/" target="_blank">康軒學習雜誌官網</a>。每位家長限一次抽獎資格。</li>
          <li>抽獎贈品將於<span class="red">2015/10/20</span>陸續寄送，贈品圖片僅供參考，以實物為準。為了保障您中獎通知與贈品寄送的權益，請填寫正確資料，如資料不全或資格不符者恕無法贈送。</li>
          <li>本活動以體驗教材為主，故不開放康軒學習雜誌現訂戶參加，敬請見諒。</li>
          <li>本活動由康軒學習雜誌提供，保留隨時更改、終止或變更活動之權利。客服專線02-86651740 (服務時間週一~週五9:00-12:00/14:00-17:30)</li>
        </ol>
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
</form>
<!--#include file="../marketing.asp"-->
</body>
</html>
<!--#include file="../../../Include/Disconn.asp" -->