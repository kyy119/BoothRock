<%@ page import="com.multi.FM.booth.BoothProductVO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="maxItems" value="8" />

<%
  List<BoothProductVO> boothProducts = (List<BoothProductVO>) request.getAttribute("boothProduct");
int maxItems = Integer.parseInt(pageContext.getAttribute("maxItems").toString());

for (int i = 0; i < maxItems; i++) {
  out.print("<li>");

  if (i < boothProducts.size() && boothProducts.get(i).getProduct() != null) {
    out.print(boothProducts.get(i).getProduct());
    out.print("<span>" + boothProducts.get(i).getPrice() + "</span>");
  } else {
    out.print("&nbsp;");
  }

  out.println("</li>");
}
%>

