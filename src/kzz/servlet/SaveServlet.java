package kzz.servlet;

import kzz.db.DBManager;
import kzz.db.Tasks;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/save-task")
public class SaveServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("task_id"));
        String name = request.getParameter("task_name");
        String description = request.getParameter("task_description");
        String deadlineDate = request.getParameter("task_deadlineDate");

        Tasks tasks = DBManager.getTask(id);
        if (tasks != null){
            tasks.setName(name);
            tasks.setDeadlineDate(deadlineDate);
            tasks.setDescription(description);
            DBManager.updateTask(tasks);
            response.sendRedirect("/details?task_id=" + id);
        }else {
            response.sendRedirect("/");
        }
    }
}