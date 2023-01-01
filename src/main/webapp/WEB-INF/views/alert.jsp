<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	const msg = '${msg}'
	const url = '${url}'
	const fullurl = '${fullurl}'
	
	alert(msg)
	
	if (url == '' && fullurl == '') location.href = '${cpath}/'
	if (url == 'back') location.href = history.back()
	if (url != '') location.href = '${cpath}/' + url
	if (fullurl != '') location.href = fullurl
</script>

</body>
</html>