package com.example.myfirstproj;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private EditText edFName, edLName, edEmail;
    private TextView txtFName, txtLName, txtEmail;
    private Button btnRegister, btnViewAll;
    private EmployerModel empModel;
    private DatabaseHelper databaseHelper;
    private List<EmployerModel> empList;

    @Override
    public void onClick(View view) {
        switch (view.getId()){
            case R.id.btn_register:
                Toast.makeText(this,"Button is Clicked", Toast.LENGTH_SHORT).show();
                txtFName.setText("Your first name is " + edFName.getText().toString());
                txtLName.setText("Your last name is " + edLName.getText().toString());
                txtEmail.setText("Your email name is " + edEmail.getText().toString());
                empModel = new EmployerModel(-1, edFName.getText().toString(), edLName.getText().toString(), edEmail.getText().toString());
                boolean success = databaseHelper.addRecord(empModel);
                if(success) {
                    Toast.makeText(this, "Successfully Added", Toast.LENGTH_SHORT).show();
                }
                else {
                    Toast.makeText(this, "Something went wrong", Toast.LENGTH_SHORT).show();
                }
                break;
            case R.id.btn_viewAll:
                empList = databaseHelper.getAll();
                Toast.makeText(this, empList.toString(), Toast.LENGTH_LONG).show();
            default:
                break;
        }

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
//
//        txtHello = findViewById(R.id.txt_message);
//        btnHello  = findViewById(R.id.btn_hello);
//
//        // Edit Text using hard-coded value
//        txtHello.setText("Hello I updated this text.");
//
//        btnHello.setOnClickListener(this);

        //implement button click event
//        btnHello.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                txtHello.setText("Hi, I updated text using the button.");
//            }
//        });

//       ---------------------------------------------------------

        edFName = findViewById(R.id.edtTxt_fname);
        edLName = findViewById(R.id.edtTxt_lname);
        edEmail = findViewById(R.id.edtTxt_email);

        txtFName = findViewById(R.id.txt_fname);
        txtLName = findViewById(R.id.txt_lname);
        txtEmail = findViewById(R.id.txt_email);

        btnRegister = findViewById(R.id.btn_register);
        btnViewAll = findViewById(R.id.btn_viewAll);

        btnRegister.setOnClickListener(this);

        databaseHelper = new DatabaseHelper(this);
    }

}