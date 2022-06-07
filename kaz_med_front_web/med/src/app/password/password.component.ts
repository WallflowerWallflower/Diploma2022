import { Component, OnInit } from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";

@Component({
  selector: 'app-password',
  templateUrl: './password.component.html',
  styleUrls: ['./password.component.scss']
})
export class PasswordComponent implements OnInit {
  changeForm:any = FormGroup;
  isCorrect:boolean = false;
  constructor() { }

  ngOnInit(): void {
    this.changeForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required, Validators.minLength(5)]),
      password2: new FormControl('', [Validators.required, Validators.minLength(5)])
    })
  }
  onSubmit(){
    // if (this.changeForm.password.value !== this.changeForm.password.value){
    //   this.isCorrect = true;
    // }
    console.log(this.changeForm.password.value);
  }

}
