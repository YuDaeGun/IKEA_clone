<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	const url = '${url}'
	const fullurl = '${fullurl}'
	
	if (url == '' && fullurl == '') location.href = '${cpath}/'
	if (url != '') location.href = '${cpath}/' + url
	if (fullurl != '') location.href = fullurl
</script>

</body>
</html>