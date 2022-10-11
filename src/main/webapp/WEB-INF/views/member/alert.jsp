<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
	const msg = '${msg}'
	const url = '${url}'
	
	alert(msg)
	
	if (url == '') location.href = '${cpath}/'
	if (url == 'back') location.href = history.back()
	location.href = '${cpath}/' + url
</script>

</body>
</html>