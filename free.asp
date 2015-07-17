<!--#include file="../../Include/Code.asp"-->
<!--#include file="OnlineTime.asp" -->
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
<script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script> 

<script type="text/javascript" src="../../scripts/Javascript.js"></script>
<script language="javascript">
Msg = "";
mvfocus=""
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
 if (!document.Form.GetNews.checked) { Msg = Msg + "\n請勾選『已閱讀特別聲明事項』";  if(mvfocus=="") mvfocus=document.Form.GetNews;}
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

<body>
<form action="free_send.asp" method="post" name="Form">
<input type="hidden" name="pjid" value="8">	
<input type="hidden" name="cf" value="<%=paraCFCode%>">	
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
      <div style="padding:0;text-align:center;"><img src="images/title_03.jpg" width="826" height="114" /></div>
      <div style="width:804px;margin:0 auto;background:url(images/form_top.jpg) no-repeat;"><br />
        <br />
        <br />
        <table width="740" border="0" align="center" cellpadding="4" cellspacing="0">
          <tr>
            <td width="90"><span class="org_b">＊</span>我想索取：</td>
            <td>
			  <label><input type="radio" name="StepAB" id="StepAB" value="C" />
              學前版（學齡前適讀）</label>
              <label><input type="radio" name="StepAB" id="StepAB" value="A" />
              初階版（低中年級適讀）</label>
              <label><input type="radio" name="StepAB" id="StepAB" value="B" />
              進階版（中高年級~國中適讀）</label>
			 </td>	
          </tr>
          <tr>
            <td><span class="org_b">＊</span>家長姓名：</td>
            <td><input name="Name" type="text" id="Name"  /></td>
          </tr>
          <tr>
            <td><span class="org_b">＊</span>手機：</td>
            <td>
			<input type="text" name="Phone" id="Phone" maxlength="10" onkeyup="this.value=this.value.replace(/[^\d]+?/g,'')" onafterpaste="this.value=this.value.replace(/[^\d]+?/g,'')"/>
			&nbsp;&nbsp;<span class="gray">例 0987654321</span>
			</td>
          </tr>
          <tr>
            <td><span class="org_b">＊</span>市內電話：</td>
            <td>
			<input type="text" name="Tel_O1" id="Tel_O1"  size="2" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" />-<input type="text" name="Tel_O2" id="Tel_O2" size="15" maxlength="8" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" />
              分機&nbsp;
              <input type="text" name="Tel_O3" id="Tel_O3" size="3" maxlength="6" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onafterpaste="this.value=this.value.replace(/[^0-9]/g,'')" />              <span class="gray">例 02-12345678</span>
			</td>
          </tr>
          <tr>
            <td><span class="org_b">＊</span>E-MAIL：</td>
            <td><input type="text" name="Email" id="Email" /></td>
          </tr>
          <tr>
            <td><span class="org_b">＊</span>收件地址：</td>
            <td><input name="ZipCode" type="text" size="3" maxlength="5" readonly="readonly" />
			  <select name="City" id="City" onchange="ChangeCode(Form.City, Form.Area);Form.ZipCode.value='';">
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
              <select class="textbox" name="Area" id="Area" onchange="ChangeCode2(Form.City, Form.Area, Form.ZipCode);">
                <option value="">區域</option>
              </select>
			  <input class="textbox" name="Address" type="text" id="Address" size="40" maxlength="200"/></td>
          </tr>
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

          <tr>
            <td><span class="org_b">＊</span>小孩生日：</td>
            <td>西元
              <select name="Year" id="Year">
                <option value="">請選擇</option>
