<%@include file="myHeader.jsp"%>

<div class="login-form">
    <div class="well">
        <h3>ADD a Note</h3>
        <form action="AddNoteServlet" method="post" align="center">
            <label for="title">Note Title</label>
            <input type="text" class="" placeholder="Enter the title" name="title" id="title"><br>
            <label for="date"><abbr title="target date">Target date</abbr></label>
            <input type="text" class="" placeholder="DD/MM/YYYY" name="date" id="date" align="right"><br>
            <label for="status">Note status</label>
            <input type="text" class="" placeholder="false or true" name="status" id="status"><br>
            <button type="submit" name="action" value="update">Add</button>
            <br>
            <p><c:out value="${message}"/></p>
        </form>
    </div>
</div>
</body>
</html>
