<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>IKEA_clone</title>
	<!-- google font : https://fonts.google.com/noto/specimen/Noto+Sans+KR -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap" rel="stylesheet">

	<script src = "http://code.jquery.com/jquery-latest.js"></script> 

	<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/member.css">
	<script>const cpath = '${cpath}'</script>

	<script src="${cpath }/resources/js/member.js"></script>
</head>
<body>