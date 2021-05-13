<%@include file="myHeader.jsp"%>



<div class="login-form mg-top-10">
    <div class="well text-center">
        <%-- Here is all scriptlets--%>
        <%
            String name = (String) request.getAttribute("name");
        %>
         <%!   String user = "User"; %>

        <h1> <%=name != null ? name :  user%>,
            <jsp:useBean id="welcome" class="org.example.Zhanibek.model.Welcome"/>
            <%
                String m = welcome.welcome("Dashboard");
                out.print(m);
            %>
        </h1><br>
    </div>
</div>

</body>
</html>
