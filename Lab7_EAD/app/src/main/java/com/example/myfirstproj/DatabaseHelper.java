package com.example.myfirstproj;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.List;

public class DatabaseHelper  extends SQLiteOpenHelper {

    public static final String EMPLOYER_TABLE = "EMPLOYER_TABLE";
    public static final String E_ID = "E_ID";
    public static final String F_NAME = "F_NAME";
    public static final String L_NAME = "L_NAME";
    public static final String EMAIL = "EMAIL";


    public DatabaseHelper(@Nullable Context context) {
        //name --> Database Name
        super(context, "employer", null, 1);
    }

    // this is called the first time a database is accessed.
    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        String createTableStmnt = "CREATE TABLE " + EMPLOYER_TABLE + " (" + E_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " + F_NAME + ", " + L_NAME + ", " + EMAIL + ")";
        sqLiteDatabase.execSQL(createTableStmnt);

    }

    // this is called if the database version number is changed.
    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {

    }

    public boolean addRecord(EmployerModel empMod) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues cv = new ContentValues();

        cv.put(F_NAME, empMod.getfName());
        cv.put(L_NAME, empMod.getlName());
        cv.put(EMAIL, empMod.getEmail());

        long insertSuccess = db.insert(EMPLOYER_TABLE, null, cv);
        if(insertSuccess == -1) {
            return false;
        }
        return true;
    }

    public List<EmployerModel> getAll() {
        List<EmployerModel> returnlist = new ArrayList<>();

        String query = "SELECT * FROM " + EMPLOYER_TABLE;

        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(query, null);

        if(cursor.moveToFirst()) {
            do {
                int eID = cursor.getInt(0);
                String fName = cursor.getString(1);
                String lName = cursor.getString(2);
                String email = cursor.getString(3);

                EmployerModel empModel = new EmployerModel(eID, fName, lName, email);
                returnlist.add(empModel);

            } while (cursor.moveToNext());
        }

        return returnlist;
    }
}
