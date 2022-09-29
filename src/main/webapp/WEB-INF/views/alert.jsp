<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
	const msg = '${msg}'
	const url = '${url}'
	
	console.log(msg)
	console.log(url)
	console.log('${cpath}')
	
	alert(msg)
	
	if (url != null) location.href = '${cpath}/' + url
	history.go(-1)
</script>

</body>
</html>