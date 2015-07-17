<%
Dim paraCFCode
paraCFCode = Replace(Replace(Request("CF"),"'",""),"#","")
Dim paraRemote_Addr
paraRemote_Addr = Request.ServerVariables("REMOTE_ADDR")
Dim logID
logID = -1

SQL = "Select ID From T_Log Where REMOTE_ADDR = '" & paraRemote_Addr & "' And CFCode = '" & paraCFCode & "' And DT >= '" & ShowDateTime(DateAdd("h",-1,Now())) & "'"
Set rs = Conn.Execute(SQL)
If rs.EOF Then
 SQLDetail = "Insert into T_Log ( REMOTE_ADDR,CFCode,QUERY_STRING,HTTP_REFERER, PATH_INFO, HTTP_USER_AGENT,DT ) Values ("  &_
             "'" & paraRemote_Addr & "', " &_
			 "'" & paraCFCode & "', " &_
             "N'" & Request.ServerVariables("QUERY_STRING") & "', " &_			 
             "N'" & Request.ServerVariables("HTTP_REFERER") & "', " &_
             "N'" & Request.ServerVariables("PATH_INFO") & "', " &_
             "N'" & Request.ServerVariables("HTTP_USER_AGENT") & "', "  &_
             "'" & GetDateTime() & "')"
 Conn.Execute(SQLDetail)
else 
 logID = rs("ID")
End If
rs.Close
Set rs = Nothing
%>
