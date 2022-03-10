import { Component, OnInit } from '@angular/core';
import {MatDialog, MatDialogRef} from "@angular/material/dialog";
import {SignInComponent} from "../sign-in/sign-in.component";
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {AuthService} from "../../auth.service";
import {RequestService} from "../../request.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {

  new = false;
  formG: FormGroup;

  constructor(private diologRef: MatDialogRef<SignUpComponent>, private dialog: MatDialog, private auth: AuthService, private formBuilder: FormBuilder, private service: RequestService, private router: Router) {
    this.formG = this.formBuilder.group({
      name: ['', Validators.required],
      surname: ['', Validators.required],
      email: ['', Validators.required],
      password: ['', [Validators.required, Validators.minLength(8)]]
    });
    this.new = true;
  }


  ngOnInit(): void {
    this.getUsers();
  }

  signUp() {
    this.formG.getRawValue();
    this.service.createUser(this.formG.getRawValue()).subscribe(result => {
      this.getUsers();
    });
    alert("Success!");
    this.signIn();
  }

  getUsers() {
    this.service.getAllUsers().subscribe(res => {
    });
  }

  signIn(){
    this.dialog.open(SignInComponent, {
      width: '500px'
    });
    this.diologRef.close();
  }
}
