<%@include file="myHeader.jsp"%>

<div class="login-form">
    <div class="well">
        <h3>Update status</h3>
        <form action="ChangeStatusServlet" method="post" align="center">
            <input type="hidden" name="action" value="update">
            <label for="noteId">Note ID</label>
            <input type="text" class="" placeholder="Enter Book ID" name="noteId" id="noteId"><br>
            <label for="status">Note status</label>
            <input type="text" class="" placeholder="false or true" name="status" id="status"><br>
            <button type="submit" name="action" value="update">Update</button>
            <br>
            <p><c:out value="${message}"/></p>
        </form>
    </div>
</div>

</body>
</html>
