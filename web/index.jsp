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
<div class="container-fluid mt-5">
    <div class="row">
        <div class="col-6 mx-auto">

        </div>
    </div>
    <div class="row mb-2">
        <div class="col-12">
            <!-- Button trigger modal -->
            <button style=" font-size: 14px; height: 50px;width: 200px; background-color: darkblue" type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addTask">
                + Добавить задание
            </button>

            <!-- Modal -->
            <div class="modal fade" id="addTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Новое задание</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="/add-task" method="post">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-12">
                                        <label> Наименование : </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="text" class="form-control" name="task_name">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <label> Описание : </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <textarea class="form-control" name="task_description"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <label> Крайный срок : </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="date" class="form-control" name="task_deadlineDate">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                <button class="btn btn-primary">Добавить</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div><br>
    <div class="row">
        <div class="col-12">

            <table class="table">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Наименование</th>
                    <th scope="col">Крайный срок</th>
                    <th scope="col" style="width: 10%">Детали</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<Tasks> tasks = (ArrayList<Tasks>) request.getAttribute("tasks");
                    if(tasks != null){
                        for (Tasks task : tasks){
                %>
                <tr>
                    <td><%=task.getId()%></td>
                    <td><%=task.getName()%></td>
                    <td><%=task.getDeadlineDate()%></td>
                    <td><a class="btn btn-success btn-sm" href="/details?task_id=<%=task.getId()%>">Детали</a></td>

                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="/js/bootstrap.bundle.js"></script>
</body>
</html>