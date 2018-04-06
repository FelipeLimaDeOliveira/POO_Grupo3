<%-- 
    Document   : tablea-price
    Created on : 05/04/2018, 10:48:31
    Author     : Paulo
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <h1>Tabela Price</h1>
        <% int i = 0;
           double pmt = 0, j = 0, a = 0, pv, v = 0, tx = 0;
        %>
            <form>
                <table>
                    <tr>
                        <td>Valor:</td><td><input type="text" name="valor"/></td>
                    </tr>
                    <tr>
                        <td>Periodo:</td><td><input type="number" name="periodo"/></td>
                    </tr>
                    <tr>
                        <td>Taxa de Juros:</td><td><input type="text" name="juros"/></td>
                    </tr>
                    <tr><center><td colspan="2"><input type="submit" value="Enviar"/></td></center></tr>
                </table>
            </form>
        <hr>
            <%
                
                try
                {
                    v = Double.parseDouble(request.getParameter("valor"));
                    tx = Double.parseDouble(request.getParameter("juros"));
                    i = Integer.parseInt(request.getParameter("periodo"));
                }
                catch(Exception ex)
                {
                    
                }
                tx = tx/100;
                pv = v;
                pmt = v*(tx/(1-(1/(Math.pow((1+tx), i)))));
                DecimalFormat df = new DecimalFormat("###,##0.00");
            %>
            <%if(i!=0 && v!=0 && tx!=0){%>
            <table border="1">
                <tr>
                    <th>Periodo</th><th>Saldo Devedor</th><th>Parcela</th><th>Juros</th><th>Amortização</th>
                </tr>
                <%for(int cont = 0; cont <= i; cont++){%>
                <tr>
                    <td>
                        <%=cont%>
                    </td>
                    <td>
                        <%if(cont>0){%>
                            <%pv = pv - a;%>
                        <%}%>
                        <%=df.format(pv)%>
                    </td>
                    <td>
                        <%if(cont>0){%>
                            <%=df.format(pmt)%>
                        <%}%>
                    </td>
                    <td>
                        <%if(cont>0){%>
                            <%=df.format(j)%>
                        <%}%>
                        <%j = pv * tx;%>
                    </td>
                    <td>
                        <%if(cont>0){%>
                            <%=df.format(a)%>
                        <%}%>
                        <%a = pmt - j;%>
                    </td>
                </tr>
                <%}%>
            </table>
            <%}%>
            <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
