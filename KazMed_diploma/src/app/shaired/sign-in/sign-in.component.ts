import { Component, OnInit } from '@angular/core';
import {FormBuilder, FormControl, FormGroup, Validators} from "@angular/forms";
import {AuthService, User} from "../../auth.service";
import {SignUpComponent} from "../sign-up/sign-up.component";
import {MatDialog, MatDialogRef} from "@angular/material/dialog";
import {Router} from "@angular/router";

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {

  submitted: boolean = false;
  form!: FormGroup;

  constructor(
    private diologRef: MatDialogRef<SignInComponent>,
    private dialog: MatDialog,
    public auth: AuthService,
    private formBuilder: FormBuilder,
    private router: Router
  ) {}

  login() {
    if(this.form.invalid) {
      return
    }
    console.log(this.form);

    this.submitted = true;

    const user: User = {
      email: this.form.value.email,
      password: this.form.value.password
    }

    this.auth.login(user).subscribe(() => {
      this.form.reset();
      this.diologRef.close();
      this.router.navigate(['../service']);
      this.submitted = false;
    }, () => this.submitted = false)
  }

  public getErrorMessage() {
    const EMAIL = this.form.value.email;
    if(EMAIL.hasError('required')) {
      this.submitted = true;
      return 'You must enter email'
    }
    return EMAIL.hasError('email') ? 'Not a valid email' : this.submitted = true, '';
  }

  // this.diologRef.close();
  // this.router.navigate(['../doctors']);

  ngOnInit(): void {
    this.initForm();
  }

  initForm(): void {
    this.form = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required, Validators.minLength(6)])
    })
  }

  signUp(){
    this.dialog.open(SignUpComponent, {
      width: '500px'
    })
  }

}
