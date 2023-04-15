package kzz.db;

import java.util.ArrayList;

public class DBManager {

    private static final ArrayList<Tasks> tapsyrma = new ArrayList<>();

    private static int id = 1;

    public static ArrayList<Tasks> getTasks(){
        return tapsyrma;
    }
    public  static void addTasks(Tasks tasks){
        tasks.setId(id);
        tapsyrma.add(tasks);
        id++;
    }

    public static Tasks getTask(int id){
        return tapsyrma.stream().
                filter(tasks -> tasks.getId()==id).
                findFirst().
                orElse(null);
    }

    public static void updateTask(Tasks task){
        for (int i = 0; i < tapsyrma.size(); i++){
            if (tapsyrma.get(i).getId() == task.getId()){
                tapsyrma.set(i, task);
                break;
            }
        }
    }

    public static void deleteTask(int id) {
        for (int i = 0; i < tapsyrma.size(); i++) {
            if (tapsyrma.get(i).getId() == id) {
                tapsyrma.remove(i);
                break;
            }
        }
    }

}