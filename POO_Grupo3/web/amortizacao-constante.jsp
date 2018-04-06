<%-- 
    Document   : amortizacao-constante
    Created on : 05/04/2018, 10:47:53
    Author     : Paulo
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>
    <body>
        <h1>Amortização Constante</h1>
        <% int k = 0;
           double r = 0, j = 0, a, sd, v = 0, tx = 0, acJ = 0, acR = 0;
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
                    k = Integer.parseInt(request.getParameter("periodo"));
                }
                catch(Exception ex)
                {
                    
                }
                tx = tx/100;
                sd = v;
                a = v/k;
                DecimalFormat df = new DecimalFormat("###,##0.00");
            %>
            <%if(k!=0 && v!=0 && tx!=0){%>
            <table border="1">
                <tr>
                    <th>Periodo</th><th>Prestação</th><th>Juros</th><th>Amortização</th><th>Saldo Devedor</th>
                </tr>
                <%for(int i = 0; i <= k; i++){%>
                <tr>
                    <td>
                        <%=i%>
                    </td>
                    <td>
                        <%j = sd*tx;
                          r = a + j;
                          acR = acR + r;%>
                        <%if(i>0){%>
                            <%=df.format(r)
                                //df.format(r);
                            %>
                        <%}%>
                    </td>
                    <td>
                        <%j = sd*tx;
                          acJ = acJ + j;%>
                        <%if(i>0){%>
                            <%=df.format(j)%>
                        <%}%>
                    </td>
                    <td>
                        <%if(i>0){%>
                            <%=df.format(a)%>
                        <%}%>
                    </td>
                    <td>
                        <%
                            sd=sd-a;
                        %>
                        <%=df.format(sd+a)%>
                    </td>
                </tr>
                <%}%>
                <tr>
                    <th>Total</th><td><%=df.format(acR)%></td><td><%=df.format(acJ)%></td><td><%=v%></td><td>-</td>
                </tr>
            </table>
            <%}%>
    </body>
</html>
