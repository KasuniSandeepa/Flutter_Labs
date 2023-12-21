package com.example.myfirstproj;

public class EmployerModel {

    private int eId;
    private String fName, lName, email;

    public EmployerModel(int eId, String fName, String lName, String email) {
        this.eId = eId;
        this.fName = fName;
        this.lName = lName;
        this.email = email;
    }

    public EmployerModel() {
    }

    public int geteId() {
        return eId;
    }

    public void seteId(int eId) {
        this.eId = eId;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "EmployerModel{" +
                "eId=" + eId +
                ", fName='" + fName + '\'' +
                ", lName='" + lName + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
