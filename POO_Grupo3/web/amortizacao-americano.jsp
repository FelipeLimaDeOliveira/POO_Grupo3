<%-- 
    Document   : amortizacao-americano
    Created on : 05/04/2018, 14:44:28
    Author     : Anthony
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
        <title>Sistema de Amortização Americano</title>
    <body>
<section id="just-intro">
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <!--<h1>Amortização Americano</h1>-->
        <div class="container" style="align-content: center">
            <h2>Sistema de Amortização Americano</h2>
            <hr/>

            <div class="container" margin: 0>
                <br/>
                
                <form class="form-horizontal">
                    <form>
                <table>
                    <tr>
                        <td>Valor:</td><td><input type="text" name="valor"/></td>
                    </tr>
                    <tr>
                        <td>Período:</td><td><input type="number" name="periodo"/></td>
                    </tr>
                    <tr>
                        <td>Juros (%a.m.):</td><td><input type="text" name="juros"/></td>
                    </tr>
                    <tr><center><td colspan="2"><input type="submit" value="Calcular"/></td></center></tr>
                </table>
            </form>
            <%
                int periodo = 0;
                try {
                    periodo = Integer.parseInt(request.getParameter("periodo"));
                } catch (Exception e) {
                }
                float valor = 0;
                try {
                    valor = Float.parseFloat(request.getParameter("valor"));
                } catch (Exception e) {
                }
                float juros = 0;
                try {
                    juros = Float.parseFloat(request.getParameter("juros"));
                } catch (Exception e) {
                }
                DecimalFormat cvalor = new DecimalFormat("#0.00");
                DecimalFormat cjuros = new DecimalFormat("#0.00");
            %>
   
            </div>
            <div class="container">
                <br><br>
                <div class="row">
                    <div class="col-sm-6">
                        <table border="1">
                            <tr>
                                <th>Mês</th>
                                <th>Saldo Devedor (R$)</th>
                                <th>Amortização (R$)</th>
                                <th>Juros (R$)</th>
                                
                            </tr>
                            <%for (int i = 0; i <= periodo; i++) {%>
                            <tr>
                                <td><%=i%></td>
                                <%if (i == periodo) {
                                        out.println("<td>" + cvalor.format(0) + "</td>");
                                    } else {
                                        out.println("<td>" + cvalor.format(valor) + "</td>");
                                    }%>
                                <%if (i == periodo) {
                                        out.println("<td>" + cvalor.format(valor) + "</td>");
                                    } else {
                                        out.println("<td>" + cvalor.format(0) + "</td>");
                                    }%>
                                <%if (i != 0) {
                                        out.println("<td>" + cjuros.format(valor * juros * 0.01) + "</td>");
                                    } else {
                                        out.println("<td>" + cjuros.format(0) + "</td>");
                                    }%>                
                            </tr>
                            
                            <%}%>
                        </table>
                        <br/><br/>
                        
                        <h5>Juros total: R$ <%=cjuros.format(periodo * valor * juros * 0.01)%></h5>
                        <br/>
                        <h5>Dívida total: R$ <%=cvalor.format((periodo * valor * juros * 0.01) + valor)%></h5>
                        
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <br/>
</section>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
