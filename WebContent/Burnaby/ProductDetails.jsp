<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.brainysoftware.burnaby.Product" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="dbBean" scope="application"
class="com.brainysoftware.burnaby.DbBean"/>
<%
String base = (String) application.getAttribute("base");
String imageUrl = (String) application.getAttribute("imageUrl");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Details</title>
</head>
<body>
<TABLE>
<TR>
<TD COLSPAN=2><jsp:include page="Header.jsp" flush="true"/></TD>
</TR>
<TR>
<TD><jsp:include page="Menu.jsp" flush="true"/></TD>
<TD VALIGN="TOP">
<%
try {
int productId =
Integer.parseInt(request.getParameter("productId"));
Product product = dbBean.getProductDetails(productId);
if (product != null) {
%>
<TABLE>
<TR>
<TD><IMG BORDER="0" WIDTH="100" SRC="<%=(imageUrl +
product.id)%>.gif"></TD>
<TD><B><%=product.name%></B><BR>
<%=product.description%><BR>
Price : $<%=product.price%></TD>
</TR>
<TR>
<TD COLSPAN="2" ALIGN="RIGHT">
<A
HREF="<%=base%>?action=addShoppingItem&productId=<%=product.id%>">
Add To Cart</A>
</TD>
</TR>
</TABLE>
<%
}
}
catch (Exception e) {
out.println("Error: Invalid product identifier.");
}
%>
</TD>
</TR>
</TABLE>
</body>
</html>