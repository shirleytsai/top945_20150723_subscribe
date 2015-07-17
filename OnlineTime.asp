<%
if Now()>Cdate("2015/09/30 23:59:59") then
	call GoUrl("本活動已截止，感謝支持!","index.asp")	
end if	
%>