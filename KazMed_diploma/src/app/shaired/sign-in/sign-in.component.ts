import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {AuthService} from "../../auth.service";
import {SignUpComponent} from "../sign-up/sign-up.component";
import {MatDialog, MatDialogRef} from "@angular/material/dialog";
import {Router} from "@angular/router";

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {

  formG: FormGroup;

  constructor(
    private diologRef: MatDialogRef<SignInComponent>,
    private dialog: MatDialog,
    private auth: AuthService,
    private formBuilder: FormBuilder,
    private router: Router
  ) {
    this.formG = this.formBuilder.group({
      email: ['', Validators.required],
      password: ['', [Validators.required, Validators.minLength(8)]],
      // , Validators.pattern('^[A-Za-z]')
    });
  }

  login() {
    const ans = this.auth.login(this.formG.getRawValue().email, this.formG.getRawValue().password);
    if (ans) {
      this.diologRef.close();
      this.router.navigate(['../doctors']);
    }
  }

  ngOnInit(): void {
  }

  signUp(){
    this.dialog.open(SignUpComponent, {
      width: '500px'
    })
  }

}
