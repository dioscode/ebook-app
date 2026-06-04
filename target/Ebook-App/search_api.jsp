<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%
response.setHeader("Access-Control-Allow-Origin","*");
String ch = request.getParameter("ch");
if (ch == null || ch.trim().isEmpty()) { out.print("[]"); return; }

BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
List<BookDtls> list = dao.getBookBySearch(ch.trim());

StringBuilder sb = new StringBuilder("[");
for (int i = 0; i < list.size() && i < 8; i++) {
    BookDtls b = list.get(i);
    if (i > 0) sb.append(",");
    String name   = b.getBookName().replace("\"","\\\"");
    String author = b.getAuthor().replace("\"","\\\"");
    String genre  = b.getGenre() != null ? b.getGenre().replace("\"","\\\"") : "";
    sb.append("{\"id\":").append(b.getBookid())
      .append(",\"name\":\"").append(name).append("\"")
      .append(",\"author\":\"").append(author).append("\"")
      .append(",\"price\":\"").append(b.getPrice()).append("\"")
      .append(",\"cat\":\"").append(b.getBookCategory()).append("\"")
      .append(",\"genre\":\"").append(genre).append("\"")
      .append("}");
}
sb.append("]");
out.print(sb.toString());
%>
