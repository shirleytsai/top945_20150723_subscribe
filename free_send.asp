<!--#include file="../../Include/Code.asp"-->
<!--#include file="OnlineTime.asp" -->

<!--#include file="../../Include/Conn.asp"-->
<!--#include file="click_logs.asp"-->

<%

IsMobile = Replace(Request("IsMobile"),"'","")
if IsMobile="Y" then
   Str_redrPath="mobile/"
   if InStr(1,Request.ServerVariables("HTTP_USER_AGENT"),"Android",1)>0 then 
       UseDevice="Android" 
   elseif InStr(1,Request.ServerVariables("HTTP_USER_AGENT"),"iPhone",1)>0 then 
       UseDevice="iPhone" 
   elseif InStr(1,Request.ServerVariables("HTTP_USER_AGENT"),"iPad",1)>0 then 
       UseDevice="iPad" 
   else 
       UseDevice="else" 
   end if   
else
    Str_redrPath=""
	UseDevice=""
end if

'判斷有無索取過  索取版本+Phone or Phone
StepAB = Replace(Request("StepAB"),"'","")
Email = Replace(Request("Email"),"'","")
Phone = Replace(Request("Phone"),"'","")
pjid = Replace(Request("pjid"),"'","")

'SQL = "select top 1 ID from Event_20140401 where StepAB = '"&StepAB&"' and Email = '"&Email&"' and Active = N'1' and Del = N'0' order by ID"
'SQL = "select top 1 ID from Event_20140401 where  Phone = '"&Phone&"' and Active = N'1' and Del = N'0' order by ID"
SQL = "select top 1 ID from T_Event where Phone = '"&Phone&"' and Active = N'1' and Del = N'0' and ProjID =" & pjid  

Set rs = Conn.Execute(SQL)
If Not rs.EOF Then	
	'call GoBack("您的資料之前已填寫過，請勿重覆索取。")
	call GoUrl("您的資料之前已填寫過，請勿重覆索取。", Str_redrPath & "free.asp?cf=" & paraCFCode)
end if		
rs.Close
Set rs = Nothing

' click logs
'Dim paraCFCode
'paraCFCode = Replace(Request("CF"),"'","")
'Dim paraRemote_Addr
'paraRemote_Addr = Request.ServerVariables("REMOTE_ADDR")

If logID = "-1" then
SQL = "Select ID From T_log Where REMOTE_ADDR = '" & paraRemote_Addr & "' And CFCode = '" & paraCFCode & "' And DT >= '" & ShowDateTime(DateAdd("h",-1,Now())) & "'"
Set rs = Conn.Execute(SQL)
If Not rs.EOF Then	
	logID = rs("ID")
end if		
rs.Close
Set rs = Nothing
end if 
  
BYear = Replace(Request("Year"),"'","")
BMonth = Replace(Request("Month"),"'","")
'BDay = Replace(Request("Day"),"'","")
'birthday = BYear&BMonth&BDay
birthday = BYear&BMonth


Name = Replace(Request("Name"),"'","")
Tel_O1 = Replace(Request("Tel_O1"),"'","")
Tel_O2 = Replace(Request("Tel_O2"),"'","")
Tel_O3 = Replace(Request("Tel_O3"),"'","")
Tel_O = Tel_O2 
if Tel_O1<>"" then
   Tel_O = Tel_O1 & "-" & Tel_O2
end if
if Tel_O3<>"" then
   Tel_O = Tel_O & "#" & Tel_O3
end if

Tel_H = ""
Phone = Replace(Request("Phone"),"'","")
City = Replace(Request("City"),"'","")
Area = Replace(Request("Area"),"'","")
ZipCode = Replace(Request("ZipCode"),"'","")
Address = Replace(Request("Address"),"'","")
StudentName = ""
SQL = "Select A.CodeText as City,B.CodeText as Area From VW_KnshWebDB_SystemCodeDefined A,VW_KnshWebDB_SystemCodeDefined B Where A.ID='"&City&"' And A.Active = N'1' And B.ID = N'"&Area&"' And B.Active = N'1'"
Set rs = Conn.Execute(SQL)
if not rs.EOF then
	City = rs("City")
	Area = rs("Area")
end if

TAddress = City&Area&Address
Sex = ""
'TopSource = Request("TopSource")
'OtherSource = Replace(Request("OtherSource"),"'","")
GetNews = Replace(Request("GetNews"),"'","")

SQL = "Insert into T_Event ( REMOTE_ADDR,CFCode,StepAB,Name,Tel_O,Tel_H,Phone,Email,ZipCode,Address,StudentName,Sex,birthday,GetNews, NewDate, NewUser, UpdDate, UpdUser, Active, Del, ProjID,IsMobile,UseDevice ) Values ("  &_
       "'" & paraRemote_Addr & "', " &_
	   "'" & paraCFCode & "', " &_
       "N'" & StepAB & "', " &_
       "N'" & Name & "', " &_
       "N'" & Tel_O & "', " &_
       "N'" & Tel_H & "', " &_
       "N'" & Phone & "', " &_
	   "N'" & Email & "', " &_	   
	   "N'" & ZipCode & "', " &_
	   "N'" & TAddress & "', " &_
	   "N'" & StudentName & "', " &_
	   "N'" & Sex & "', " &_
	   "N'" & birthday & "', " &_
	   "N'" & GetNews & "', " &_
       "N'" & GetDateTime() & "', " &_
       "N'" & 0 & "', " &_
       "N'" & GetDateTime() & "', " &_
       "N'" & 0 & "', " &_
       "N'" & 1 & "', " &_
	   "N'" & 0 & "', " &_
	   pjid  & ", " &_
	   "N'" & IsMobile & "', " &_
	   "N'" & UseDevice & "' )"
	   'response.write SQL
	   'response.end
Conn.Execute(SQL)
'call GoUrl("您的索閱資料，我們已經收到了！\n祝您中獎，謝謝～","index.html") 
Response.Redirect Str_redrPath & "sure.asp?cf="&paraCFCode
%>
<!--#include file="../../Include/Disconn.asp" -->