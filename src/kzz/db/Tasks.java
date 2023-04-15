package kzz.db;


public class Tasks {
    private int id;
    private String name;
    private String description;
    private String deadlineDate;

    public Tasks() {

    }

    public Tasks(int id, String name, String description, String deadlineDate) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.deadlineDate = deadlineDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {return description;}

    public void setDescription(String description) {this.description = description;}

    public String getDeadlineDate() {return deadlineDate;}

    public void setDeadlineDate(String deadlineDate) {this.deadlineDate = deadlineDate;}


}