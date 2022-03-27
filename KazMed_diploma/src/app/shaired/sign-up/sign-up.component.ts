import { Component, OnInit } from '@angular/core';
import {MatDialog, MatDialogRef} from "@angular/material/dialog";
import {SignInComponent} from "../sign-in/sign-in.component";
import {FormBuilder, FormControl, FormGroup, Validators} from "@angular/forms";
import {AuthService} from "../../auth.service";
import {RequestService} from "../../request.service";
import {ActivatedRoute, Router} from "@angular/router";
import { BehaviorSubject } from 'rxjs';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {

  new = false;
  form!: FormGroup;

  constructor(private diologRef: MatDialogRef<SignUpComponent>, private dialog: MatDialog,  private currentRoute: ActivatedRoute, private auth: AuthService, private service: RequestService, private router: Router) {
    this.form = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      passqord: new FormControl('', [Validators.required, Validators.minLength(6)])
    })
    this.new = true;
  }


  ngOnInit(): void {
    this.getUsers();
  }

  signUp() {
    this.form.getRawValue();
    this.service.createUser(this.form.getRawValue()).subscribe(result => {
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