<%
For i = year(now())-13 To year(now())-3
 Response.Write "                <option value=""" & Right("0"&i,4) & """>" & Right("0"&i,4) & "</option>" & vbCrLf
Next
%>				
              </select>
              年
              <select name="Month" id="Month">
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
        <div style="padding:8px 0;"><img src="images/vo.jpg" width="140" height="33" /></div>
        <div style="width:700px;padding:15px;margin:0 auto;border:1px dashed #C60;font-size:13px;line-height:24px;color:#555;">
          <p>康軒文教集團(康軒文教事業股份有限公司、財團法人康軒文教基金會)於存續期間內，基於客戶管理、訂購、索取試閱、行銷活動、產品優惠通知等特定目的，使用您的個人資料，並妥為保存，不會傳輸至其他國家。依個人資料保護法第三條規定，您可對您的個人資料行使以下權利：請求查詢、閱覽、複製本、補充或更正，停止蒐集、處理、利用及刪除。您可拒絕提供個人資料，若您不願意提供真實且正確完整的個人資料，將影響您參加活動，收受出版品及優惠通知之權利。若您有個人資料權益相關問題，請洽<a href="mailto:top945@knsh.com.tw">top945@knsh.com.tw</a>。本人已閱讀並充分瞭解上述告知事項，並同意提供個人資料予康軒文教集團，於前述之目的範圍內蒐集、處理及利用個人資料。</p>
        </div>
        <br />
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="30" align="center" valign="top"><input type="checkbox" name="GetNews" id="GetNews" value="1"/></td>
            <td style="font-size:13px;">本人已閱讀詳讀以上規定並充分瞭解特別聲明告知事項，並同意提供個人資料
              予康軒文教集團，於前述之目的範圍內蒐集、處理及利用個人資料。 </td>
          </tr>
          <tr>
            <td align="center" valign="top">&nbsp;</td>
            <td align="center" style="font-size:13px;"><a href="javascript:Fun_Send();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image11','','images/btn_sure_over.jpg',1)"><img src="images/btn_sure_out.jpg" name="Image11" width="206" height="55" border="0" id="Image11" /></a></td>
          </tr>
          <tr>
            <td align="center" valign="top">&nbsp;</td>
            <td align="right" style="font-size:13px;"><img src="images/ps.jpg" width="231" height="17" /></td>
          </tr>
        </table>
      </div>
      <div style="width:804px;margin:0 auto;"><img src="images/form_bottom.jpg" width="804" height="36" /></div>
      <div style="padding:15px 280px 0 30px;font-size:13px;color:#0076c0;font-family:arial,'新細明體';line-height:22px;background:url(images/hobg.jpg) no-repeat;background-position:right bottom;height:325px;">
        <p style="margin:0px 0 -12px 20px;padding:0;"><span style="color:#004c87;"><strong>注意事項：</strong></span></p>
        <ol>
          <li>本活動至<span class="red">2015/09/30</span>截止，限定家中有3-12歲小朋友的家長親填本人資料索取乙次，未符合前述資格者恕無法寄送。
(Ex：索取學前版幼兒年齡需已滿3歲方符合資格)。</li>
          <li>您所申請的體驗教材將於填寫後4-5週寄送，且不適用於寄送至海外地區。</li>
          <li>加碼好禮抽獎活動將<span class="red">2015/10/07</span>公告於<a href="http://www.top945.com.tw/" target="_blank">康軒學習雜誌官網</a>。每位家長限一次抽獎資格。</li>
          <li>抽獎贈品將於<span class="red">2015/10/20</span>陸續寄送，贈品圖片僅供參考，以實物為準。為了保障您中獎通知與贈品寄送的權益，請填寫正確資料，如資料不全或資格不符者恕無法贈送。</li>
          <li>本活動以體驗教材為主，故不開放康軒學習雜誌現訂戶參加，敬請見諒。</li>
          <li>本活動由康軒學習雜誌提供，保留隨時更改、終止或變更活動之權利。客服專線02-86651740 (服務時間週一~週五9:00-12:00/14:00-17:30)</li>
        </ol>
      </div>
    </div>
  </div>
  <div><img src="images/pic_11.jpg" width="980" height="22" /></div>
  <div class="footer2">康軒文教事業 版權所有© 2015 Kang Hsuan Educational Publishing Corp. All Rights Reserved</div>
</div>
</form>
<!--#include file="marketing.asp"-->
</body>
</html>
<!--#include file="../../Include/Disconn.asp" -->