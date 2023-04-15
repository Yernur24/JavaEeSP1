<%@ page import="java.util.ArrayList" %>
<%@ page import="kzz.db.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container-fluid mt-5 pb-5">
        <%
        Tasks tasks = (Tasks) request.getAttribute("tasks");
        if (tasks != null) {
    %>
    <div class="row">
        <div class="col-6 mx-auto">
            <div class="modal-body">
                <div class="row">
                    <div class="col-12">
                        <label> Наименование : </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="text" class="form-control" readonly value="<%=tasks.getName()%>">
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <label> Описание : </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <textarea class="form-control" readonly><%=tasks.getDescription()%></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <label> Крайный срок : </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="date" class="form-control" readonly value="<%=tasks.getDeadlineDate()%>">
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <button  style="margin-left: 8px" type="button" class="btn btn-sm btn-success mt-3" data-bs-toggle="modal"
                        data-bs-target="#editTask">
                    EDIT
                </button>
                <button type="button" class="btn btn-danger btn-sm mt-3 ms-2" data-bs-toggle="modal" data-bs-target="#delete">
                    Delete
                </button>
            </div>
        </div>
    </div>




    <div class="modal fade" id="delete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/deleteTask" method="post">
                    <input type="hidden" name="id" value="<%=tasks.getId()%>">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5">Confirm Delete</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h5 class="text-center">Are you sure?</h5>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">NO</button>
                        <button class="btn btn-danger">YES</button>
                    </div>
                </form>
            </div>
        </div>
    </div>



    <!-- Modal -->
            <div class="modal fade" id="editTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="/save-task" method="post">
                            <input type="hidden" name="task_id" value="<%=tasks.getId()%>">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-12">
                                        <label> Наименование : </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="text" class="form-control" name="task_name" value="<%=tasks.getName()%>">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <label> Описание : </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <textarea class="form-control" name="task_description"><%=tasks.getName()%></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <label>  Крайный срок :  </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="date" class="form-control" name="task_deadlineDate" value="<%=tasks.getDeadlineDate()%>">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button class="btn btn-success">Сохранить</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%
        }else {
        %>
        <h3 class="text-center"> TASK NOT FOUND </h3>
        <%
            }
        %>
    </div>
    <script src="/js/bootstrap.bundle.js"></script>
</body>
</html>